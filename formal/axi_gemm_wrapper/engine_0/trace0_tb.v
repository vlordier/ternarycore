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
  axi_gemm_wrapper_formal UUT (
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
    // UUT.$auto$async2sync.\cc:107:execute$1297  = 1'b0;
    // UUT.$auto$async2sync.\cc:116:execute$1301  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$1307  = 1'b1;
    UUT.dut._witness_.anyinit_procdff_586 = 32'b00000000000000000000000000000000;
    UUT.dut._witness_.anyinit_procdff_611 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_616 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    UUT.dut._witness_.anyinit_procdff_621 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_626 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_631 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_636 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_641 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_646 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_651 = 8'b00000000;
    UUT.dut._witness_.anyinit_procdff_656 = 32'b00000000000000000000000000000000;
    UUT.dut._witness_.anyinit_procdff_661 = 32'b00000000000000000000000000000000;
    UUT.dut._witness_.anyinit_procdff_666 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_671 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_676 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_681 = 8'b00000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_699 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_704 = 1'b0;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_709 = 1'b0;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_714 = 8'b00000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_719 = 2'b00;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_724 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_729 = 1'b0;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_748 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_753 = 16'b0000000000000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_758 = 1'b0;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_763 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_775 = 1'b0;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_780 = 8'b00000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_785 = 2'b00;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_790 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_795 = 1'b0;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_800 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_805 = 1'b0;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_810 = 1'b0;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_815 = 8'b00000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_820 = 2'b00;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_825 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_830 = 1'b0;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_849 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_854 = 16'b0000000000000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_859 = 1'b0;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_864 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_876 = 1'b0;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_881 = 8'b00000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_886 = 2'b00;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_891 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_896 = 1'b0;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_901 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_906 = 1'b0;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_911 = 1'b0;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_916 = 8'b00000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_921 = 2'b00;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_926 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_931 = 1'b0;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_950 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_955 = 16'b0000000000000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_960 = 1'b0;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_965 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_977 = 1'b0;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_982 = 8'b00000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_987 = 2'b00;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_992 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_997 = 1'b0;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1002 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1007 = 1'b0;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1012 = 1'b0;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1017 = 8'b00000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1022 = 2'b00;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1027 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1032 = 1'b0;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1051 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1056 = 16'b0000000000000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1061 = 1'b0;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1066 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1078 = 1'b0;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1083 = 8'b00000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1088 = 2'b00;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1093 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1098 = 1'b0;
    UUT.reset_cnt = 2'b00;
    UUT.run_cnt = 5'b00000;
    UUT.s_axi_araddr = 8'b00000000;
    UUT.s_axi_arvalid = 1'b0;
    UUT.s_axi_awaddr = 8'b00000000;
    UUT.s_axi_awvalid = 1'b0;
    UUT.s_axi_bready = 1'b0;
    UUT.s_axi_rready = 1'b0;
    UUT.s_axi_wdata = 32'b00000000000000000000000000000000;
    UUT.s_axi_wvalid = 1'b0;
    UUT.state = 3'b000;

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

    genclock <= cycle < 9;
    cycle <= cycle + 1;
  end
endmodule
