
`timescale 1ns/1ps
module ex_cal(
  input  wire [0:0]  clk,
  input  wire [0:0]  rst_n,

  input  wire [14:0] X,            //4位整数，11位小数
  input  wire [0:0]  I_valid,      //输入有效，单周期脉冲

  output reg [0:0] O_valid,
  output reg [25:0] result_buf
);

  //根据multiplier来确定abcde
  wire [5:0] multiplier_0; //{int_or_fra (value 1 means int), i}
  wire [5:0] multiplier_1;
  wire [5:0] multiplier_2;
  wire [5:0] multiplier_3;
  wire [5:0] multiplier_4;
  wire [5:0] multiplier_5;

  wire [4:0] a;
  wire [4:0] b;
  wire [4:0] c;
  wire [4:0] d;
  wire [4:0] e;
  wire [4:0] m;

  assign a = multiplier_1[4:0];
  assign b = multiplier_2[4:0];
  assign c = multiplier_3[4:0];
  assign d = multiplier_4[4:0];
  assign e = multiplier_5[4:0];

  assign m = multiplier_0[4:0];

  //确定num0-28

  wire [25:0] num0 ;
  wire [25:0] num1 ;
  wire [25:0] num2 ;
  wire [25:0] num3 ;
  wire [25:0] num4 ;
  wire [25:0] num5 ;
  wire [25:0] num6 ;
  wire [25:0] num7 ;
  wire [25:0] num8 ;
  wire [25:0] num9 ;
  wire [25:0] num10;
  wire [25:0] num11;
  wire [25:0] num12;
  wire [25:0] num13;
  wire [25:0] num14;
  wire [25:0] num15;
  wire [25:0] num16;
  wire [25:0] num17;
  wire [25:0] num18;  
  wire [25:0] num19;
  wire [25:0] num20;
  wire [25:0] num21;
  wire [25:0] num22;
  wire [25:0] num23;
  wire [25:0] num24;
  wire [25:0] num25;
  wire [25:0] num26;
  wire [25:0] num27;
  wire [25:0] num28;

  assign num0 = (26'h800) << m;

  assign num1 = ((26'h800) << m) >> a;
  assign num2 = ((26'h800) << m) >> b;
  assign num3 = ((26'h800) << m) >> c;
  assign num4 = ((26'h800) << m) >> d;
  assign num5 = ((26'h800) << m) >> e;

  assign num6 = (((26'h800) << m) >> a) >> b;
  assign num7 = (((26'h800) << m) >> a) >> c;
  assign num8 = (((26'h800) << m) >> a) >> d;
  assign num9 = (((26'h800) << m) >> a) >> e;
  assign num10 = (((26'h800) << m) >> b) >> c;
  assign num11 = (((26'h800) << m) >> b) >> d;
  assign num12 = (((26'h800) << m) >> b) >> e;
  assign num13 = (((26'h800) << m) >> c) >> d;
  assign num14 = (((26'h800) << m) >> c) >> e;
  assign num15 = (((26'h800) << m) >> d) >> e;

  assign num16 = ((((26'h800) << m) >> a) >> b) >> c;
  assign num17 = ((((26'h800) << m) >> a) >> b) >> d;
  assign num18 = ((((26'h800) << m) >> a) >> b) >> e;
  assign num19 = ((((26'h800) << m) >> a) >> c) >> d;
  assign num20 = ((((26'h800) << m) >> a) >> c) >> e;
  assign num21 = ((((26'h800) << m) >> a) >> d) >> e;
  assign num22 = ((((26'h800) << m) >> b) >> c) >> d;
  assign num23 = ((((26'h800) << m) >> b) >> c) >> e;
  assign num24 = ((((26'h800) << m) >> c) >> d) >> e;

  assign num25 = (((((26'h800) << m) >> a) >> b) >> c) >> d;
  assign num26 = (((((26'h800) << m) >> a) >> b) >> c) >> e;
  assign num27 = (((((26'h800) << m) >> b) >> c) >> d) >> e;

  assign num28 = ((((((26'h800) << m) >> a) >> b) >> c) >> d) >> e;

  //ready
  reg [0:0] ready;
  reg [4:0] state_cnt;

  always@(posedge clk) begin
    if(!rst_n) begin
      ready <= 1'd1;
    end
    else if(I_valid & ready) begin
      ready <= 1'd0;
    end
    else if(state_cnt == 5'd25) begin
      ready <= 1'd1;
    end
    else begin
      ready <= ready;
    end
  end
  //state_cnt
  always@(posedge clk) begin
    if(!rst_n) begin
      state_cnt <= 5'd0;
    end
    else if((state_cnt == 5'd25) && (ready == 1'd0)) begin
      state_cnt <= 5'd0;
    end
    else if(ready == 1'd0) begin
      state_cnt <= state_cnt + 1'd1;
    end
    else begin
      state_cnt <= state_cnt;
    end
  end

  //O_valid
  always@(posedge clk) begin
    if(!rst_n) begin
      O_valid <= 1'd0;
    end
    else if((state_cnt == 5'd25) && ~ready) begin
      O_valid <= 1'd1;
    end
    else begin
      O_valid <= 1'd0;
    end
  end

  //X_buf (input data buffer)
  reg [14:0] X_buf;
  
  always@(posedge clk) begin
    if(!rst_n) begin
      X_buf <= 15'd0;
    end
    else if(I_valid & ready) begin
      X_buf <= X;
    end
    else begin
      X_buf <= X_buf;
    end
  end

  //result_buf
  wire [25:0] result; 

  always@(posedge clk) begin
    if(!rst_n) begin
      result_buf <= 26'd0;
    end
    else if((state_cnt == 5'd25) && ~ready) begin
      result_buf <= result;
    end
    else begin
      result_buf <= result_buf;
    end
  end

  csa_2921    U_CSA_2921_0(
      .clk    ( clk    ),
      .rst_n  ( rst_n  ),
      .num0   ( num0   ),
      .num1   ( num1   ),
      .num2   ( num2   ),
      .num3   ( num3   ),
      .num4   ( num4   ),
      .num5   ( num5   ),
      .num6   ( num6   ),
      .num7   ( num7   ),
      .num8   ( num8   ),
      .num9   ( num9   ),
      .num10  ( num10  ),
      .num11  ( num11  ),
      .num12  ( num12  ),
      .num13  ( num13  ),
      .num14  ( num14  ),
      .num15  ( num15  ),
      .num16  ( num16  ),
      .num17  ( num17  ),
      .num18  ( num18  ),
      .num19  ( num19  ),
      .num20  ( num20  ),
      .num21  ( num21  ),
      .num22  ( num22  ),
      .num23  ( num23  ),
      .num24  ( num24  ),
      .num25  ( num25  ),
      .num26  ( num26  ),
      .num27  ( num27  ),
      .num28  ( num28  ),
      .result ( result )
  );


  multiplier        U_MULTIPLIER_0(
      .clk          ( clk          ),
      .rst_n        ( rst_n        ),
      .X            ( X_buf        ),
      .I_valid      ( I_valid      ),
      .mul_valid    ( mul_valid    ),
      .multiplier_0 ( multiplier_0 ),
      .multiplier_1 ( multiplier_1 ),
      .multiplier_2 ( multiplier_2 ),
      .multiplier_3 ( multiplier_3 ),
      .multiplier_4 ( multiplier_4 ),
      .multiplier_5 ( multiplier_5 )
  );

endmodule
