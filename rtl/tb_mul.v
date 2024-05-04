`timescale 1ns/1ps
module tb_mul();
reg clk;
reg rst_n;

/*  input  wire [14:0] X,            //4位整数，11位小数*/
  /*input  wire [0:0]  I_valid,      //输入有效，单周期脉冲*/

  /*output reg  [0:0]  mul_valid,    //输出乘数有效*/
  /*output reg  [25:0] multiplier_0, //6个输出乘数，15位整数，11位小数*/
  /*output reg  [25:0] multiplier_1,*/
  /*output reg  [25:0] multiplier_2,*/
  /*output reg  [25:0] multiplier_3,*/
  /*output reg  [25:0] multiplier_4,*/
  /*output reg  [25:0] multiplier_5*/
reg [14:0] X;
reg I_valid;

wire [25:0] result_buf;
wire [0:0] O_valid;

initial begin
  #0
  clk = 1'd0;
  rst_n = 1'd0;
  X = 0;
  I_valid = 0;
end

always begin
  #10
  clk = ~clk;
end

initial begin
  #20
  rst_n = 1'd1;
end

always begin
  #600
  X = {$random()}%20480;
  I_valid = 1'd1;
  #20
  I_valid = 1'd0;

end


initial begin
  #20000
  $finish;
end

initial begin
  $fsdbDumpfile("a.fsdb");
  $fsdbDumpvars(0);
end


ex_cal          U_EX_CAL_0(
    .clk        ( clk        ),
    .rst_n      ( rst_n      ),
    .X          ( X          ),
    .I_valid    ( I_valid    ),
    .result_buf ( result_buf ),
    .O_valid    ( O_valid    )
);

endmodule
