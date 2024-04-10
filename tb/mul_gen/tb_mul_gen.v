module tb_mul_gen();
reg clk;
reg rst_n;
reg [14:0] data;

reg [4:0] i;
reg int_or_fra;

wire [25:0] data_mul;
wire [14:0] data_sub;



initial begin
  #0
  clk = 1'd0;
  rst_n = 1'd0;
  data = 15'd0;
end

always begin
  #10
  clk = ~clk;
end

initial begin
  #20
  rst_n = 1'd1;
end

reg [10:0] ran;
reg [3:0] intt = 4'b0000;
//case 1 int
always begin
  //int_or_fra <= (data < 15'b000010110001011) ? 1'b0 : 1'b1;
  #50
  ran = $random();
  //data = {intt, ran[10:0]};
  data = 26'h33c;
  intt = intt + 1'b1;
end


initial begin
  #2000
  $finish;
end

initial begin
  $fsdbDumpfile("a.fsdb");
  $fsdbDumpvars(0);
end


selection       U_SELECTION_0(
    .clk        ( clk        ),
    .rst_n      ( rst_n      ),
    .data       ( data       ),
    .i          ( i          ),
    .int_or_fra ( int_or_fra )
);

mul_gen         U_MUL_GEN_0(
    .clk        ( clk        ),
    .rst_n      ( rst_n      ),
    .i          ( i          ),
    .data       ( data       ),
    .int_or_fra ( int_or_fra ),
    .data_mul   ( data_mul   ),
    .data_sub   ( data_sub   )
);

endmodule
