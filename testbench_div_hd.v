`timescale 1ns/1ps
module testbench_div_hd();

reg clk;
reg asyn_reset;
reg [1:0] x_value, d_value;
wire [1:0] q_value; 

reg data_x_vld,data_d_vld,data_out_rdy;
wire data_x_rdy,data_d_rdy,data_out_vld;

integer data_in_file_x,data_in_file_y;
integer scan_file_x,scan_file_y;
integer data_out_file;
integer cnt = 0;
integer flag;
integer stop;

Divider_hd test(
x_value, 
d_value, 
q_value, 
clk, 
asyn_reset,
data_x_vld, 
data_x_rdy, 
data_d_vld, 
data_d_rdy, 
data_out_vld, 
data_out_rdy);

initial begin
	clk=1;
	while(1) begin
		#10 clk=~clk;
	end
end




initial begin
  data_in_file_x=$fopen("/home/aaron/verilog/file_IO/Online_div_hd/result_one.dat","r");
  
  data_in_file_y=$fopen("/home/aaron/verilog/file_IO/Online_div_hd/result_two.dat","r");
  data_out_file = $fopen("/home/aaron/verilog/file_IO/Online_div_hd/quotient.dat","w");
end

initial begin
	scan_file_x=$fscanf(data_in_file_x,"%b",x_value);
	scan_file_y=$fscanf(data_in_file_y,"%b",d_value);
	data_x_vld <= 1;
	data_d_vld <= 1;
	data_out_rdy <= 1;
	asyn_reset = 1;
	flag <= 0;
	stop <= 3;
end

always@(negedge clk) begin
	//if (cnt > 95) begin
//		data_out_rdy <= 0;
//	end
	if(data_x_rdy && data_x_vld) begin
		scan_file_x=$fscanf(data_in_file_x,"%b",x_value);
	end
	if (data_d_rdy && data_d_vld) begin
		scan_file_y=$fscanf(data_in_file_y,"%b",d_value);
	end
	if (data_out_rdy && data_out_vld) begin
		$fwrite(data_out_file,"%b\n",q_value);
		cnt = cnt +1;
	end
	
	if (cnt == 101) begin
		asyn_reset = 1;
		flag <= 1;
	end
	
	if (flag == 1) begin
		stop <= stop - 1;
		if (stop == 0) begin
			flag <= 0;
			stop <= 3;
			asyn_reset <= 0;
			cnt <= 0;
		end
	end
	else begin
		asyn_reset = 0;
	end
end

endmodule

