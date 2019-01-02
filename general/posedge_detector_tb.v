`include "testbench.v"
`include "posedge_detector.v"

module posedge_detector_tb;
  reg clk, i_sclr, i_en;
  wire o_en_rise;

  parameter CLK_PERIOD = 10;

  posedge_detector uut(
    .clk(clk),
    .i_sclr(i_sclr),
    .i_en(i_en),
    .o_en_rise(o_en_rise)
  );

  `dump_block
  `conf_clk_block(clk, CLK_PERIOD)

  initial begin
    #(CLK_PERIOD)
      i_sclr = 1'b1;
    @(posedge clk) #1
      i_sclr = 1'b0;
      `assert_eq(o_en_rise, 1'b0);
      i_en = 1'b1;
    @(posedge clk) #1
      `assert_eq(o_en_rise, 1'b0);
    @(posedge clk) #1
      `assert_eq(o_en_rise, 1'b1);
      i_en = 1'b0;
    @(posedge clk) #1
      `assert_eq(o_en_rise, 1'b0);
    @(posedge clk) #1
      `assert_eq(o_en_rise, 1'b0);
    @(posedge clk) #1
      `assert_eq(o_en_rise, 1'b0);

    `end_tb
  end
endmodule
