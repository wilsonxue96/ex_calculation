
`timescale 1ns/1ps
module int_sel(
  input  wire [14:0] data,

  output reg [4:0]  i
);
  always@(*) case (data[14:11])
    4'd0 : begin
      i = 5'd1;
    end

    4'd1 : begin
      i = (data[10:0] < 11'b01100010111) ? 5'd1 : 5'd2;
    end

    4'd2 : begin
      i = (data[10:0] < 11'b00010100010) ? 5'd2 : (data[10:0] < 11'b11000101110) ? 5'd3 : 5'd4;
    end

    4'd3 : begin
      i = (data[10:0] < 11'b01110111001) ? 5'd4 : 5'd5;
    end

    4'd4 : begin
      i = (data[10:0] < 11'b00101000101) ? 5'd5 : (data[10:0] < 11'b11011010000) ? 5'd6 : 5'd7;
    end

    4'd5 : begin
      i = (data[10:0] < 11'b10001011000) ? 5'd7 : 5'd8;
    end

    4'd6 : begin
      i = (data[10:0] < 11'b00111101000) ? 5'd8 : (data[10:0] < 11'b11101110011) ? 5'd9 : 5'd10;
    end

    4'd7 : begin
      i = (data[10:0] < 11'b10011111111) ? 5'd10 : 5'd11;
    end

    4'd8 : begin
      i = (data[10:0] < 11'b01010001010) ? 5'd11 : 5'd12;
    end

    4'd9 : begin
      i = (data[10:0] < 11'b00000010110) ? 5'd12 : (data[10:0] < 11'b10110100001) ? 5'd13 : 5'd14;
    end

    4'd10 : begin
      i = (data[10:0] < 11'b01100101101) ? 5'd14 : 5'd15;
    end

    4'd11 : begin
      i = (data[10:0] < 11'b00010111001) ? 5'd15 : (data[10:0] < 11'b11001000100) ? 5'd16 : 5'd17;
    end

    4'd12 : begin
      i = (data[10:0] < 11'b01111010000) ? 5'd17 : 5'd18;
    end

    4'd13 : begin
      i = (data[10:0] < 11'b00101011011) ? 5'd18 : (data[10:0] < 11'b11011100111) ? 5'd19 : 5'd20;
    end

    default : begin
      i = 5'd0;
    end

  endcase
endmodule
