`include "testbench.v"
`include "toggle.v"

module toggle_tb;
  reg clk, i_sclr, i_en;
  wire o_sw;

  parameter CLK_PERIOD = 10;
  toggle uut(
    .clk(clk),
    .i_sclr(i_sclr),
    .i_en(i_en),
    .o_sw(o_sw)
  );

  `dump_block
  `conf_clk_block(clk, CLK_PERIOD)

  initial begin
    #(CLK_PERIOD)
      i_sclr = 1'b1;
    @(posedge clk) #1
      `assert_eq(o_sw, 1'b0);
      i_sclr = 1'b0;
    @(posedge clk) #1
      `assert_eq(o_sw, 1'b0);
      i_en = 1'b1;
    @(posedge clk) #1
      `assert_eq(o_sw, 1'b1);
      i_en = 1'b0;
    @(posedge clk) #1
      `assert_eq(o_sw, 1'b1);
      i_en = 1'b1;
    @(posedge clk) #1
      `assert_eq(o_sw, 1'b0);

    `end_tb;
  end

endmodule
