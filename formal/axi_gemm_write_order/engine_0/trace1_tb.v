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
  axi_gemm_write_order_formal UUT (
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
    // UUT.$auto$async2sync.\cc:107:execute$1322  = 1'b0;
    // UUT.$auto$async2sync.\cc:116:execute$1320  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$1326  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$1332  = 1'b1;
    UUT.dut._witness_.anyinit_procdff_622 = 32'b00000000000000000000000000000000;
    UUT.dut._witness_.anyinit_procdff_647 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_652 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    UUT.dut._witness_.anyinit_procdff_657 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_662 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_667 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_672 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_677 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_682 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_687 = 8'b00000000;
    UUT.dut._witness_.anyinit_procdff_692 = 32'b00000000000000000000000000000000;
    UUT.dut._witness_.anyinit_procdff_697 = 32'b00000000000000000000000000000000;
    UUT.dut._witness_.anyinit_procdff_702 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_707 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_712 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_717 = 8'b00000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_736 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_741 = 1'b0;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_746 = 1'b0;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_751 = 8'b00000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_756 = 2'b00;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_761 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_766 = 1'b0;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_785 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_790 = 16'b0000000000000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_795 = 1'b0;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_800 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_812 = 1'b0;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_817 = 8'b00000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_822 = 2'b00;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_827 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_832 = 1'b0;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_837 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_842 = 1'b0;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_847 = 1'b0;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_852 = 8'b00000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_857 = 2'b00;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_862 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_867 = 1'b0;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_886 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_891 = 16'b0000000000000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_896 = 1'b0;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_901 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_913 = 1'b0;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_918 = 8'b00000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_923 = 2'b00;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_928 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_933 = 1'b0;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1002 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1014 = 1'b0;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1019 = 8'b00000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1024 = 2'b00;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1029 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1034 = 1'b0;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_938 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_943 = 1'b0;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_948 = 1'b0;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_953 = 8'b00000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_958 = 2'b00;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_963 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_968 = 1'b0;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_987 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_992 = 16'b0000000000000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_997 = 1'b0;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1039 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1044 = 1'b0;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1049 = 1'b0;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1054 = 8'b00000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1059 = 2'b00;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1064 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1069 = 1'b0;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1088 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1093 = 16'b0000000000000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1098 = 1'b0;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1103 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1115 = 1'b0;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1120 = 8'b00000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1125 = 2'b00;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1130 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1135 = 1'b0;
    UUT.reset_cnt = 2'b00;
    UUT.s_axi_araddr = 8'b00000000;
    UUT.s_axi_arvalid = 1'b0;
    UUT.s_axi_awaddr = 8'b00000000;
    UUT.s_axi_awvalid = 1'b0;
    UUT.s_axi_bready = 1'b0;
    UUT.s_axi_rready = 1'b0;
    UUT.s_axi_wdata = 32'b00000000000000000000000000000000;
    UUT.s_axi_wvalid = 1'b0;
    UUT.state = 3'b000;
    UUT.sub_state = 2'b00;
    UUT.transaction_done = 1'b0;

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

    // state 12
    if (cycle == 11) begin
    end

    // state 13
    if (cycle == 12) begin
    end

    // state 14
    if (cycle == 13) begin
    end

    // state 15
    if (cycle == 14) begin
    end

    genclock <= cycle < 15;
    cycle <= cycle + 1;
  end
endmodule
