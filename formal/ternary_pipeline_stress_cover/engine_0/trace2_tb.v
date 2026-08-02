`ifndef VERILATOR
module testbench;
  reg [4095:0] vcdfile;
  reg clock;
`else
module testbench(input clock, output reg genclock);
  initial genclock = 1;
`endif
  reg genclock = 1;
  reg [31:0] cycle = 0;
  reg [31:0] PI_alpha;
  reg [7:0] PI_activation;
  reg [0:0] PI_valid_in;
  reg [3:0] PI_weight_enc;
  reg [21:0] PI_inv;
  reg [0:0] PI_rst_n;
  wire [0:0] PI_clk = clock;
  ternary_pipeline_stress_formal UUT (
    .alpha(PI_alpha),
    .activation(PI_activation),
    .valid_in(PI_valid_in),
    .weight_enc(PI_weight_enc),
    .inv(PI_inv),
    .rst_n(PI_rst_n),
    .clk(PI_clk)
  );
`ifndef VERILATOR
  initial begin
    if ($value$plusargs("vcd=%s", vcdfile)) begin
      $dumpfile(vcdfile);
      $dumpvars(0, testbench);
    end
    #5 clock = 0;
    while (genclock) begin
      #5 clock = 0;
      #5 clock = 1;
    end
  end
`endif
  initial begin
`ifndef VERILATOR
    #1;
`endif
    // UUT.$auto$async2sync.\cc:107:execute$1398  = 1'b0;
    // UUT.$auto$async2sync.\cc:116:execute$1402  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$1408  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$1414  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$1420  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$1426  = 1'b1;
    UUT._witness_.anyinit_auto_ff_cc_337_slice_1312 = 16'b0000000000000000;
    UUT._witness_.anyinit_flatten_dut__gemm__dot_gen_0__dot_i__procdff_1051 = 1'b0;
    UUT._witness_.anyinit_flatten_dut__quant__procdff_1056 = 1'b0;
    UUT._witness_.anyinit_flatten_dut__quant__procdff_1071 = 1'b0;
    UUT._witness_.anyinit_flatten_dut__scale__procdff_1138 = 1'b0;
    UUT._witness_.anyinit_flatten_dut__scale__procdff_1143 = 1'b0;
    UUT.\acc_sum[0]  = 32'b00000000000000000000000000000000;
    UUT.\acc_sum[1]  = 32'b00000000000000000000000000000000;
    UUT.dot_done = 1'b0;
    UUT.feed_cnt = 2'b00;
    UUT.inv_d1 = 22'b0000000000000000000000;
    UUT.inv_d2 = 22'b0000000000000000000000;
    UUT.\psum[0]  = 32'b00000000000000000000000000000000;
    UUT.\psum[1]  = 32'b00000000000000000000000000000000;
    UUT.\pwin[0]  = 9'b000000000;
    UUT.\pwin[1]  = 9'b000000000;
    UUT.\pwin[2]  = 9'b000000000;
    UUT.\pwin[3]  = 9'b000000000;
    UUT.\pwin[4]  = 9'b000000000;
    UUT.\pwin[5]  = 9'b000000000;
    UUT.\pwin[6]  = 9'b000000000;
    UUT.\pwin[7]  = 9'b000000000;
    UUT.reset_cnt = 2'b00;
    UUT.run_cnt = 4'b0000;
    UUT.s_d1 = 1'b0;
    UUT.\s_prod[0]  = 48'b000000000000000000000000000000000000000000000000;
    UUT.\s_prod[1]  = 48'b000000000000000000000000000000000000000000000000;
    UUT.s_result = 64'b0000000000000000000000000000000000000000000000000000000000000000;
    UUT.v_d1 = 1'b0;
    UUT.v_d2 = 1'b0;
    UUT.w_d1 = 4'b0000;
    UUT.w_d2 = 4'b0000;
    UUT.x_d1 = 8'b00000000;
    UUT.x_d2 = 8'b00000000;

    // state 0
    PI_alpha = 32'b00000000000000000000000000000000;
    PI_activation = 8'b00000000;
    PI_valid_in = 1'b0;
    PI_weight_enc = 4'b0000;
    PI_inv = 22'b0000000000000000000000;
    PI_rst_n = 1'b0;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_alpha <= 32'b00000000000000000000000000000000;
      PI_activation <= 8'b00000000;
      PI_valid_in <= 1'b0;
      PI_weight_enc <= 4'b0000;
      PI_inv <= 22'b0000000000000000000000;
      PI_rst_n <= 1'b0;
    end

    // state 2
    if (cycle == 1) begin
      PI_alpha <= 32'b00000000000000000000000000000000;
      PI_activation <= 8'b11001101;
      PI_valid_in <= 1'b1;
      PI_weight_enc <= 4'b0011;
      PI_inv <= 22'b0011011010000111110011;
      PI_rst_n <= 1'b1;
    end

    // state 3
    if (cycle == 2) begin
      PI_alpha <= 32'b00000000000000000000000000000000;
      PI_activation <= 8'b10100001;
      PI_valid_in <= 1'b1;
      PI_weight_enc <= 4'b0011;
      PI_inv <= 22'b0000101001000000000001;
      PI_rst_n <= 1'b1;
    end

    // state 4
    if (cycle == 3) begin
      PI_alpha <= 32'b00000000000000000000000000000000;
      PI_activation <= 8'b10000000;
      PI_valid_in <= 1'b1;
      PI_weight_enc <= 4'b0010;
      PI_inv <= 22'b0000000000001000000000;
      PI_rst_n <= 1'b1;
    end

    // state 5
    if (cycle == 4) begin
      PI_alpha <= 32'b00000000000000000000000000000000;
      PI_activation <= 8'b10000000;
      PI_valid_in <= 1'b1;
      PI_weight_enc <= 4'b0010;
      PI_inv <= 22'b0000000110000000000000;
      PI_rst_n <= 1'b1;
    end

    // state 6
    if (cycle == 5) begin
      PI_alpha <= 32'b00000000000000000000000000000000;
      PI_activation <= 8'b00000000;
      PI_valid_in <= 1'b0;
      PI_weight_enc <= 4'b0000;
      PI_inv <= 22'b0000000000000000000000;
      PI_rst_n <= 1'b1;
    end

    // state 7
    if (cycle == 6) begin
      PI_alpha <= 32'b00000000000000000000000000000000;
      PI_activation <= 8'b00000000;
      PI_valid_in <= 1'b0;
      PI_weight_enc <= 4'b0000;
      PI_inv <= 22'b0000000000000000000000;
      PI_rst_n <= 1'b1;
    end

    // state 8
    if (cycle == 7) begin
      PI_alpha <= 32'b00000000000000000101010010000111;
      PI_activation <= 8'b00000000;
      PI_valid_in <= 1'b0;
      PI_weight_enc <= 4'b0000;
      PI_inv <= 22'b0000000000000000000000;
      PI_rst_n <= 1'b1;
    end

    // state 9
    if (cycle == 8) begin
      PI_alpha <= 32'b00000000000000000000000000000000;
      PI_activation <= 8'b00000000;
      PI_valid_in <= 1'b0;
      PI_weight_enc <= 4'b0000;
      PI_inv <= 22'b0000000000000000000000;
      PI_rst_n <= 1'b1;
    end

    // state 10
    if (cycle == 9) begin
      PI_alpha <= 32'b00000000000000000000000000000000;
      PI_activation <= 8'b00000000;
      PI_valid_in <= 1'b0;
      PI_weight_enc <= 4'b0000;
      PI_inv <= 22'b0000000000000000000000;
      PI_rst_n <= 1'b1;
    end

    // state 11
    if (cycle == 10) begin
      PI_alpha <= 32'b00000000000000000000000000000000;
      PI_activation <= 8'b00000000;
      PI_valid_in <= 1'b0;
      PI_weight_enc <= 4'b0000;
      PI_inv <= 22'b0000000000000000000000;
      PI_rst_n <= 1'b1;
    end

    genclock <= cycle < 11;
    cycle <= cycle + 1;
  end
endmodule
