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
  wire [0:0] PI_clk = clock;
  ternary_gemm_stream_formal UUT (
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
    // UUT.$auto$async2sync.\cc:107:execute$785  = 1'b0;
    // UUT.$auto$async2sync.\cc:116:execute$765  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$771  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$777  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$783  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$789  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$795  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$801  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$807  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$813  = 1'b1;
    UUT._witness_.anyinit_auto_ff_cc_337_slice_606 = 32'b00000000000000000000000000000000;
    UUT._witness_.anyinit_auto_ff_cc_337_slice_609 = 32'b00000000000000000000000000000000;
    UUT._witness_.anyinit_auto_ff_cc_337_slice_610 = 16'b0000000000000000;
    UUT._witness_.anyinit_auto_ff_cc_337_slice_613 = 32'b00000000000000000000000000000000;
    UUT._witness_.anyinit_auto_ff_cc_337_slice_616 = 32'b00000000000000000000000000000000;
    UUT._witness_.anyinit_auto_ff_cc_337_slice_617 = 16'b0000000000000000;
    UUT._witness_.anyinit_auto_ff_cc_337_slice_618 = 1'b0;
    UUT._witness_.anyinit_auto_ff_cc_337_slice_627 = 2'b00;
    UUT._witness_.anyinit_auto_ff_cc_337_slice_636 = 4'b0000;
    UUT._witness_.anyinit_auto_ff_cc_337_slice_645 = 1'b0;
    UUT._witness_.anyinit_auto_ff_cc_337_slice_652 = 1'b0;
    UUT._witness_.anyinit_auto_ff_cc_337_slice_655 = 4'b0000;
    UUT._witness_.anyinit_auto_ff_cc_337_slice_664 = 64'b0000000000000000000000000000000000000000000000000000000000000000;
    UUT._witness_.anyinit_flatten_dut__gemm_i__dot_gen_0__dot_i__procdff_469 = 1'b0;
    UUT._witness_.anyinit_flatten_dut__procdff_479 = 1'b0;
    UUT._witness_.anyinit_flatten_dut__procdff_504 = 1'b0;
    UUT.addr_changed = 1'b0;
    UUT.addr_count = 8'b00000000;
    UUT.drv_state = 2'b00;
    UUT.inferred_state = 2'b00;
    UUT.prev_act_addr = 3'b100;
    UUT.reset_cnt = 2'b00;
    UUT.run_phase = 1'b0;
    UUT.wait_phase = 1'b0;

    // state 0
    PI_rst_n = 1'b0;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_rst_n <= 1'b0;
    end

    // state 2
    if (cycle == 1) begin
      PI_rst_n <= 1'b1;
    end

    // state 3
    if (cycle == 2) begin
      PI_rst_n <= 1'b1;
    end

    // state 4
    if (cycle == 3) begin
      PI_rst_n <= 1'b1;
    end

    // state 5
    if (cycle == 4) begin
      PI_rst_n <= 1'b1;
    end

    // state 6
    if (cycle == 5) begin
      PI_rst_n <= 1'b1;
    end

    // state 7
    if (cycle == 6) begin
      PI_rst_n <= 1'b1;
    end

    // state 8
    if (cycle == 7) begin
      PI_rst_n <= 1'b1;
    end

    // state 9
    if (cycle == 8) begin
      PI_rst_n <= 1'b1;
    end

    // state 10
    if (cycle == 9) begin
      PI_rst_n <= 1'b1;
    end

    genclock <= cycle < 10;
    cycle <= cycle + 1;
  end
endmodule
