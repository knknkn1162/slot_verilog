`ifndef _posedge_detector
`define _posedge_detector

module posedge_detector (
  input wire clk, i_sclr, i_en, i_dat,
  output wire o_en_rise
);

  reg [2:0] r_en;

  always @(posedge clk) begin
    if (i_sclr) begin
      r_en <= 3'b000;
    end else if (i_en) begin
      r_en <= {r_en[1:0], i_dat};
    end
  end

  assign o_en_rise = (r_en[2:1] == 2'b01) & i_en;
endmodule

`endif
