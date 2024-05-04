`timescale 1ns/1ps

module csa_921(
  input clk,
  input rst_n,

  input [25:0] A0,
  input [25:0] A1,
  input [25:0] A2,

  input [25:0] B0,
  input [25:0] B1,
  input [25:0] B2,

  input [25:0] C0,
  input [25:0] C1,
  input [25:0] C2,

  output reg [25:0] result
);
  //first level
  wire [25:0] st0_0;
  wire [25:0] st0_1;
  wire [25:0] st1_0;
  wire [25:0] st1_1;
  wire [25:0] st2_0;
  wire [25:0] st2_1;

  reg [25:0] st0_0_buf;
  reg [25:0] st0_1_buf;
  reg [25:0] st1_0_buf;
  reg [25:0] st1_1_buf;
  reg [25:0] st2_0_buf;
  reg [25:0] st2_1_buf;

csa_cell   U_CSA_CELL_0_0(
    .A     ( A0     ),
    .B     ( A1     ),
    .C     ( A2     ),
    .sum   ( st0_0  ),
    .carry ( st0_1  )
);

csa_cell   U_CSA_CELL_0_1(
    .A     ( B0     ),
    .B     ( B1     ),
    .C     ( B2     ),
    .sum   ( st1_0  ),
    .carry ( st1_1  )
);


csa_cell   U_CSA_CELL_0_2(
    .A     ( C0     ),
    .B     ( C1     ),
    .C     ( C2     ),
    .sum   ( st2_0  ),
    .carry ( st2_1  )
);

  always@(posedge clk)begin
    if(!rst_n) begin
      st0_0_buf <= 26'd0;
      st0_1_buf <= 26'd0;
      st1_0_buf <= 26'd0;
      st1_1_buf <= 26'd0;
      st2_0_buf <= 26'd0;
      st2_1_buf <= 26'd0;
    end
    else begin
      st0_0_buf <= st0_0;
      st0_1_buf <= st0_1;
      st1_0_buf <= st1_0;
      st1_1_buf <= st1_1;
      st2_0_buf <= st2_0;
      st2_1_buf <= st2_1;
    end
  end

  //second level
  wire [25:0] se0_0;
  wire [25:0] se0_1;
  wire [25:0] se1_0;
  wire [25:0] se1_1;


csa_cell   U_CSA_CELL_1_0(
    .A     ( st0_0_buf ),
    .B     ( st0_1_buf ),
    .C     ( st1_0_buf ),
    .sum   ( se0_0     ),
    .carry ( se0_1     )
);


csa_cell   U_CSA_CELL_1_1(
    .A     ( st1_1_buf ),
    .B     ( st2_0_buf ),
    .C     ( st2_1_buf ),
    .sum   ( se1_0     ),
    .carry ( se1_1     )
);

  //third level
  wire [25:0] th0_0;
  wire [25:0] th0_1;

  reg [25:0] th0_0_buf;
  reg [25:0] th0_1_buf;

csa_cell   U_CSA_CELL_2_0(
    .A     ( se0_1 ),
    .B     ( se1_0 ),
    .C     ( se1_1 ),
    .sum   ( th0_0     ),
    .carry ( th0_1     )
);


  always@(posedge clk)begin
    if(!rst_n) begin
      th0_0_buf <= 26'd0;
      th0_1_buf <= 26'd0;
    end
    else begin
      th0_0_buf <= th0_0;
      th0_1_buf <= th0_1;
    end
  end

  //finial level
  wire [25:0] fo0_0;
  wire [25:0] fo0_1;

csa_cell   U_CSA_CELL_3_0(
    .A     ( th0_0_buf ),
    .B     ( th0_1_buf ),
    .C     ( se0_0     ),
    .sum   ( fo0_0     ),
    .carry ( fo0_1     )
);

  wire [25:0] fin;
  assign fin = fo0_0 + fo0_1;

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
