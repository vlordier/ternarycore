// axi_gemm_weight_formal.v
// Bug Hunt: Cross-layer weight register concatenation.
//
// Writes WEIGHT_ENC_LO then WEIGHT_ENC_HI at COLS=17 (so both registers
// are concatenated: {weight_enc_hi[1:0], weight_enc_lo[31:0]} for 2*COLS=34),
// triggers pipeline, asserts gemm receives the concatenated value.

`timescale 1ns / 1ps

module axi_gemm_weight_formal(
    input wire clk
);
    parameter DATA_WIDTH = 8;
    parameter ACC_WIDTH  = 32;
    parameter COLS       = 17;
    parameter DEPTH      = 4;

    localparam ADDR_ACTIVATION    = 8'h04;
    localparam ADDR_WEIGHT_ENC_LO = 8'h08;
    localparam ADDR_WEIGHT_ENC_HI = 8'h0C;
    localparam ADDR_CTRL          = 8'h00;
    localparam CTRL_START         = 32'h00000001;

    localparam [31:0] LO_VAL = 32'hAAAAAAAA;
    localparam [31:0] HI_VAL = 32'hBBBBBBBB;
    localparam [33:0] EXPECTED = {HI_VAL[1:0], LO_VAL};

    wire s_axi_aclk;
    wire s_axi_aresetn;
    reg  [7:0]   s_axi_awaddr;
    wire [2:0]   s_axi_awprot;
    reg          s_axi_awvalid;
    wire         s_axi_awready;
    reg  [31:0]  s_axi_wdata;
    wire [3:0]   s_axi_wstrb;
    reg          s_axi_wvalid;
    wire         s_axi_wready;
    wire [1:0]   s_axi_bresp;
    wire         s_axi_bvalid;
    reg          s_axi_bready;
    wire [7:0]   s_axi_araddr;
    wire [2:0]   s_axi_arprot;
    wire         s_axi_arvalid;
    wire         s_axi_arready;
    wire [31:0]  s_axi_rdata;
    wire [1:0]   s_axi_rresp;
    wire         s_axi_rvalid;
    wire         s_axi_rready;

    assign s_axi_aclk = clk;
    assign s_axi_awprot = 3'b000;
    assign s_axi_wstrb  = 4'b1111;
    assign s_axi_arprot = 3'b000;
    assign s_axi_araddr  = 8'h00;
    assign s_axi_arvalid = 1'b0;
    assign s_axi_rready  = 1'b0;

    axi_gemm_wrapper #(
        .DATA_WIDTH(DATA_WIDTH),
        .ACC_WIDTH(ACC_WIDTH),
        .COLS(COLS),
        .DEPTH(DEPTH)
    ) dut (
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_awready(s_axi_awready),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid),
        .s_axi_wready(s_axi_wready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_arready(s_axi_arready),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_rready(s_axi_rready)
    );

    // ── Reset (same pattern as axi_gemm_wrapper_formal) ──
    reg [1:0] reset_cnt;
    initial reset_cnt = 0;
    always @(posedge clk) begin
        if (reset_cnt < 2) begin
            assume(!s_axi_aresetn);
            reset_cnt <= reset_cnt + 1;
        end else begin
            assume(s_axi_aresetn);
        end
    end

    // ── Test sequence state machine ──────────────────────────
    localparam PH_IDLE = 3'd0;
    localparam PH_WLO  = 3'd1;
    localparam PH_WHI  = 3'd2;
    localparam PH_ACT  = 3'd3;
    localparam PH_CTRL = 3'd4;
    localparam PH_WAIT = 3'd5;
    localparam PH_DONE = 3'd6;

    reg [2:0] phase;
    reg [1:0] axi_phase;
    reg [7:0] act_idx;

    // Access gemm's valid_out hierarchically (Yosys supports this)
    reg gemm_vo_d1, gemm_vo_d2;
    always @(posedge clk) begin
        if (!s_axi_aresetn) begin
            gemm_vo_d1 <= 1'b0;
            gemm_vo_d2 <= 1'b0;
        end else begin
            gemm_vo_d1 <= dut.gemm_i.valid_out;
            gemm_vo_d2 <= gemm_vo_d1;
        end
    end
    wire gemm_result_pulse = gemm_vo_d1 && !gemm_vo_d2;

    reg assertion_checked;
    always @(posedge clk) begin
        if (!s_axi_aresetn)
            assertion_checked <= 1'b0;
        else if (phase == PH_DONE)
            assertion_checked <= 1'b1;
    end

    // Capture weight_enc_int at test completion
    wire [2*COLS-1:0] weight_enc_int;
    assign weight_enc_int = dut.weight_enc_int;

    reg [2*COLS-1:0] captured_weight;
    always @(posedge clk) begin
        if (!s_axi_aresetn)
            captured_weight <= 0;
        else if (phase == PH_DONE)
            captured_weight <= weight_enc_int;
    end

    always @(posedge clk) begin
        if (!s_axi_aresetn) begin
            phase     <= PH_IDLE;
            axi_phase <= 2'd0;
            act_idx   <= 8'd0;
        end else begin
            case (phase)
                PH_IDLE: begin
                    if (reset_cnt >= 2) begin
                        phase     <= PH_WLO;
                        axi_phase <= 2'd1;
                    end
                end
                PH_WLO: begin
                    axi_tick;
                    if (axi_phase == 2'd2 && s_axi_bvalid && s_axi_bready) begin
                        phase     <= PH_WHI;
                        axi_phase <= 2'd1;
                    end
                end
                PH_WHI: begin
                    axi_tick;
                    if (axi_phase == 2'd2 && s_axi_bvalid && s_axi_bready) begin
                        phase     <= PH_ACT;
                        act_idx   <= 8'd0;
                        axi_phase <= 2'd1;
                    end
                end
                PH_ACT: begin
                    axi_tick;
                    if (axi_phase == 2'd2 && s_axi_bvalid && s_axi_bready) begin
                        if (act_idx >= DEPTH-1) begin
                            phase     <= PH_CTRL;
                            axi_phase <= 2'd1;
                        end else begin
                            act_idx   <= act_idx + 1;
                            axi_phase <= 2'd1;
                        end
                    end
                end
                PH_CTRL: begin
                    axi_tick;
                    if (axi_phase == 2'd2 && s_axi_bvalid && s_axi_bready) begin
                        phase     <= PH_WAIT;
                        axi_phase <= 2'd0;
                    end
                end
                PH_WAIT: begin
                    axi_phase <= 2'd0;
                    if (gemm_result_pulse)
                        phase <= PH_DONE;
                end
                PH_DONE: begin
                end
            endcase
        end
    end

    task axi_tick;
        begin
            case (axi_phase)
                2'd1: begin
                    if (s_axi_awready && s_axi_wready)
                        axi_phase <= 2'd2;
                end
                2'd2: begin
                    if (s_axi_bvalid && s_axi_bready)
                        axi_phase <= 2'd0;
                end
            endcase
        end
    endtask

    // ── AXI signal generation ───────────────────────────────
    function [7:0] get_addr;
        input [2:0] ph;
        begin
            case (ph)
                PH_WLO:  get_addr = ADDR_WEIGHT_ENC_LO;
                PH_WHI:  get_addr = ADDR_WEIGHT_ENC_HI;
                PH_ACT:  get_addr = ADDR_ACTIVATION;
                PH_CTRL: get_addr = ADDR_CTRL;
                default: get_addr = 8'h00;
            endcase
        end
    endfunction

    function [31:0] get_data;
        input [2:0] ph;
        input [7:0] idx;
        begin
            case (ph)
                PH_WLO:  get_data = LO_VAL;
                PH_WHI:  get_data = HI_VAL;
                PH_ACT:  get_data = 32'h00000001;
                PH_CTRL: get_data = CTRL_START;
                default: get_data = 32'h00000000;
            endcase
        end
    endfunction

    always @(posedge clk) begin
        if (!s_axi_aresetn) begin
            s_axi_awaddr  <= 8'h00;
            s_axi_awvalid <= 1'b0;
            s_axi_wdata   <= 32'h00000000;
            s_axi_wvalid  <= 1'b0;
            s_axi_bready  <= 1'b0;
        end else begin
            if (axi_phase == 2'd1) begin
                s_axi_awaddr  <= get_addr(phase);
                s_axi_awvalid <= 1'b1;
                s_axi_wdata   <= get_data(phase, act_idx);
                s_axi_wvalid  <= 1'b1;
            end else begin
                if (s_axi_awready)
                    s_axi_awvalid <= 1'b0;
                if (s_axi_wready)
                    s_axi_wvalid <= 1'b0;
            end

            if (axi_phase == 2'd2) begin
                s_axi_bready <= 1'b1;
            end else begin
                if (s_axi_bvalid)
                    s_axi_bready <= 1'b0;
            end
        end
    end

    // ── Assertion ──────────────────────────────────────────
    reg [3:0] run_cnt;
    initial run_cnt = 4'd0;
    always @(posedge clk) begin
        if (!s_axi_aresetn) run_cnt <= 4'd0;
        else if (run_cnt < 4'd15) run_cnt <= run_cnt + 1;
    end

    always @(posedge clk) begin
        if (run_cnt >= 4'd4 && assertion_checked) begin
            assert(captured_weight == EXPECTED[2*COLS-1:0]);
        end
    end

    // ── Cover ──────────────────────────────────────────────
    always @(posedge clk) begin
        if (reset_cnt >= 2) begin
            cover(phase == PH_DONE);
            cover(assertion_checked);
            cover(phase == PH_WAIT && gemm_result_pulse);
        end
    end

endmodule
