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
  reg [0:0] PI_rst_n;
  reg [0:0] PI_valid_in;
  reg [7:0] PI_x;
  wire [0:0] PI_clk = clock;
  reg [21:0] PI_inv;
  activation_quant_formal UUT (
    .rst_n(PI_rst_n),
    .valid_in(PI_valid_in),
    .x(PI_x),
    .clk(PI_clk),
    .inv(PI_inv)
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
    // UUT.$auto$async2sync.\cc:107:execute$193  = 1'b0;
    // UUT.$auto$async2sync.\cc:116:execute$185  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$191  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$197  = 1'b1;
    UUT.dut._witness_.anyinit_procdff_115 = 8'b00000000;
    UUT.dut._witness_.anyinit_procdff_120 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_125 = 30'b000000000000000000000000000000;
    UUT.dut._witness_.anyinit_procdff_130 = 1'b0;
    UUT.reset_cnt = 2'b00;

    // state 0
    PI_rst_n = 1'b0;
    PI_valid_in = 1'b0;
    PI_x = 8'b00000000;
    PI_inv = 22'b0000000000000000000000;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_rst_n <= 1'b0;
      PI_valid_in <= 1'b0;
      PI_x <= 8'b00000000;
      PI_inv <= 22'b0000000000000000000000;
    end

    // state 2
    if (cycle == 1) begin
      PI_rst_n <= 1'b1;
      PI_valid_in <= 1'b1;
      PI_x <= 8'b00000000;
      PI_inv <= 22'b0000001010001010001111;
    end

    // state 3
    if (cycle == 2) begin
      PI_rst_n <= 1'b1;
      PI_valid_in <= 1'b0;
      PI_x <= 8'b00000000;
      PI_inv <= 22'b0000001010001010001111;
    end

    // state 4
    if (cycle == 3) begin
      PI_rst_n <= 1'b1;
      PI_valid_in <= 1'b0;
      PI_x <= 8'b00000000;
      PI_inv <= 22'b0000001010001010001111;
    end

    // state 5
    if (cycle == 4) begin
      PI_rst_n <= 1'b1;
      PI_valid_in <= 1'b0;
      PI_x <= 8'b00000000;
      PI_inv <= 22'b0000001010001010001111;
    end

    genclock <= cycle < 5;
    cycle <= cycle + 1;
  end
endmodule
