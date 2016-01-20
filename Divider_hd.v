module Divider_hd (
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

parameter RAM_ADDR_WIDTH=7;
parameter UNROLL_WIDTH = 4;
parameter UPPER_BITS= 6;

input [1:0] x_value, d_value;
input clk;
input asyn_reset;
input data_x_vld, data_x_rdy, data_d_vld, data_d_rdy;
input data_out_rdy;
output [1:0] q_value;
output data_out_vld;

wire [RAM_ADDR_WIDTH + 2 - 1 : 0] cnt_master;
wire [RAM_ADDR_WIDTH - 1 : 0] comp_cycle;
wire [RAM_ADDR_WIDTH - 1 : 0] rd_addr, wr_addr_RAM, rd_addr_RAM;
wire [1:0] x_value_reg, d_value_reg, q_value_reg;
wire wr_enable, enable_all, enable_cnt;
wire fix_next_state;
wire en_v_upper,en_cout;
wire[1:0] en_d, en_q;
wire[1:0] en_borrow,en_shift;
wire [2:0] STATE;
wire fixing;
wire error_flag;

wire [UNROLL_WIDTH - 1 : 0] q_plus, q_minus, d_plus, d_minus, q_plus_delay, q_minus_delay;
wire [UNROLL_WIDTH - 1 : 0] q_plus_sel, q_minus_sel, d_plus_sel, d_minus_sel;
wire [UNROLL_WIDTH -1 :0] residue_plus, residue_minus, v_plus_vec, v_minus_vec;
wire [UPPER_BITS -1 :0] v_upper_plus, v_upper_minus, res_upper_plus, res_upper_minus;

 // section one finsihed
computation_control_div_hd FSM(
x_value,
d_value,
q_value,
cnt_master,
clk,
comp_cycle,
rd_addr,
wr_addr_RAM,
rd_addr_RAM,
wr_enable,
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

generate_CA_reg_div_hd CA_reg(
comp_cycle,
rd_addr,
q_value, // testing for now
d_value_reg,
q_plus,
q_minus,
d_plus,
d_minus,
clk,
asyn_reset,
cnt_master,
enable_all,
wr_enable);

counter_div main_counter(
enable_cnt,
clk,
cnt_master,
asyn_reset);

/*

reg[1:0] q_feeding_d;
reg[1:0] q_prev;
always @ (posedge clk or asyn_reset )begin
	if (asyn_reset == 1 )begin
		q_prev <= 0;
	end
	else begin
		if (error_flag == 1) begin
			q_prev <= q_value;
		end
	end
end
always @ (*) begin
	if (fixing == 0) begin
		q_feeding_d <= q_value_reg;
	end
	else begin
		q_feeding_d <= q_prev;
	end

end*/
// section two 

vector_delay_div vec_D(
q_plus, 
q_minus, 
clk, 
STATE, 
cnt_master, 
q_plus_delay, 
q_minus_delay, 
enable_all,
fix_next_state, // this focus on the state that has been written
asyn_reset,
comp_cycle);

SDVM_div SDVM_q_Vec(
clk,
q_plus,
q_minus, 
~d_value_reg, // to perform the subtraction
q_plus_sel,
q_minus_sel,
enable_all,
asyn_reset);

SDVM_div SDVM_d_Vec(
clk,
d_plus,
d_minus, 
~q_value_reg,  //testing for now
d_plus_sel,
d_minus_sel,
enable_all,
asyn_reset);

// section two finsihed 

// section three 


computing_v_value_div V_block(
clk,
q_value_reg,
q_plus_sel, 
q_minus_sel, 
residue_plus, 
residue_minus, 
res_upper_plus,
res_upper_minus,
v_plus_vec, 
v_minus_vec, 
v_upper_plus,
v_upper_minus,
d_value_reg, 
x_value_reg, 
asyn_reset, 
enable_all, 
en_v_upper,
en_cout,
en_borrow,
en_q,
en_shift,
fixing,
error_flag,
wr_addr_RAM,
rd_addr_RAM
);
 
computing_w_value_div W_block(
clk,
v_plus_vec,
v_minus_vec,
v_upper_plus,
v_upper_minus,
d_plus_sel,
d_minus_sel,
residue_plus,
residue_minus,
res_upper_plus,
res_upper_minus,
enable_all,
en_d,
en_cout,
asyn_reset,
en_shift,
fixing,
error_flag,
wr_addr_RAM,
rd_addr_RAM
);


endmodule

