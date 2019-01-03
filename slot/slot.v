`include "enable_gen.v"
`include "counter10_en.v"
`include "decimal_display.v"


module slot #(
  parameter EN_CYCLE = 26
)(
  input wire clk, i_sclr,
  output wire [6:0] o_hex0
);

  wire s_en;
  wire [3:0] s_cnt;

  // generate approx. 1 Hz
  enable_gen #(EN_CYCLE) enable_gen0(
    .clk(clk), .i_sclr(i_sclr), .o_en(s_en)
  );

  counter10_en counter10_en0(
    .clk(clk), .i_sclr(i_sclr), .i_en(s_en),
    .o_cnt(s_cnt)
  );

  decimal_decoder decimal_decoder0(
    .i_num(s_cnt),
    .o_seg7(o_hex0)
  );

endmodule
