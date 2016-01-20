
module computing_w_value_div(
clk,
v_plus_vec,
v_minus_vec,
v_upper_plus,
v_upper_minus,
d_plus_vec,
d_minus_vec,
residue_plus,
residue_minus,
res_upper_plus,
res_upper_minus,
enable_all,
enable_d,
enable_cout,
async_clear,
en_shift,
fixing,
error_flag,
write_addr,
read_addr
);

// compute w[j] and store 2w[j] into the RAM(lower components) and register (upper components)
parameter UNROLLING= 4;
parameter UPPER_BITS = 6; // shifting 4 bits + 2 integer bits
parameter RAM_width= 7;

input clk;
input [UNROLLING -1 :0] v_plus_vec, v_minus_vec, d_plus_vec, d_minus_vec;
input [UPPER_BITS -1 :0] v_upper_plus, v_upper_minus;
input enable_all;
input async_clear;
input enable_cout;
input [1:0] en_shift,enable_d;
input [RAM_width-1 :0] write_addr,read_addr;
input fixing;
input error_flag;

output [UNROLLING - 1 : 0] residue_plus, residue_minus;
output [UPPER_BITS -1 : 0] res_upper_plus, res_upper_minus;

reg [1:0] cin_one, cin_two;
reg [UNROLLING -1 : 0] d_plus_delayed,d_minus_delayed, add_operand_plus, add_operand_minus;
wire [UPPER_BITS- 1 : 0] w_upper_plus, w_upper_minus;
wire [UNROLLING -1 : 0] w_plus_vec, w_minus_vec;
wire [1:0] cout_one, cout_two;
reg [1:0] shift_to_uppper;
reg [1:0] shift_out, shift_in;
reg we_RAM;
reg [UPPER_BITS -1 : 0] res_upper_plus, res_upper_minus;
// this holds the upper value


always @ (posedge clk or posedge async_clear) begin
	if (async_clear == 1) begin
		d_plus_delayed <= 0;
		d_minus_delayed <= 0;
	end
	else begin
		if (enable_d == 1) begin
			d_plus_delayed <= d_plus_vec;
			d_minus_delayed <= d_minus_vec;
		end
		else begin
			d_plus_delayed <= 0;
			d_minus_delayed <= 0;
		end
	end
end

four_bits_adder_div adder1(d_plus_delayed, d_minus_delayed, v_plus_vec, v_minus_vec, w_plus_vec, w_minus_vec, cin_one, cout_one);


always @ (posedge clk or posedge async_clear) begin
	if (async_clear == 1) begin
		cin_one <= 0;
	end
	else begin // this must be else begin
		if (enable_cout == 1) begin
			cin_one <= cout_one;
		end
		else begin
			cin_one <= 0;
		end
	end
end

always @ (*) begin
	if (enable_d == 2) begin // last stage
		add_operand_plus <= d_plus_vec;
		add_operand_minus <= d_minus_vec;
		cin_two <= cout_one;
	end
	else begin
		add_operand_plus <= 0;
		add_operand_minus <= 0;
		cin_two <= 0;
	end
end

six_bits_adder_div adder2 (v_upper_plus, v_upper_minus, {1'b0,1'b0,add_operand_plus}, {1'b0,1'b0,add_operand_minus}, w_upper_plus, w_upper_minus, cin_two, cout_two);


// store MDS and res
// shift w value and put them in register/ram
always @ (*) begin
	if (en_shift == 2'b01) begin
		shift_out[1] <= w_plus_vec[UNROLLING-1];
		shift_out[0] <= w_minus_vec[UNROLLING-1];
		shift_to_uppper <= 0;
	end
	else if (en_shift == 2'b10) begin
		shift_out <= 0;
		shift_to_uppper[1] <= w_plus_vec[UNROLLING-1];
		shift_to_uppper[0] <= w_minus_vec[UNROLLING-1];
	end
	else begin
		shift_out <= 0;
		shift_to_uppper <= 0;
	end
end

always @ (posedge clk or posedge async_clear) begin
	if (async_clear == 1) begin
		shift_in <= 0;
	end
	else begin
		if (en_shift == 1) begin
			shift_in <= shift_out;
		end
		else begin
			shift_in <= 0;
		end
	end
end

always @ (*) begin
	if (en_shift == 2'b01 || en_shift == 2'b10) begin
		we_RAM <= 1;
	end
	else begin
		we_RAM <= 0;
	end
end


// shift_to_upper assigned with meaningful value when enable_shfit=2
always @ (posedge clk or posedge async_clear) begin
	if (async_clear == 1) begin
		res_upper_plus <= 0;
		res_upper_minus <= 0;
	end
	else begin
		if (en_shift == 2'b10 && error_flag == 0) begin
			res_upper_plus <= {w_upper_plus[UPPER_BITS-2 : 0],shift_to_uppper[1]};
			res_upper_minus <= {w_upper_minus[UPPER_BITS-2 : 0],shift_to_uppper[0]};
		end
	end
	
end

// ram to store residue value 

single_clk_ram_4bit_div ram1({w_plus_vec[UNROLLING-2:0], shift_in[1]},write_addr,read_addr,we_RAM,clk,async_clear,residue_plus );
single_clk_ram_4bit_div ram2({w_minus_vec[UNROLLING-2:0], shift_in[0]},write_addr,read_addr,we_RAM,clk,async_clear,residue_minus );


// MSD update



endmodule
