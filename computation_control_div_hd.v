module computation_control_div_hd(
x_value,
d_value,
q_value,
cnt_master,
clk,
computation_cycle,
rd_addr,
wr_addr_RAM,
rd_addr_RAM,
write_enable,
fix_next_state,
STATE,
enable_all,
enable_cnt,
en_v_upper,
en_cout,
en_borrow,
en_shift,
en_d,
en_q,
fixing,
error_flag,
asyn_reset,
data_x_vld,
data_x_rdy,
data_d_vld,
data_d_rdy,
data_out_vld,
data_out_rdy,
x_value_reg,
d_value_reg,
q_value_reg
);

parameter RAM_ADDR_WIDTH=7;
// this block computes the cycles which are at computation at the moment
// also provides enable for Multiplier to know when to fetch from outside input data and also controls writing to the CA_RAM

//testing
// finished

input[RAM_ADDR_WIDTH+2-1:0] cnt_master;
input clk;
input asyn_reset;
input [1:0] x_value, d_value; 
input [1:0] q_value_reg;

output[RAM_ADDR_WIDTH - 1:0] computation_cycle;// this would always be the address
output write_enable;
output[2:0] STATE;
output enable_all;
output enable_cnt;
output en_v_upper;
output [1:0] x_value_reg, d_value_reg;
output fix_next_state;
output[1:0] en_borrow;
output data_out_vld;
output [1:0] q_value;
output [RAM_ADDR_WIDTH -1 :0] rd_addr;
output en_cout;
output[1:0] en_shift;
output[1:0] en_d, en_q;
output [RAM_ADDR_WIDTH -1 :0] wr_addr_RAM,rd_addr_RAM; 
output fixing;
output error_flag;
//handshake protocool
input data_x_vld,data_d_vld;
input data_out_rdy;
output data_x_rdy,data_d_rdy;

reg fixing;
reg error_flag;
reg [1:0] q_prev_value;
reg[RAM_ADDR_WIDTH - 1:0] computation_cycle;
reg hd_x,hd_d,hd_z;
reg [2:0] STATE,prev_STATE;
reg data_x_rdy,data_d_rdy,data_out_vld;
reg enable_all, enable_cnt;
reg[1:0] x_value_reg, d_value_reg;
reg [1:0] q_value;
reg[RAM_ADDR_WIDTH -1 :0] rd_addr;
reg write_enable;
reg fix_next_state;
reg en_v_upper;
reg en_cout;
reg[1:0] en_d, en_q;
reg[1:0] en_shift;
reg[1:0] en_borrow;
reg [RAM_ADDR_WIDTH -1 :0] wr_addr_RAM,rd_addr_RAM; 
wire[RAM_ADDR_WIDTH -1 :0] cycle_num;
 

parameter START = 3'd0;
parameter WRITE_IN = 3'd1;
parameter READ_OUT = 3'd2;
parameter READ_OUT_LAST_LINE = 3'd3;
parameter CLEAR = 3'd4;
parameter ERROR = 3'd5;
parameter WAIT = 3'd6;

initial begin
	computation_cycle <= 0;
	write_enable <= 0;
	STATE <= START;
end

assign cycle_num=cnt_master[RAM_ADDR_WIDTH+2-1:2];
//assign remainder=cnt_master[1:0];


reg do, record_do;

// do shows valid data_inputs
always @ (*) begin
	if (x_value[1] ^ x_value[0] ^ d_value[1] ^ d_value[0]) begin
		do <= 1;
	end
	else begin
		do <= 0;
	end
end
// use record_do to maintain high if do has been high
initial begin
	record_do <= 0;
end

always @ (posedge clk) begin
	if (do == 1) begin
		record_do <= 1;
	end
end



// STATE control
always@(posedge clk or posedge asyn_reset) begin
	if (asyn_reset == 1) begin
		STATE <= WAIT;
		hd_x <= 0;
		hd_d <= 0;
		hd_z <= 0;
		prev_STATE <= START;

	end
	else begin
		case(STATE)
			WAIT : begin
				if (do == 0 && record_do == 0) begin
					STATE <= WAIT;
				end
				else begin
					STATE <= START;
				end

			end
			START : begin
				if (hd_x == 1 && hd_d == 1) begin
					STATE <= WRITE_IN;
					hd_x <= 0;
					hd_d <= 0;
				end
				if (prev_STATE == WAIT) begin
					STATE <= WRITE_IN;
					hd_x <= 0;
					hd_d <= 0;
				end
				if (data_x_rdy && data_x_vld) begin
					hd_x <= 1; 
				end
				
				if (data_d_rdy && data_d_vld) begin
					hd_d <= 1;
				end
			end
			WRITE_IN: begin		// this always take one cycle to write only
				if (computation_cycle == 0) begin
					STATE <= READ_OUT_LAST_LINE;
					if (fixing == 1) begin
						STATE <= ERROR;
					end

				end
				else begin
					STATE <= READ_OUT;
					if (fixing == 1) begin
						STATE <= ERROR;
					end
				end
			end
			READ_OUT: begin
				if (computation_cycle == 0) begin
					STATE <= READ_OUT_LAST_LINE;
				end
			end
			READ_OUT_LAST_LINE : begin
				STATE <= CLEAR;
				if (error_flag == 1)begin
					STATE <= WRITE_IN;
				end
			end
			CLEAR: begin
				if (data_out_vld && data_out_rdy) begin
					hd_z <= 1;
				end
				if (hd_z == 1) begin
					hd_z <= 1'b0;
					STATE <= START;

				end
			end
			ERROR: begin
				if (computation_cycle > 0) begin
					STATE <= ERROR;					
				end
				if (computation_cycle == 0) begin
					STATE <= READ_OUT_LAST_LINE;
				end
			end
			default : begin
				STATE <= START;
			end
		endcase	
		prev_STATE <= STATE;
	end
end

// transaction dependent control signals

always @ (posedge clk or posedge asyn_reset) begin
	
	if (asyn_reset == 1) begin
		computation_cycle <= 0;
		x_value_reg <= 0;
		d_value_reg <= 0;	
		q_value<= 0;
		fix_next_state <= 0;
		wr_addr_RAM <= 0;
		rd_addr_RAM <= 0;
		fixing <= 0;

	end
	
	else begin
		case (STATE)
			START : begin
				if ((hd_x == 1 && hd_d == 1) || prev_STATE == WAIT ) begin //state changing
					computation_cycle <= cycle_num;
					x_value_reg <= x_value;
					d_value_reg <= d_value; // hd succeed, refresh inputs
					fix_next_state <= 0;
					rd_addr_RAM <= cycle_num;
					wr_addr_RAM <= cycle_num;
				end
			end
			WRITE_IN : begin
				if (computation_cycle == 0) begin //STATE changing
					fix_next_state <= 1;
					rd_addr_RAM <= cycle_num;
					wr_addr_RAM <= cycle_num;					
				end
				else begin
					computation_cycle <= computation_cycle - 7'b1;	
					fix_next_state <= 1;
					rd_addr_RAM <= computation_cycle - 7'b1;
					wr_addr_RAM <= computation_cycle;
				end
			end
			READ_OUT : begin
				if (computation_cycle == 0) begin //STATE changing
					fix_next_state <= 0;
					rd_addr_RAM <= 0;
					wr_addr_RAM <= 0;
				end
				else begin
					computation_cycle <= computation_cycle - 1'b1;
					fix_next_state <= 0;
					rd_addr_RAM <= rd_addr_RAM -7'b1;
					wr_addr_RAM <= wr_addr_RAM -7'b1;
				end
			end
			
			READ_OUT_LAST_LINE : begin
				if (error_flag == 1 && prev_STATE != ERROR)begin
					fixing <= 1;
					computation_cycle <= cycle_num;
					rd_addr_RAM <= cycle_num;
					wr_addr_RAM <= cycle_num;
				end
				else begin
					fixing <= 0;
					rd_addr_RAM <= 0;
					wr_addr_RAM <= 0;
				end
				if (error_flag != 1) begin
					q_value <= q_value_reg;	
				end
				fix_next_state <= 0;

			end

			
			CLEAR : begin
				if (hd_z == 1) begin
					fix_next_state <= 0;
				end
			end
			
			ERROR : begin
				if (computation_cycle > 0)begin
					computation_cycle <= computation_cycle - 1'b1;
					fix_next_state <= 0;
					rd_addr_RAM <= rd_addr_RAM -7'b1;
					wr_addr_RAM <= wr_addr_RAM -7'b1;
				end
				if (computation_cycle == 0) begin
					fixing <= 1; // fixing finishes later
					fix_next_state <= 0;
					rd_addr_RAM <= 0;
					wr_addr_RAM <= 0;
				end
			end
			
			default : begin
				computation_cycle <= 0;
				x_value_reg <= 0;
				d_value_reg <= 0;	
				q_value<= 0;
				fix_next_state <= 0;
			end
		endcase
	end
end

//STATE dependent signals

always @ (*) begin
	if (asyn_reset == 1) begin
		data_x_rdy <= 0;
		data_d_rdy <= 0;
		enable_all <= 0;
		write_enable <= 0;
		data_out_vld <= 0;
		enable_cnt <= 0;
		rd_addr <= 0;
		en_v_upper <= 0;
		en_cout <= 0;
		en_borrow <= 0;
		en_shift <= 0;
		en_d <= 0;
		en_q <= 0;

	end
	else begin
		case (STATE)
			WAIT : begin
				data_x_rdy <= 1;
				data_d_rdy <= 1;
				enable_all <= 0;
				write_enable <= 0;
				data_out_vld <= 1;
				enable_cnt <= 0;
				rd_addr <= 0;
				en_v_upper <= 0;
				en_cout <= 0;
				en_borrow <= 0;
				en_shift <= 0;
				en_d <= 0;
				en_q <= 0;
			end

			START : begin
				if (hd_x == 0) begin
					data_x_rdy <= 1;
				end
				else begin
					data_x_rdy <= 0;
				end
				if (hd_d == 0) begin
					data_d_rdy <= 1;
				end
				else begin
					data_d_rdy <= 0;
				end
				if (hd_x == 1 && hd_d == 1) begin
					rd_addr <= cycle_num;
				end
				else begin
					rd_addr <= computation_cycle;
				end					
				write_enable <= 0;
				enable_all <= 0;
				data_out_vld <= 0;
				enable_cnt <= 0;
				en_v_upper <= 0;
				en_cout <= 0;
				en_borrow <= 0;
				en_shift <= 0;
				en_d <= 0;
				en_q <= 0;

			end
			WRITE_IN : begin
			
				enable_all <= 1;
				data_x_rdy <= 0;
				data_d_rdy <= 0;
				data_out_vld <= 0;
				if (fixing == 1 )begin
					enable_cnt <= 0;
					write_enable <= 0;
				end
				else begin
					enable_cnt <= 1;
					write_enable <= 1;
				end
				en_v_upper <= 0;
				rd_addr <= computation_cycle;
				en_cout <= 0;
				en_borrow <= 0;
				en_shift <= 0;
				en_d <= 0;
				en_q <= 0;


			end
			READ_OUT : begin
				write_enable <= 0;
				enable_all <= 1;
				data_x_rdy <= 0;
				data_d_rdy <= 0;
				data_out_vld <= 0;
				enable_cnt <= 0;
				rd_addr <= computation_cycle;
				en_v_upper <= 0;
				en_cout <= 1;
				en_borrow <= 1;
				en_shift <= 1;
				en_d <= 1;
				en_q <= 1;
			end
			READ_OUT_LAST_LINE : begin
				write_enable <= 0;
				enable_all <= 1;
				data_x_rdy <= 0;
				data_d_rdy <= 0;
				data_out_vld <= 0;
				enable_cnt <=0;
				rd_addr <= computation_cycle;
				en_v_upper <= 1;
				en_cout <= 0;
				en_borrow <= 2;
				en_shift <= 2;
				en_d <= 2;
				en_q <= 2;
			end
			CLEAR : begin
				write_enable <= 0;
				enable_all <= 0;
				data_x_rdy <= 0;
				data_d_rdy <= 0;
				enable_cnt <= 0;
				en_v_upper <= 0;
				if (hd_z == 1) begin
					data_out_vld <= 0;
				end
				else begin 
					data_out_vld <= 1;
				end
				rd_addr <= computation_cycle;
				en_cout <= 0;
				en_borrow <= 0;
				en_shift <= 0;
				en_d <= 0;
				en_q <=0;

			end
			ERROR : begin
				write_enable <= 0;
				enable_all <= 1;
				data_x_rdy <= 0;
				data_d_rdy <= 0;
				data_out_vld <= 0;
				enable_cnt <= 0;
				rd_addr <= computation_cycle;
				en_v_upper <= 0;
				en_cout <= 1;
				en_borrow <= 1;
				en_shift <= 1;
				en_d <= 1;
				en_q <= 1;
			end
			default : begin
				write_enable <= 0;
				enable_all <= 0;
				data_x_rdy <= 0;
				data_d_rdy <= 0;
				data_out_vld <= 0;
				enable_cnt <= 0;
				rd_addr <= computation_cycle;
				en_v_upper <= 0;
				en_cout <= 0;
				en_borrow <= 0;
				en_shift <= 0;
				en_d <= 0;
				en_q <=0;
			end
		endcase
	end
end

// fixing schedule

always @ (posedge clk or posedge asyn_reset) begin
	if (asyn_reset == 1)begin
		q_prev_value <= 0;
	end
	else begin
		q_prev_value <= q_value_reg;
	end
end

always @ (*) begin
	if (en_d == 2 && fixing == 0) begin
		if (q_value_reg != q_prev_value) begin
			error_flag <= 1;
		end
		else begin
			error_flag <= 0;
		end
	end
	else begin
		error_flag <= 0;
	end
end

endmodule
