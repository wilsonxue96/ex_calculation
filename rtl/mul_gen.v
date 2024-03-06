module mul_gen (
  input clk,
  input rst_n,
  input [4:0] i,
  input [14:0] data,
  input int_or_fra,

  output reg [25:0] data_mul, //15 int   11 fra
  output reg [14:0] data_sub
);

  wire [25:0] mul,
  wire [14:0] sub,

  assign mul = i ? (26'h1000 << i) : (26'd1 + (26'h1000 >> i) );

  always@(*) case ({int_or_fra, i})
    //fra
    6'b000001 : begin
      sub = 15'b000001100111110;
    end

    6'b000010 : begin
      sub = 15'b000000111001000;
    end

    6'b000011 : begin
      sub = 15'b000000011110001;
    end

    6'b000100 : begin
      sub = 15'b000000001111100;
    end

    6'b000101 : begin
      sub = 15'b000000000111111;
    end

    6'b000110 : begin
      sub = 15'b000000000011111;
    end

    6'b000111 : begin
      sub = 15'b000000000001111;
    end

    6'b001000 : begin
      sub = 15'b000000000000111;
    end

    6'b001001 : begin
      sub = 15'b000000000000011;
    end

    6'b001010 : begin
      sub = 15'b000000000000001;
    end

    //int
    6'b100001: begin
      sub = {4'd0, 11'b10110001011};
    end
   
    6'b100010: begin
      sub = {4'd1, 11'b01100010111};
    end
 
    6'b100011: begin
      sub = {4'd2, 11'b00010100010};
    end
 
    6'b100100: begin
      sub = {4'd2, 11'b11000101110};
    end
 
    6'b100101: begin
      sub = {4'd3, 11'b01110111001};
    end
 
    6'b100110: begin
      sub = {4'd4, 11'b00101000101};
    end
 
    6'b100111: begin
      sub = {4'd4, 11'b11011010000};
    end
 
    6'b101000: begin
      sub = {4'd5, 11'b10001011100};
    end
 
    6'b101001: begin
      sub = {4'd6, 11'b00111101000};
    end
 
    6'b101010: begin
      sub = {4'd6, 11'b11101110011};
    end
    
    6'b101011: begin
      sub = {4'd7, 11'b10011111111};
    end
 
    6'b101100: begin
      sub = {4'd8, 11'b01010001010};
    end
 
    6'b101101: begin
      sub = {4'd9, 11'b00000010110};
    end
 
    6'b101110: begin
      sub = {4'd9, 11'b10110100001};
    end
 
    6'b101111: begin
      sub = {4'd10, 11'b01100101101};
    end
 
    6'b110000: begin
      sub = {4'd11, 11'b00010111001};
    end
 
    6'b110001: begin
      sub = {4'd11, 11'b11001000100};
    end
 
    6'b110010: begin
      sub = {4'd12, 11'b01111010000};
    end
 
    6'b110011: begin
      sub = {4'd13, 11'b00101011011};
    end
 
    6'b110100: begin
      sub = {4'd13, 11'b11011100111};
    end
 
    default : begin
      sub = 15'd0;
    end

  endcase

  always@(posedge clk) begin
    if (!rst_n) begin
      data_mul <= 26'd0;
      data_sub <= 15'd0;
    end
    else begin
      data_mul <= mul;
      data_sub <= data - sub;
    end
  end
endmodule
