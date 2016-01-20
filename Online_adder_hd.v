module Online_adder_hd (x_plus,
x_minus,
y_plus,
y_minus,
clk,
z,
asyn_reset,
data_x_vld,
data_x_rdy,
data_y_vld,
data_y_rdy,
data_out_vld,
data_out_rdy	
);
 //this part of code follows diagram of RADIX_2 ON-line ADDER
 // This is a SERIAL adder
	
	
	parameter START=2'd0;
	parameter COMP=2'd1;
	parameter END=2'd2;
	
	
	output[1:0] z;
	input clk;
	input asyn_reset; 
	input x_plus,x_minus,y_plus,y_minus;
	
	// declaring hd signals, two inputs and one output
	input data_x_vld,data_y_vld,data_out_rdy;
	output data_x_rdy,data_y_rdy,data_out_vld;

	wire [1:0] g_out;
	wire [1:0] g_in,g_out_tmp;
	wire t,h,w_in,w_out;
	wire x_minus_tmp,t_tmp;
	wire g_in_tmp;
	reg [1:0] STATE;
	reg hd_x,hd_y,hd_z;
	reg enable_all;
	reg data_x_rdy,data_y_rdy,data_out_vld;
	reg x_plus_reg,x_minus_reg,y_plus_reg,y_minus_reg;

	
	//buliding handshake mechanism with other moduels
	// hd FSM, state transitions
	always @ (posedge clk or posedge asyn_reset) begin
		if (asyn_reset == 1) begin 
			STATE <= START;
			hd_x <= 0;
			hd_y <= 0;
			hd_z <= 0;
			STATE <= START;
			x_plus_reg <= 0;
			x_minus_reg <= 0;
			y_plus_reg <= 0;
			y_minus_reg <= 0;
				
		end
		else begin
			case (STATE)
				START: begin
					// if both hd happen 
					if (hd_x == 1 && hd_y == 1) begin
						STATE <= COMP;
						hd_x <= 0;
						hd_y <= 0;
						x_plus_reg <= x_plus;
						x_minus_reg <= x_minus;
						y_plus_reg <= y_plus;
						y_minus_reg <= y_minus;
					end
					if (data_x_rdy && data_x_vld) begin
						hd_x <= 1;
					end
					if (data_y_rdy && data_y_vld) begin
						hd_y <= 1;
					end
				end
				COMP: begin
					STATE <= END;
				end
				END: begin
					if (hd_z == 1) begin 
						STATE <= START;
						hd_z <= 0;
					end
					if (data_out_vld && data_out_rdy) begin
						hd_z <= 1;
					end
				end
				default: begin
					STATE <= START;
				end
			endcase
		end
	end
	

	//STATE actions
	//output signals are data_x_rdy,data_y_rdy,data_out_vld;
	always @ (*) begin
		case (STATE)
			START: begin
				if (hd_x == 0) begin
					data_x_rdy <= 1;
				end
				else begin 
					data_x_rdy <= 0;
				end

				if (hd_y == 0) begin
					data_y_rdy <= 1;
				end
				else begin
					data_y_rdy <= 0;
				end
				
				
				enable_all <= 0;
				data_out_vld <=0;
			end
			COMP: begin
				enable_all <= 1;
				data_x_rdy <= 0;
				data_y_rdy <= 0;
				data_out_vld <= 0;
			end
			END: begin
				enable_all <= 0;
				data_x_rdy <= 0;
				data_y_rdy <= 0;
				data_out_vld <= 1;
			end
			default: begin
				enable_all <= 0;
				data_x_rdy <= 0;
				data_y_rdy <= 0;
				data_out_vld <= 0;
			end
		endcase
	end

	assign x_minus_tmp=~x_minus_reg;
	full_adder FA1(x_plus_reg,x_minus_tmp,y_plus_reg,h,g_in[1]);
	
	
	assign g_in[0]=y_minus_reg;
	assign g_in_tmp=~g_in[1];
	D_flipflop D1(clk,enable_all,g_in_tmp,g_out[1]);
	D_flipflop D2(clk,enable_all,g_in[0],g_out[0]);
		
	assign g_out_tmp=~g_out;
	full_adder FA2 (g_out_tmp[1],g_out_tmp[0],h,t,w_in);
	
	D_flipflop D3(clk,enable_all,w_in,w_out);
	assign t_tmp=~t;
	D_flipflop D4(clk,enable_all,t_tmp,z[0]);
	D_flipflop D5(clk,enable_all,w_out,z[1]);
	
endmodule
	
