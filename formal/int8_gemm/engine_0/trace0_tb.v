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
  wire [0:0] PI_clk = clock;
  int8_gemm_formal UUT (
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
    // UUT.$auto$async2sync.\cc:107:execute$342  = 1'b0;
    // UUT.$auto$async2sync.\cc:116:execute$346  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$352  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$358  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$364  = 1'b1;
    UUT.dut.\dot_gen[0] .dot_i._witness_.anyinit_procdff_256 = 32'b00000000000000000000000000000000;
    UUT.dut.\dot_gen[0] .dot_i._witness_.anyinit_procdff_261 = 16'b0000000000000000;
    UUT.dut.\dot_gen[0] .dot_i._witness_.anyinit_procdff_266 = 1'b0;
    UUT.dut.\dot_gen[0] .dot_i.acc_out = 32'b00000000000000000000000000000000;
    UUT.dut.\dot_gen[1] .dot_i._witness_.anyinit_procdff_256 = 32'b00000000000000000000000000000000;
    UUT.dut.\dot_gen[1] .dot_i._witness_.anyinit_procdff_261 = 16'b0000000000000000;
    UUT.dut.\dot_gen[1] .dot_i._witness_.anyinit_procdff_266 = 1'b0;
    UUT.dut.\dot_gen[1] .dot_i.acc_out = 32'b00000000000000000000000000000000;
    UUT.feed_counter = 4'b0000;
    UUT.reset_cnt = 2'b00;
    UUT.run_cnt = 4'b0000;

    // state 0
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
    end

    // state 2
    if (cycle == 1) begin
    end

    // state 3
    if (cycle == 2) begin
    end

    // state 4
    if (cycle == 3) begin
    end

    // state 5
    if (cycle == 4) begin
    end

    // state 6
    if (cycle == 5) begin
    end

    // state 7
    if (cycle == 6) begin
    end

    // state 8
    if (cycle == 7) begin
    end

    // state 9
    if (cycle == 8) begin
    end

    // state 10
    if (cycle == 9) begin
    end

    // state 11
    if (cycle == 10) begin
    end

    genclock <= cycle < 11;
    cycle <= cycle + 1;
  end
endmodule
