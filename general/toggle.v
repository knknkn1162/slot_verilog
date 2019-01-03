`ifndef _toggle
`define _toggle

module toggle #(
  parameter INIT = 1'b1
)(
  input wire clk, i_sclr, i_en,
  output wire o_sw
);

  reg r_sw;

  always @(posedge clk) begin
    if (i_sclr) begin
      r_sw <= INIT;
    end else if (i_en) begin
      r_sw <= ~r_sw;
    end
  end

  assign o_sw = r_sw;
endmodule

`endif
