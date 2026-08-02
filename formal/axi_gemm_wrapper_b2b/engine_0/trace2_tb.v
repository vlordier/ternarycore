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
  axi_gemm_wrapper_b2b_formal UUT (
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
    // UUT.$auto$async2sync.\cc:107:execute$1434  = 1'b0;
    // UUT.$auto$async2sync.\cc:116:execute$1432  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$1438  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$1444  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$1450  = 1'b1;
    // UUT.$auto$async2sync.\cc:116:execute$1456  = 1'b1;
    UUT.axiph_active = 1'b0;
    UUT.axiph_sub = 2'b00;
    UUT.cur_addr = 8'b00000000;
    UUT.cur_data = 32'b00000000000000000000000000000000;
    UUT.dut._witness_.anyinit_procdff_718 = 32'b00000000000000000000000000000000;
    UUT.dut._witness_.anyinit_procdff_743 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_748 = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    UUT.dut._witness_.anyinit_procdff_753 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_758 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_763 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_768 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_773 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_778 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_783 = 8'b00000000;
    UUT.dut._witness_.anyinit_procdff_788 = 32'b00000000000000000000000000000000;
    UUT.dut._witness_.anyinit_procdff_793 = 32'b00000000000000000000000000000000;
    UUT.dut._witness_.anyinit_procdff_798 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_803 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_808 = 1'b0;
    UUT.dut._witness_.anyinit_procdff_813 = 8'b00000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_834 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_839 = 1'b0;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_844 = 1'b0;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_849 = 8'b00000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_854 = 2'b00;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_859 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_864 = 1'b0;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_883 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_888 = 16'b0000000000000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_893 = 1'b0;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_898 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_910 = 1'b0;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_915 = 8'b00000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_920 = 2'b00;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_925 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_0._witness_.anyinit_procdff_930 = 1'b0;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_1011 = 1'b0;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_1016 = 8'b00000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_1021 = 2'b00;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_1026 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_1031 = 1'b0;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_935 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_940 = 1'b0;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_945 = 1'b0;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_950 = 8'b00000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_955 = 2'b00;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_960 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_965 = 1'b0;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_984 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_989 = 16'b0000000000000000;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_994 = 1'b0;
    UUT.dut.gemm_i.dot_1._witness_.anyinit_procdff_999 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1036 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1041 = 1'b0;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1046 = 1'b0;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1051 = 8'b00000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1056 = 2'b00;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1061 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1066 = 1'b0;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1085 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1090 = 16'b0000000000000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1095 = 1'b0;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1100 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1112 = 1'b0;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1117 = 8'b00000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1122 = 2'b00;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1127 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_2._witness_.anyinit_procdff_1132 = 1'b0;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1137 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1142 = 1'b0;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1147 = 1'b0;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1152 = 8'b00000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1157 = 2'b00;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1162 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1167 = 1'b0;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1186 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1191 = 16'b0000000000000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1196 = 1'b0;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1201 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1213 = 1'b0;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1218 = 8'b00000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1223 = 2'b00;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1228 = 32'b00000000000000000000000000000000;
    UUT.dut.gemm_i.dot_3._witness_.anyinit_procdff_1233 = 1'b0;
    UUT.elem_idx = 8'b00000000;
    UUT.gemm_vo_d1 = 1'b0;
    UUT.gemm_vo_d2 = 1'b0;
    UUT.major = 4'b0000;
    UUT.pipeline_count = 2'b00;
    UUT.reset_cnt = 2'b00;
    UUT.s_axi_awaddr = 8'b00000000;
    UUT.s_axi_awvalid = 1'b0;
    UUT.s_axi_bready = 1'b0;
    UUT.s_axi_wdata = 32'b00000000000000000000000000000000;
    UUT.s_axi_wvalid = 1'b0;

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

    // state 16
    if (cycle == 15) begin
    end

    // state 17
    if (cycle == 16) begin
    end

    // state 18
    if (cycle == 17) begin
    end

    // state 19
    if (cycle == 18) begin
    end

    // state 20
    if (cycle == 19) begin
    end

    // state 21
    if (cycle == 20) begin
    end

    // state 22
    if (cycle == 21) begin
    end

    // state 23
    if (cycle == 22) begin
    end

    // state 24
    if (cycle == 23) begin
    end

    genclock <= cycle < 24;
    cycle <= cycle + 1;
  end
endmodule
