// ternary_dot.v
// SPDX-License-Identifier: CERN-OHL-S-2.0
// Copyright (C) 2026 Ifedayo Oladapo
// TernaryCore — Open-Source FPGA Accelerator for BitNet Inference
// Source: https://github.com/shepherdscientific/ternarycore
//
// Streaming ternary dot product.
// Accumulates VECTOR_LEN ternary MAC operations in series.
// Weight encoding: 2-bit {00=zero, 01=+1, 10=-1}
//
// Output timing:
//   valid_out pulses HIGH exactly ONE cycle after the last element is fed.
//   acc_out holds the result for that cycle. valid_out self-clears the
//   following cycle and acc is reset for the next vector on the done edge.
//   Back-to-back vectors require no bubble: the cycle after a done edge may
//   immediately present the first element of the next vector.
//
// Counter strategy: DOWN-counter loaded with VECTOR_LEN, counts down to 1.
//   Terminal condition is (count == 16'b1). A literal comparison is used
//   rather than a parameter expression to avoid Icarus Verilog elaboration-
//   time bit-width inference bugs on (count == VECTOR_LEN-1).
//   No $clog2 needed; plain reg [15:0] supports up to 65535 elements.

`timescale 1ns / 1ps

module ternary_dot #(
    parameter DATA_WIDTH = 8,
    parameter ACC_WIDTH  = 32,
    parameter VECTOR_LEN = 64
)(
    input  wire                   clk,
    input  wire                   rst_n,
    input  wire                   valid_in,
    input  wire [DATA_WIDTH-1:0]  activation,
    input  wire [1:0]             weight_enc,   // 00=0, 01=+1, 10=-1
    output reg  [ACC_WIDTH-1:0]  acc_out,
    output wire                   valid_out
);

`include "ternary_defines.vh"

    wire signed [DATA_WIDTH:0] weighted;
wire [ACC_WIDTH-1:0] weighted_ext;
wire [ACC_WIDTH-1:0] next_acc;
reg [ACC_WIDTH-1:0] acc;
reg [15:0]          count;
reg                 vector_done;

// Combinational decode via ternary_weighted function from ternary_defines.vh.
assign weighted = ternary_weighted(weight_enc, $signed(activation));
assign weighted_ext = {{(ACC_WIDTH-DATA_WIDTH-1){weighted[DATA_WIDTH]}}, weighted};
assign next_acc = acc + weighted_ext;

    // ── Main sequential logic ─────────────────────────────
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            acc        <= {ACC_WIDTH{1'b0}};
            count      <= VECTOR_LEN[15:0]; // load down-counter (counts VECTOR_LEN down to 1)
            acc_out    <= {ACC_WIDTH{1'b0}};
            vector_done <= 1'b0;
        end else begin
            // ── Accumulation + counter stage ──────────────────────
            // Accumulate whenever valid_in is high. Back-to-back vectors
            // are fully supported: after the done edge reloads count to
            // VECTOR_LEN, the very next valid_in cycle begins accumulating
            // the new vector (count != 1) while vector_done self-clears.
            if (valid_in) begin
                if (count == 16'b1) begin
                    // Last element — latch result, set done flag, reload counter.
                    acc_out     <= next_acc;
                    vector_done <= 1'b1;
                    acc        <= {ACC_WIDTH{1'b0}};   // reset for next vector
                    count      <= VECTOR_LEN[15:0];
                end else begin
                    vector_done <= 1'b0;
                    acc        <= next_acc;
                    count      <= count - 16'b1;
                end
            end else begin
                // valid_in=0: nothing to accumulate. Self-clear vector_done
                // so valid_out pulses exactly once (never sticky-high).
                vector_done <= 1'b0;
            end
        end
    end

    // ── Output stage ─────────────────────────────────
    assign valid_out = vector_done;

`ifdef FORMAL
    // count must never underflow below 1
    always @(posedge clk) begin
        if (rst_n)
            assert(count >= 16'd1);
    end
    always @(posedge clk) begin
        if (rst_n)
            assert(count <= VECTOR_LEN);
    end

    // vector_done must self-clear after 1 cycle
    reg f_vd_d1;
    always @(posedge clk) begin
        if (!rst_n) f_vd_d1 <= 0;
        else f_vd_d1 <= vector_done;
    end
    always @(posedge clk) begin
        if (rst_n)
            assert(!(vector_done && f_vd_d1));
    end

    // Terminal feed (count==1 && valid_in) → valid_out next cycle
    reg f_term;
    always @(posedge clk) begin
        if (!rst_n) f_term <= 0;
        else f_term <= valid_in && count == 16'd1;
    end
    always @(posedge clk) begin
        if (rst_n && f_term)
            assert(valid_out);
    end

    // Coherency: when valid_out fires, count is reloaded to VECTOR_LEN
    always @(posedge clk) begin
        if (rst_n && valid_out)
            assert(vector_done);
    end
    always @(posedge clk) begin
        if (rst_n && valid_out)
            assert(count == VECTOR_LEN);
    end
`endif

endmodule
