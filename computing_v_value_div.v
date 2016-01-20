module computing_v_value_div(
clk,
q_value,
q_plus_vec, 
q_minus_vec, 
residue_plus, 
residue_minus, 
res_upper_plus, 
res_upper_minus,
v_plus_vec_out, 
v_minus_vec_out,
v_upper_plus,
v_upper_minus, 
d_value_reg, 
x_value_reg, 
async_clear, 
enable_all, 
en_v_upper,
en_cout,
en_borrow,
en_q,
en_shift,
fixing,
error_flag,
wr_V_ram,
rd_V_ram
 );

parameter UNROLLING= 4;
parameter UPPER_BITS = 6; // shifting 4 bits + 2 integer bits
parameter RAM_width= 7;


input [UNROLLING-1:0] q_plus_vec, q_minus_vec, residue_plus, residue_minus;
input [1:0] d_value_reg, x_value_reg;
input async_clear, enable_all, en_v_upper, en_cout; // control signals
input clk;
input [UPPER_BITS-1 : 0] res_upper_plus, res_upper_minus;
input[1:0] en_borrow;
input[1:0] en_q;
input fixing,error_flag;
input [RAM_width-1 :0] wr_V_ram,rd_V_ram;
input [1:0] en_shift;

wire [UNROLLING -1 : 0] v_plus_vec_rd_out, v_minus_vec_rd_out;
output [UNROLLING - 1 : 0] v_plus_vec_out, v_minus_vec_out;
output [UPPER_BITS-1 : 0] v_upper_plus, v_upper_minus;
output [1:0] q_value;


wire [UPPER_BITS-1 : 0] v_upper_value;
wire [UNROLLING -1 :0] tmp_vec_plus, tmp_vec_minus; 
wire [1:0] cout_one;

reg [UNROLLING - 1 : 0] v_plus_vec_out, v_minus_vec_out;
reg [1:0] q_value;
reg [1:0] q_fixing_value;
reg [1:0] tmp_out;
reg [1:0] cin_one,cin_two;
reg [UNROLLING -1 : 0] v_plus_vec, v_minus_vec;
reg [UPPER_BITS-1 : 0] v_upper_plus, v_upper_minus;
reg [UPPER_BITS-1 : 0] v_upper_plus_reg, v_upper_minus_reg;

reg borrow_out, borrow_in , borrow_out_MSD;
reg [UNROLLING -1 : 0] q_plus_add, q_minus_add;
reg we_v_RAM;
// computing lower components


// store value of v_vec----------------new change --------------
always @ (*) begin
	if ((en_shift == 1 || en_shift == 2) && fixing != 1) begin
		we_v_RAM <= 1;
	end
	else begin
		we_v_RAM <= 0;
	end
end

always @ (*) begin
	if (fixing) begin
		v_plus_vec_out <= v_plus_vec_rd_out;
		v_minus_vec_out <= v_minus_vec_rd_out;
	end
	else begin
		v_plus_vec_out <= v_plus_vec;
		v_minus_vec_out <= v_minus_vec;
	end
end
single_clk_ram_4bit_div ram1(v_plus_vec,wr_V_ram,rd_V_ram,we_v_RAM,clk,async_clear,v_plus_vec_rd_out );
single_clk_ram_4bit_div ram2(v_minus_vec,wr_V_ram,rd_V_ram,we_v_RAM,clk,async_clear,v_minus_vec_rd_out );




always @ (posedge clk or posedge async_clear) begin
	if (async_clear == 1 ) begin
		q_plus_add <= 0;
		q_minus_add <= 0;
	end
	else begin
		if (en_q == 1) begin
			q_plus_add <= q_plus_vec;
			q_minus_add <= q_minus_vec;
		end
		else begin
			q_plus_add <= 0;
			q_minus_add <= 0;
		end
	end
end

four_bits_adder_div adder1(q_plus_add, q_minus_add, residue_plus, residue_minus, tmp_vec_plus, tmp_vec_minus, cin_one, cout_one);


// non-last line procedure
always @ (posedge clk or posedge async_clear) begin
	if (async_clear == 1 ) begin
		cin_one <= 0;
	end 
	else begin
		if (enable_all) begin
			if (en_cout) begin
				cin_one <= cout_one;
			end
			else begin
				cin_one <= 0;
			end
		end
	end
end

// last line procedure 
always @ (*) begin
	if (async_clear == 1) begin
		v_plus_vec <= 0;
		v_minus_vec <= 0;
		tmp_out <= 0;
	end
	/*else begin
		if (en_v_upper == 1) begin // we have to take account of the x value now
			{tmp_out[1],v_plus_vec} = tmp_vec_plus + {x_value_reg[1], 1'b0, 1'b0, 1'b0};
			{tmp_out[0],v_minus_vec} = tmp_vec_minus + {x_value_reg[0], 1'b0, 1'b0, 1'b0};
		end*/
	else begin
		v_plus_vec <= tmp_vec_plus;
		v_minus_vec <= tmp_vec_minus;
		tmp_out <= x_value_reg;
		
	end
	//end
end


// computing MSD components

always @ (*) begin
	if (async_clear == 1) begin
		v_upper_plus <= 0;
		v_upper_minus <= 0;
	end
	
	else begin
		if (en_v_upper == 1 && fixing == 0) begin
			v_upper_plus <= res_upper_plus + cout_one[1] + tmp_out[1] +{1'b0,1'b0,q_plus_vec};
			v_upper_minus <= res_upper_minus + cout_one[0] + tmp_out[0]+{1'b0,1'b0,q_minus_vec};
		end
		else if (fixing == 1)begin
			v_upper_plus <= v_upper_plus_reg;
			v_upper_minus <= v_upper_minus_reg;
		end
		else begin
			v_upper_plus <= res_upper_plus;
			v_upper_minus <= res_upper_minus;
		end
	end
end

always @ (posedge clk  or posedge async_clear) begin
	if (async_clear == 1) begin
		v_upper_plus_reg <= 0;
		v_upper_minus_reg <= 0;
	end
	else begin
		if (en_v_upper == 1 && fixing == 0) begin
			v_upper_plus_reg <= v_upper_plus;
			v_upper_minus_reg <= v_upper_minus;
		end
	end
	
end
// calculating q_value based on v upper bits

// propogation of LSD

// propogating borrows
always @ (*) begin
	if (en_borrow == 1) begin
		borrow_out_MSD <= 0;
		if ((v_plus_vec_out - borrow_out) < v_minus_vec_out) begin
			borrow_in <= 1;
		end
		else begin
			borrow_in <= 0;
		end
	end
	if (en_borrow == 2) begin // could affect MSD
		borrow_in <= 0;
		if ((v_plus_vec_out - borrow_out) < v_minus_vec_out) begin
			borrow_out_MSD <= 1;
		end
		else begin
			borrow_out_MSD <= 0;
		end
	end
	else begin
		borrow_in <= 0;
		borrow_out_MSD <= 0;
	end
end



always @ (posedge clk or posedge async_clear) begin
	if (async_clear == 1) begin
		borrow_out <= 0;
	end
	else begin
		if (en_borrow == 1) begin
			borrow_out <= borrow_in;
		end
		else begin
			borrow_out <= 0;
		end
	end
end

assign v_upper_value= v_upper_plus - v_upper_minus - borrow_out_MSD;

always @ (*) begin
	if (fixing == 1) begin
		q_value <= q_fixing_value;
	end
	else begin
		case (v_upper_value[UPPER_BITS-1: UPPER_BITS -4])
			4'b0111: q_value <= 2'b10;
			4'b0110: q_value <= 2'b10;
			4'b0101: q_value <= 2'b10;
			4'b0100: q_value <= 2'b10;
			4'b0011: q_value <= 2'b10;
			4'b0010: q_value <= 2'b10;
			4'b0001: q_value <= 2'b10;
			4'b0000: q_value <= 2'b00;
			4'b1111: q_value <= 2'b00;
			4'b1110: q_value <= 2'b01;// special
			4'b1101: q_value <= 2'b01;
			4'b1100: q_value <= 2'b01;
			4'b1011: q_value <= 2'b01;
			4'b1010: q_value <= 2'b01;
			4'b1001: q_value <= 2'b01;
			4'b1000: q_value <= 2'b01;	
		endcase
	end
end

always @ (posedge clk or posedge async_clear) begin
	if (async_clear == 1) begin
		q_fixing_value <= 0;
	end
	else begin
		if (error_flag == 1 && en_v_upper == 1) begin
			q_fixing_value <= q_value; // stroing q value for later fixing
		end
	end
end



endmodule
