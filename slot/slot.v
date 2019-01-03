`include "enable_gen.v"
`include "counter10_en.v"
`include "decimal_display.v"
`include "posedge_detector.v"
`include "toggle.v"


module slot #(
  parameter EN_CYCLE = 26
)(
  input wire clk, i_sclr, i_btn_n,
  output wire o_ledr0,
  output wire [6:0] o_hex0
);

  parameter EN_BTN_CYCLE = 21;

  wire s_7seg_en, s_btn_en, s_counter_en;
  wire s_sw;
  wire [3:0] s_cnt;
  wire s_btn, s_btn_posedge;

  assign s_btn = ~i_btn_n;

  // generate btn enable signal approx 40Hz
  enable_gen #(EN_BTN_CYCLE) enable_gen_btn(
    .clk(clk), .i_sclr(i_sclr), .o_en(s_btn_en)
  );

  posedge_detector posedge_detector0(
    .clk(clk),
    .i_sclr(i_sclr),
    .i_en(s_btn_en),
    .i_dat(s_btn),
    .o_posedge(s_btn_posedge)
  );

  // btn switch ON/OFF
  toggle #(1'b1) toggle0(
    .clk(clk),
    .i_sclr(i_sclr),
    .i_en(s_btn_posedge),
    .o_sw(s_sw)
  );

  assign o_ledr0 = s_sw;

  // generate approx. 1 Hz
  enable_gen #(EN_CYCLE) enable_gen_counter(
    .clk(clk), .i_sclr(i_sclr), .o_en(s_7seg_en)
  );
  assign s_counter_en = s_7seg_en & s_sw;
  // you can count-up each time you push the button
  // assign s_counter_en = s_btn_posedge;

  counter10_en counter10_en0(
    .clk(clk), .i_sclr(i_sclr), .i_en(s_counter_en),
    .o_cnt(s_cnt)
  );

  decimal_decoder decimal_decoder0(
    .i_num(s_cnt),
    .o_seg7(o_hex0)
  );

endmodule
