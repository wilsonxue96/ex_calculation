
`timescale 1ns/1ps
module fra_sel(
  input  wire [14:0] data,

  output wire [4:0]  i
);

  assign i = (data[10:0] > 11'b01100111110) ? 5'd1 :
             (data[10:0] > 11'b00111001000) ? 5'd2 :
             (data[10:0] > 11'b00011110001) ? 5'd3 :
             (data[10:0] > 11'b00001111100) ? 5'd4 :
             (data[10:0] > 11'b00000111111) ? 5'd5 :
             (data[10:0] > 11'b00000011111) ? 5'd6 :
             (data[10:0] > 11'b00000001111) ? 5'd7 :
             (data[10:0] > 11'b00000000111) ? 5'd8 :
             (data[10:0] > 11'b00000000011) ? 5'd9 :
             (data[10:0] > 11'b00000000001) ? 5'd10 : 5'd11;

endmodule
