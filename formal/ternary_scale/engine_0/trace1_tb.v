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
  reg [63:0] PI_alpha;
  wire [0:0] PI_clk = clock;
  reg [0:0] PI_valid_in;
  reg [127:0] PI_acc_in;
  reg [0:0] PI_rst_n;
  ternary_scale_formal UUT (
    .alpha(PI_alpha),
    .clk(PI_clk),
    .valid_in(PI_valid_in),
    .acc_in(PI_acc_in),
    .rst_n(PI_rst_n)
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
    // UUT.$auto$async2sync.\cc:107:execute$639  = 1'b0;
    // UUT.$auto$async2sync.\cc:116:execute$643  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$649  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$655  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$661  = 1'b1;
    UUT.dut._witness_.anyinit_procdff_403 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    UUT.dut._witness_.anyinit_procdff_508 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_513 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_523 = 48'b000000000000000000000000000000000000000000000000;
    UUT.dut._witness_.anyinit_procdff_528 = 48'b000000000000000000000000000000000000000000000000;
    UUT.dut._witness_.anyinit_procdff_533 = 48'b000000000000000000000000000000000000000000000000;
    UUT.dut._witness_.anyinit_procdff_538 = 48'b000000000000000000000000000000000000000000000000;
    UUT.reset_cnt = 2'b00;

    // state 0
    PI_alpha = 64'b0000000000000000000000000000000000000000000000000000000000000000;
    PI_valid_in = 1'b0;
    PI_acc_in = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    PI_rst_n = 1'b0;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_alpha <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      PI_valid_in <= 1'b0;
      PI_acc_in <= 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      PI_rst_n <= 1'b0;
    end

    // state 2
    if (cycle == 1) begin
      PI_alpha <= 64'b0100000000000000100000000000000001000000000000001000000000000000;
      PI_valid_in <= 1'b1;
      PI_acc_in <= 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000;
      PI_rst_n <= 1'b1;
    end

    // state 3
    if (cycle == 2) begin
      PI_alpha <= 64'b0100000000000000100000000000000001000000000000001000000000000000;
      PI_valid_in <= 1'b0;
      PI_acc_in <= 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      PI_rst_n <= 1'b1;
    end

    // state 4
    if (cycle == 3) begin
      PI_alpha <= 64'b0100000000000000100000000000000001000000000000001000000000000000;
      PI_valid_in <= 1'b0;
      PI_acc_in <= 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      PI_rst_n <= 1'b1;
    end

    // state 5
    if (cycle == 4) begin
      PI_alpha <= 64'b0100000000000000100000000000000001000000000000001000000000000000;
      PI_valid_in <= 1'b0;
      PI_acc_in <= 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
      PI_rst_n <= 1'b1;
    end

    genclock <= cycle < 5;
    cycle <= cycle + 1;
  end
endmodule
