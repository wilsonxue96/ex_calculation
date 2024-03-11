module multiplier(
  input  wire [0:0]  clk,
  input  wire [0:0]  rst_n,

  input  wire [14:0] X,            //4位整数，11位小数
  input  wire [0:0]  I_valid,      //输入有效，单周期脉冲

  output reg  [0:0]  mul_valid,    //输出乘数有效
  output reg  [25:0] multiplier_0, //6个输出乘数，15位整数，11位小数
  output reg  [25:0] multiplier_1,
  output reg  [25:0] multiplier_2,
  output reg  [25:0] multiplier_3,
  output reg  [25:0] multiplier_4,
  output reg  [25:0] multiplier_5,
);

  //信号定义
  reg  [0:0]  I_valid_buf;    //输入有效信号缓冲
  reg  [2:0]  state_cnt;      //循环轮数计数
  wire [14:0] data_sub;       //X减去减数后的差
  wire [14:0] sel_input_data; //输入给selection的信号
  wire [25:0] data_mul; //计算出的乘数
  wire [4:0] i;
  wire [0:0] int_or_fra;

  //状态机状态定义
  parameter IDLE      = 4'b0001;
  parameter selection = 4'b0010;
  parameter mulgen    = 4'b0100;
  parameter out       = 4'b1000;
  
  reg [3:0] current_state;
  reg [3:0] next_state;

  //current状态转移
  always@(posedge clk) begin
    if(!rst_n) begin
      current_state <= IDLE;
    end
    else begin
      current_state <= next_state;
    end
  end

  //next状态转移
  always@(*) begin
    case (current_state) 
      IDLE : begin
        next_state = I_valid_buf ? selection : IDLE;
      end

      selection : begin
        next_state = mulgen;
      end

      mulgen : begin
        next_state = out;
      end

      out : begin
        next_state = ( (state_cnt == 3'd5) || (data_sub < 15'd1) ) ? IDLE : selection;
      end

      default : begin
        next_state = IDLE;
      end
    endcase
  end

  //I_valid_buf
  always@(posedge clk) begin
    if(!rst_n) begin
      I_valid_buf <= 1'b0;
    end
    else begin
      I_valid_buf <= I_valid;
    end
  end

  //state_cnt
  always@(posedge clk) begin
    if(!rst_n) begin
      state_cnt <= 3'd0;
    end
    else if(current_state = IDLE) begin
      state_cnt <= 3'd0;
    end
    else if(current_state = selection) begin
      state_cnt <= state_cnt + 1'b1;
    end
    else begin
      state_cnt <= state_cnt;
    end
  end
  
  //sel_input_data可以来自输入也可以来自data_sub
  assign sel_input_data = (state_cnt == 3'd0) ？X : data_sub; 

  //multiplier_0 2 multiplier_5
  always@(posedge clk) begin
    if(!rst_n) begin
      multiplier_0 <= 26'd0;
      multiplier_1 <= 26'd0;
      multiplier_2 <= 26'd0;
      multiplier_3 <= 26'd0;
      multiplier_4 <= 26'd0;
      multiplier_5 <= 26'd0;
    end
    else if(current_state == out) begin
      case (state_cnt) begin
        3'd0 : begin
          multiplier_0 <= data_mul;
        end
        
        3'd1 : begin
          multiplier_1 <= data_mul;
        end

        3'd2 : begin
          multiplier_2 <= data_mul;
        end

        3'd3 : begin
          multiplier_3 <= data_mul;
        end

        3'd4 : begin
          multiplier_4 <= data_mul;
        end

        3'd5 : begin
          multiplier_5 <= data_mul;
        end

        default : begin
          multiplier_0 <= 26'd0;
          multiplier_1 <= 26'd0;
          multiplier_2 <= 26'd0;
          multiplier_3 <= 26'd0;
          multiplier_4 <= 26'd0;
          multiplier_5 <= 26'd0;
        end
      endcase
    end
    else begin
          multiplier_0 <= multiplier_0;
          multiplier_1 <= multiplier_1;
          multiplier_2 <= multiplier_2;
          multiplier_3 <= multiplier_3;
          multiplier_4 <= multiplier_4;
          multiplier_5 <= multiplier_5;
    end
  end

  //mul_valid
  always@(posedge clk) begin
    if(!rst_n) begin
      mul_valid <= 1'b0;
    end
    else if((cnt_state == 3'd5) & (current_state = out)) begin
      mul_valid <= 1'b1;
    end
    else if(mul_valid) begin
      mul_valid <= 1'b0;
    end
    else begin
      mul_valid <= mul_valid;
    end
  end

//例化
selection       U_SELECTION_0(
    .clk        ( clk            ),
    .rst_n      ( rst_n          ),
    .data       ( sel_input_data ),
    .i          ( i              ),
    .int_or_fra ( int_or_fra     )
);


mul_gen         U_MUL_GEN_0(
    .clk        ( clk            ),
    .rst_n      ( rst_n          ),
    .i          ( i              ),
    .data       ( sel_input_data ),
    .int_or_fra ( int_or_fra     ),
    .data_mul   ( data_mul       ),
    .data_sub   ( data_sub       )
);

endmodule
