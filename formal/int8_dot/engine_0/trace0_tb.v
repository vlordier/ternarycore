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
  int8_dot_formal UUT (
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
    // UUT.$auto$async2sync.\cc:107:execute$333  = 1'b0;
    // UUT.$auto$async2sync.\cc:116:execute$319  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$325  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$331  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$337  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$343  = 1'b1;
    UUT.cycle = 4'b1100;
    UUT.dut._witness_.anyinit_procdff_230 = 32'b00000000000000000000000000000000;
    UUT.dut._witness_.anyinit_procdff_235 = 16'b0000000000000000;
    UUT.dut._witness_.anyinit_procdff_240 = 1'b0;
    UUT.dut.acc_out = 32'b10000000000000000000000000000000;
    UUT.feed_count = 4'b0000;
    UUT.ref_done = 1'b0;
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

    genclock <= cycle < 7;
    cycle <= cycle + 1;
  end
endmodule
