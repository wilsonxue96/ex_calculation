
`timescale 1ns/1ps
module selection (
  input  clk,
  input  rst_n,
  input  [14:0] data,

  output reg    [4:0] i,
  output reg    int_or_fra
);

  wire [4:0] i_fra;
  wire [4:0] i_int;

  always@(posedge clk) begin
    if (!rst_n) begin
      i          <= 5'd0;
      int_or_fra <= 1'b0;
    end
    else begin
      i          <= (data < 15'b000010110001011) ? i_fra : i_int;
      int_or_fra <= (data < 15'b000010110001011) ? 1'b0 : 1'b1;
    end
  end

int_sel   U_INT_SEL_0(
    .data ( data  ),
    .i    ( i_int )
);


fra_sel U_fra_SEL_0(
    .data ( data  ),
    .i    ( i_fra )
);

endmodule
