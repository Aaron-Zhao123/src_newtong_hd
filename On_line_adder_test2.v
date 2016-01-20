module On_line_adder_test2 (x_plus,x_minus,y_plus,y_minus,clk,z);
 //this part of code follows diagram of RADIX_2 ON-line ADDER
	
	output[1:0] z;
	input clk;
	input x_plus,x_minus,y_plus,y_minus;
	

	wire [1:0] g_out;
	wire [1:0] g_in,g_out_tmp;
	wire t,h,w_in,w_out;
	wire x_minus_tmp,t_tmp;
	wire g_in_tmp;
	
	//buliding handshake mechanism with other moduels

	
	
	
	
		
	
	assign x_minus_tmp=~x_minus;
	full_adder FA1(x_plus,x_minus_tmp,y_plus,h,g_in[1]);
	
	
	assign g_in[0]=y_minus;
	assign g_in_tmp=~g_in[1];
	D_flipflop D1(clk,g_in_tmp,g_out[1]);
	D_flipflop D2(clk,g_in[0],g_out[0]);
		
	assign g_out_tmp=~g_out;
	full_adder FA2 (g_out_tmp[1],g_out_tmp[0],h,t,w_in);
	
	D_flipflop D3(clk,w_in,w_out);
	assign t_tmp=~t;
	D_flipflop D4(clk,t_tmp,z[0]);
	D_flipflop D5(clk,w_out,z[1]);
	
endmodule
	