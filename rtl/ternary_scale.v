// SPDX-License-Identifier: CERN-OHL-S-2.0
// BitNet b1.58 per-channel scale multiplier.
//
// Post-MAC: y = round(acc * alpha >> PRECISION)
// where alpha is the learned per-channel scale (fixed-point).
// Q15: 1.0 = 32768, 2.0 = 65536, etc.  Max representable = 65535 * 2 = ~2.0.
//
// COLS: number of parallel channels.
// Pipeline: 2 cycles (multiply -> shift+pack+round).

`timescale 1ns / 1ps

module ternary_scale #(
    parameter ACC_WIDTH  = 32,
    parameter COLS       = 4,
    parameter PRECISION  = 15   // Q15: 1.0 = 32768
)(
    input  wire                         clk,
    input  wire                         rst_n,
    input  wire                         valid_in,
    input  wire  [COLS*ACC_WIDTH-1:0]   acc_in,    // packed GEMM results
    input  wire  [COLS*(PRECISION+1)-1:0]   alpha,     // per-channel scales (QPRECISION: 1.0 = 2^PRECISION)
    output reg   [COLS*ACC_WIDTH-1:0]   result,
    output reg                          valid_out
);

    // Per-channel product registers
    reg [ACC_WIDTH+PRECISION:0] prod [0:COLS-1];  // 32+16 = 48 bits

    // Stage 1: per-channel multiply (generate loop)
    genvar g;
    generate
        for (g = 0; g < COLS; g = g + 1) begin : channel_mul
            always @(posedge clk or negedge rst_n) begin
                if (!rst_n)
                    prod[g] <= 0;
                else if (valid_in)
                    prod[g] <= $signed(acc_in[g*ACC_WIDTH +: ACC_WIDTH]) *
                               $signed({1'b0, alpha[g*(PRECISION+1) +: PRECISION+1]});
            end
        end
    endgenerate

    // Stage 2: shift, round, pack (2nd cycle)
    reg valid_d1;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            valid_d1  <= 0;
            valid_out <= 0;
        end else begin
            valid_d1  <= valid_in;
            valid_out <= valid_d1;
        end
    end

    /* verilator lint_off UNUSEDSIGNAL */
    function [ACC_WIDTH-1:0] scale_ch;
        input [ACC_WIDTH+PRECISION:0] p;  // 48 bits
        reg [PRECISION:0] trunc;
        reg round;
        reg signed [ACC_WIDTH+PRECISION:0] shifted;
        begin
            trunc   = p[PRECISION:0];
            round   = |trunc;
            shifted = p >>> PRECISION;
            scale_ch = shifted[ACC_WIDTH-1:0] + round;
        end
    endfunction
    /* verilator lint_on UNUSEDSIGNAL */

    generate
        for (g = 0; g < COLS; g = g + 1) begin : channel_result
            always @(posedge clk or negedge rst_n) begin
                if (!rst_n)
                    result[g*ACC_WIDTH +: ACC_WIDTH] <= 0;
                else if (valid_d1)
                    result[g*ACC_WIDTH +: ACC_WIDTH] <= scale_ch(prod[g]);
            end
        end
    endgenerate

endmodule