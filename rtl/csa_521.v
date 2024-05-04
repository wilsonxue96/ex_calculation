`timescale 1ns/1ps

module csa_521(
  input clk,
  input rst_n,

  input [25:0] A0,
  input [25:0] A1,
  input [25:0] A2,

  input [25:0] B0,
  input [25:0] B1,

  output reg [25:0] result
);

  //first level
  wire [25:0] st0_0;
  wire [25:0] st0_1;

  reg [25:0] st0_0_buf;
  reg [25:0] st0_1_buf;

csa_cell   U_CSA_CELL_0_0(
    .A     ( A0     ),
    .B     ( A1     ),
    .C     ( A2     ),
    .sum   ( st0_0  ),
    .carry ( st0_1  )
);

  always@(posedge clk)begin
    if(!rst_n) begin
      st0_0_buf <= 26'd0;
      st0_1_buf <= 26'd0;
    end
    else begin
      st0_0_buf <= st0_0;
      st0_1_buf <= st0_1;
    end
  end

  //second level
  wire [25:0] se0_0;
  wire [25:0] se0_1;

  csa_cell   U_CSA_CELL_1_0(
      .A     ( st0_0_buf ),
      .B     ( st0_1_buf ),
      .C     ( B0        ),
      .sum   ( se0_0     ),
      .carry ( se0_1     )
  );

  //third level
  wire [25:0] th0_0;
  wire [25:0] th0_1;

  csa_cell   U_CSA_CELL_2_0(
      .A     ( se0_0 ),
      .B     ( se0_1 ),
      .C     ( B1    ),
      .sum   ( th0_0 ),
      .carry ( th0_1 )
  );

  wire [25:0] fin;
  assign fin = th0_0 + th0_1;

  //result
  always@(posedge clk) begin
    if(!rst_n) begin
      result <= 26'd0;
    end
    else begin
      result <= fin;
    end
  end

endmodule
