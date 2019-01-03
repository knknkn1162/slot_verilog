`ifndef _decimal_decoder
`define _decimal_decoder

module decimal_decoder (
  input wire [3:0] i_num,
  output reg [6:0] o_seg7
);

  always @* begin
    case (i_num)
      4'd0: o_seg7 <= 7'b100_0000;
      4'd1: o_seg7 <= 7'b111_1001;
      4'd2: o_seg7 <= 7'b010_0100;
      4'd3: o_seg7 <= 7'b011_0000;
      4'd4: o_seg7 <= 7'b001_1001;
      4'd5: o_seg7 <= 7'b001_0010;
      4'd6: o_seg7 <= 7'b000_0010;
      4'd7: o_seg7 <= 7'b101_1000;
      4'd8: o_seg7 <= 7'b000_0000;
      4'd9: o_seg7 <= 7'b001_0000;
      default: o_seg7 <= 7'bXXX_XXXX;
    endcase
  end

endmodule

`endif
