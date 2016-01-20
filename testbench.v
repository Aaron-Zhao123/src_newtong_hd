`timescale 1ns/1ps  
module testbench();

reg clk;
wire[1:0] data_out;
reg[1:0] x_in,y_in;
reg enable;
reg data_x_vld,data_y_vld,data_out_rdy;
wire data_x_rdy,data_y_rdy,data_out_vld;
reg asyn_reset;

integer data_in_file_x,data_in_file_y;
integer scan_file_x,scan_file_y;
integer control=0;
integer cnt=0;

Online_adder_hd adder(x_in[1],x_in[0],y_in[1],y_in[0],clk,data_out,
asyn_reset,
data_x_vld,
data_x_rdy,
data_y_vld,
data_y_rdy,
data_out_vld,
data_out_rdy);
initial begin
	clk=1;
	enable=1'b1;
	while(1) begin
		#10 clk=~clk;
		cnt = cnt + 1;
	end
end
// clock module, 50Mhz clk




initial begin
  data_in_file_x=$fopen("/home/aaron/verilog/add_hd/Online_adder_hd/x_value.txt","r");
  
  data_in_file_y=$fopen("/home/aaron/verilog/add_hd/Online_adder_hd/y_value.txt","r");
  asyn_reset <= 1;
end
initial begin 
	scan_file_x=$fscanf(data_in_file_x,"%b",x_in);
	scan_file_y=$fscanf(data_in_file_y,"%b",y_in);
	
	data_x_vld <= 1;
	data_y_vld <= 1;
	data_out_rdy <= 1;
end
always@(negedge clk) begin
	//if (cnt > 15) begin
	//	data_x_vld <= 0;
	//end

	asyn_reset <= 0;

	if(data_x_rdy && data_x_vld) begin
		scan_file_x=$fscanf(data_in_file_x,"%b",x_in);
	end
	if (data_y_rdy && data_y_vld) begin
		scan_file_y=$fscanf(data_in_file_y,"%b",y_in);
	end
end

endmodule
