`timescale 1ns/1ps
module csa_2921(
    input clk,  input rst_n,
    input [25:0] num0, input [25:0] num1, input [25:0] num2,
    input [25:0] num3, input [25:0] num4, input [25:0] num5,
    input [25:0] num6, input [25:0] num7, input [25:0] num8,
    input [25:0] num9, input [25:0] num10, input [25:0] num11,
    input [25:0] num12, input [25:0] num13, input [25:0] num14,
    input [25:0] num15, input [25:0] num16, input [25:0] num17,
    input [25:0] num18, input [25:0] num19, input [25:0] num20,
    input [25:0] num21, input [25:0] num22, input [25:0] num23,
    input [25:0] num24, input [25:0] num25, input [25:0] num26,
    input [25:0] num27, input [25:0] num28,
    output [25:0] result
);

  wire [25:0] result_0;
  wire [25:0] result_1;
  wire [25:0] result_2;

csa_921     U_CSA_921_0(
    .clk    ( clk    ),
    .rst_n  ( rst_n  ),
    .A0     (  num0   ),
    .A1     (  num1   ),
    .A2     (  num2   ),
    .B0     (  num3   ),
    .B1     (  num4   ),
    .B2     (  num5   ),
    .C0     (  num6   ),
    .C1     (  num7   ),
    .C2     (  num8   ),
    .result ( result_0 )
);


csa_921     U_CSA_921_1(
    .clk    ( clk    ),
    .rst_n  ( rst_n  ),
    .A0     ( num9    ),
    .A1     ( num10     ),
    .A2     ( num11     ),
    .B0     ( num12     ),
    .B1     ( num13   ),
    .B2     ( num14   ),
    .C0     ( num15   ),
    .C1     ( num16   ),
    .C2     ( num17   ),
    .result ( result_1 )
);


csa_921     U_CSA_921_2(
    .clk    ( clk    ),
    .rst_n  ( rst_n  ),
    .A0     ( num18    ),
    .A1     ( num19    ),
    .A2     ( num20    ),
    .B0     ( num21    ),
    .B1     ( num22    ),
    .B2     ( num23    ),
    .C0     ( num24    ),
    .C1     ( num25    ),
    .C2     ( num26    ),
    .result ( result_2 )
);


csa_521     U_CSA_521_0(
    .clk    ( clk    ),
    .rst_n  ( rst_n  ),
    .A0     ( result_0    ),
    .A1     ( result_1    ),
    .A2     ( result_2    ),
    .B0     ( num27     ),
    .B1     ( num28     ),
    .result ( result )
);

endmodule
