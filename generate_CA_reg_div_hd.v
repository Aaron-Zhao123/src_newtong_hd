module generate_CA_reg_div_hd(comp_cycle,rd_addr,q_value,d_value,q_plus,q_minus,d_plus,d_minus,clk,async_clear,master_cnt,enable_all,wr_enable);

parameter Num_bits=4; //unrolling this many bits
parameter RAM_ADDR_WIDTH=7;

input wr_enable; 
input enable_all;
input clk;
input[RAM_ADDR_WIDTH+2-1:0] master_cnt;
input [RAM_ADDR_WIDTH-1:0] comp_cycle,rd_addr;
input[1:0] q_value, d_value;
input async_clear;

output [Num_bits-1 : 0] q_plus,q_minus,d_plus,d_minus;


wire[3:0] tmp_write;
wire[Num_bits*2-1:0] tmp_read_data_q,tmp_read_data_d;
wire[1:0] sel_d,sel_q;
wire [RAM_ADDR_WIDTH-1:0] wr_addr_d,wr_addr_q;
reg we_one_d, we_two_d, we_three_d, we_four_d;
reg we_one_q, we_two_q, we_three_q, we_four_q;

reg [RAM_ADDR_WIDTH+2-1:0] cnt_q;


assign sel_d=master_cnt[1:0];

assign wr_addr_d = master_cnt[RAM_ADDR_WIDTH+2-1:2];

always @ (*) begin
	if (master_cnt == 0 || master_cnt == 1) begin
		cnt_q <= 0;
	end
	else begin
		cnt_q <= master_cnt -1 ;
	end
end
assign wr_addr_q = cnt_q[RAM_ADDR_WIDTH+2-1:2];
assign sel_q= cnt_q[1:0];


single_clk_ram_2bit_div ram1(d_value,wr_addr_d,rd_addr,we_one_d,clk,async_clear,tmp_read_data_d[7:6]); //read and write to ram at the same time
single_clk_ram_2bit_div ram2(d_value,wr_addr_d,rd_addr,we_two_d,clk,async_clear,tmp_read_data_d[5:4]);
single_clk_ram_2bit_div ram3(d_value,wr_addr_d,rd_addr,we_three_d,clk,async_clear,tmp_read_data_d[3:2]);
single_clk_ram_2bit_div ram4(d_value,wr_addr_d,rd_addr,we_four_d,clk,async_clear,tmp_read_data_d[1:0]);



single_clk_ram_2bit_div ram5(q_value,wr_addr_q,rd_addr,we_one_q,clk,async_clear,tmp_read_data_q[7:6]); //read and write to ram at the same time
single_clk_ram_2bit_div ram6(q_value,wr_addr_q,rd_addr,we_two_q,clk,async_clear,tmp_read_data_q[5:4]);
single_clk_ram_2bit_div ram7(q_value,wr_addr_q,rd_addr,we_three_q,clk,async_clear,tmp_read_data_q[3:2]);
single_clk_ram_2bit_div ram8(q_value,wr_addr_q,rd_addr,we_four_q,clk,async_clear,tmp_read_data_q[1:0]);
always @ (*) begin
	if (enable_all == 1 && wr_enable == 1 ) begin
		case (sel_d)
			2'b00:begin
				we_one_d<=1'b1;
				we_two_d<=1'b0;
				we_three_d<=1'b0;
				we_four_d<=1'b0;
			end
			2'b01:begin
				we_one_d<=1'b0;
				we_two_d<=1'b1;
				we_three_d<=1'b0;
				we_four_d<=1'b0;
			end
			2'b10:begin
				we_one_d<=1'b0;
				we_two_d<=1'b0;
				we_three_d<=1'b1;
				we_four_d<=1'b0;
			end
			2'b11:begin
				we_one_d<=1'b0;
				we_two_d<=1'b0;
				we_three_d<=1'b0;
				we_four_d<=1'b1;
			end
			default:begin
				we_one_d<=1'b0;
				we_two_d<=1'b0;
				we_three_d<=1'b0;
				we_four_d<=1'b0;
			end
		endcase
	end
	else begin
		we_one_d<=1'b0;
		we_two_d<=1'b0;
		we_three_d<=1'b0;
		we_four_d<=1'b0;
	end

end

always @ (*) begin
	if (enable_all == 1 && wr_enable == 1 ) begin
		case (sel_q)
			2'b00:begin
				we_one_q<=1'b1;
				we_two_q<=1'b0;
				we_three_q<=1'b0;
				we_four_q<=1'b0;
			end
			2'b01:begin
				we_one_q<=1'b0;
				we_two_q<=1'b1;
				we_three_q<=1'b0;
				we_four_q<=1'b0;
			end
			2'b10:begin
				we_one_q<=1'b0;
				we_two_q<=1'b0;
				we_three_q<=1'b1;
				we_four_q<=1'b0;
			end
			2'b11:begin
				we_one_q<=1'b0;
				we_two_q<=1'b0;
				we_three_q<=1'b0;
				we_four_q<=1'b1;
			end
			default:begin
				we_one_q<=1'b0;
				we_two_q<=1'b0;
				we_three_q<=1'b0;
				we_four_q<=1'b0;
			end
		endcase
	end
	else begin
		we_one_q<=1'b0;
		we_two_q<=1'b0;
		we_three_q<=1'b0;
		we_four_q<=1'b0;
	end

end


assign 		q_plus[3]=tmp_read_data_q[7];
assign		q_minus[3]=tmp_read_data_q[6];
assign 		d_plus[3]=tmp_read_data_d[7];
assign		d_minus[3]=tmp_read_data_d[6];

assign		q_plus[2]=tmp_read_data_q[5];
assign		q_minus[2]=tmp_read_data_q[4];
assign 		d_plus[2]=tmp_read_data_d[5];
assign		d_minus[2]=tmp_read_data_d[4];

assign		q_plus[1]=tmp_read_data_q[3];
assign		q_minus[1]=tmp_read_data_q[2];
assign		d_plus[1]=tmp_read_data_d[3];
assign		d_minus[1]=tmp_read_data_d[2];

assign		q_plus[0]=tmp_read_data_q[1];
assign		q_minus[0]=tmp_read_data_q[0];
assign		d_plus[0]=tmp_read_data_d[1];
assign		d_minus[0]=tmp_read_data_d[0];
endmodule
