`timescale 1ns/1ps
module testbench_newton_two();

reg clk;
reg asyn_reset;
reg [1:0] mul_one_op_two,mul_one_op_one;
integer stop;
integer flag;
wire [1:0] product_one;

reg data_x_mul_one_vld,data_y_mul_one_vld,d_out_mul_one_rdy;
wire data_x_mul_one_rdy,data_y_mul_one_rdy,d_out_mul_one_vld;
// multiplier one hd signals

reg [1:0] add_one_op_one, add_one_op_two;
wire [1:0] sum_one;

reg data_x_add_one_vld, data_y_add_one_vld, d_out_add_one_rdy;
wire data_x_add_one_rdy, data_y_add_one_rdy, d_out_add_one_vld;

integer cnt_adder_one = 0;

// adder one hd signals

reg [1:0] mul_two_op_one, mul_two_op_two;
wire [1:0] product_two;
reg [1:0] product_two_wait_one, product_two_wait_two, product_two_wait_three;

reg data_x_mul_two_vld,data_y_mul_two_vld,d_out_mul_two_rdy;
wire data_x_mul_two_rdy,data_y_mul_two_rdy,d_out_mul_two_vld;
// multiplier two 

reg [1:0] div_one_op_one, div_one_op_two;
wire [1:0] quotient_one;

reg data_x_div_one_vld, data_y_div_one_vld, d_out_div_one_rdy;
wire data_x_div_one_rdy, data_y_div_one_rdy, d_out_div_one_vld;

integer cnt_div_op_one = 0;
integer cnt_div_op_two = 0;
// divider one

reg [1:0] add_two_op_one, add_two_op_two;
wire [1:0] sum_two;

reg data_x_add_two_vld, data_y_add_two_vld, d_out_add_two_rdy;
wire data_x_add_two_rdy, data_y_add_two_rdy, d_out_add_two_vld;

integer cnt_adder_two = 0;
// addder two


// second iteration

reg [1:0] mul_three_op_one, mul_three_op_two;
wire [1:0] product_three;

reg data_x_mul_three_vld,data_y_mul_three_vld,d_out_mul_three_rdy;
wire data_x_mul_three_rdy,data_y_mul_three_rdy,d_out_mul_three_vld;
// multiplier_three

reg [1:0] add_three_op_one, add_three_op_two;
wire [1:0] sum_three;

reg data_x_add_three_vld, data_y_add_three_vld, d_out_add_three_rdy;
wire data_x_add_three_rdy, data_y_add_three_rdy, d_out_add_three_vld;

integer cnt_adder_three = 0;
// adder three


reg [1:0] mul_four_op_one, mul_four_op_two;
wire [1:0] product_four;

reg data_x_mul_four_vld,data_y_mul_four_vld,d_out_mul_four_rdy;
wire data_x_mul_four_rdy,data_y_mul_four_rdy,d_out_mul_four_vld;
integer cnt_mul_four = 0;
//multiplier four


reg [1:0] div_two_op_one, div_two_op_two;
wire [1:0] quotient_two;

reg data_x_div_two_vld, data_y_div_two_vld, d_out_div_two_rdy;
wire data_x_div_two_rdy, data_y_div_two_rdy, d_out_div_two_vld;

// divider two

reg [1:0] add_four_op_one, add_four_op_two;
wire [1:0] sum_four;

reg data_x_add_four_vld, data_y_add_four_vld, d_out_add_four_rdy;
wire data_x_add_four_rdy, data_y_add_four_rdy, d_out_add_four_vld;

integer cnt_adder_four = 0;
// adder four

// third iteration


reg [1:0] mul_five_op_one, mul_five_op_two;
wire [1:0] product_five;

reg data_x_mul_five_vld,data_y_mul_five_vld,d_out_mul_five_rdy;
wire data_x_mul_five_rdy,data_y_mul_five_rdy,d_out_mul_five_vld;
integer cnt_mul_five = 0;
// multiplier five


reg [1:0] add_five_op_one, add_five_op_two;
wire [1:0] sum_five;

reg data_x_add_five_vld, data_y_add_five_vld, d_out_add_five_rdy;
wire data_x_add_five_rdy, data_y_add_five_rdy, d_out_add_five_vld;

integer cnt_adder_five = 0;
//adder five

reg [1:0] mul_six_op_one, mul_six_op_two;
wire [1:0] product_six;

reg data_x_mul_six_vld,data_y_mul_six_vld,d_out_mul_six_rdy;
wire data_x_mul_six_rdy,data_y_mul_six_rdy,d_out_mul_six_vld;
integer cnt_mul_six = 0;
// multiplier six 

reg [1:0] div_three_op_one, div_three_op_two;
wire [1:0] quotient_three;

reg data_x_div_three_vld, data_y_div_three_vld, d_out_div_three_rdy;
wire data_x_div_three_rdy, data_y_div_three_rdy, d_out_div_three_vld;

integer cnt_div_three_op_one = 0;
integer cnt_div_three_op_two = 0;
// divider three



reg [1:0] add_six_op_one, add_six_op_two;
wire [1:0] sum_six;

reg data_x_add_six_vld, data_y_add_six_vld, d_out_add_six_rdy;
wire data_x_add_six_rdy, data_y_add_six_rdy, d_out_add_six_vld;

integer cnt_adder_six = 0;
//adder six

//iteration four

reg [1:0] mul_seven_op_one, mul_seven_op_two;
wire [1:0] product_seven;

reg data_x_mul_seven_vld,data_y_mul_seven_vld,d_out_mul_seven_rdy;
wire data_x_mul_seven_rdy,data_y_mul_seven_rdy,d_out_mul_seven_vld;
integer cnt_mul_seven = 0;
// multiplier seven

reg [1:0] add_seven_op_one, add_seven_op_two;
wire [1:0] sum_seven;

reg data_x_add_seven_vld, data_y_add_seven_vld, d_out_add_seven_rdy;
wire data_x_add_seven_rdy, data_y_add_seven_rdy, d_out_add_seven_vld;

integer cnt_add_seven = 0;
//adder seven


reg [1:0] mul_eight_op_one, mul_eight_op_two;
wire [1:0] product_eight;

reg data_x_mul_eight_vld,data_y_mul_eight_vld,d_out_mul_eight_rdy;
wire data_x_mul_eight_rdy,data_y_mul_eight_rdy,d_out_mul_eight_vld;
integer cnt_mul_eight = 0;

// mult eight

reg [1:0] div_four_op_one, div_four_op_two;
wire [1:0] quotient_four;

reg data_x_div_four_vld, data_y_div_four_vld, d_out_div_four_rdy;
wire data_x_div_four_rdy, data_y_div_four_rdy, d_out_div_four_vld;

integer cnt_div_four_op_one = 0;
integer cnt_div_four_op_two = 0;
// divider four

reg [1:0] add_eight_op_one, add_eight_op_two;
wire [1:0] sum_eight;

reg data_x_add_eight_vld, data_y_add_eight_vld, d_out_add_eight_rdy;
wire data_x_add_eight_rdy, data_y_add_eight_rdy, d_out_add_eight_vld;

integer cnt_add_eight = 0;
integer cnt_add_eight_two = 0;

// iteration five

reg [1:0] mul_nine_op_one, mul_nine_op_two;
wire [1:0] product_nine;

reg data_x_mul_nine_vld,data_y_mul_nine_vld,d_out_mul_nine_rdy;
wire data_x_mul_nine_rdy,data_y_mul_nine_rdy,d_out_mul_nine_vld;
integer cnt_mul_nine = 0;
// mul nine

reg [1:0] mul_ten_op_one, mul_ten_op_two;
wire [1:0] product_ten;

reg data_x_mul_ten_vld,data_y_mul_ten_vld,d_out_mul_ten_rdy;
wire data_x_mul_ten_rdy,data_y_mul_ten_rdy,d_out_mul_ten_vld;
integer cnt_mul_ten = 0;
// mul ten

reg [1:0] add_nine_op_one, add_nine_op_two;
wire [1:0] sum_nine;

reg data_x_add_nine_vld, data_y_add_nine_vld, d_out_add_nine_rdy;
wire data_x_add_nine_rdy, data_y_add_nine_rdy, d_out_add_nine_vld;

integer cnt_add_nine = 0;
integer cnt_add_nine_two = 0;
// adder nine

reg [1:0] div_five_op_one, div_five_op_two;
wire [1:0] quotient_five;

reg data_x_div_five_vld, data_y_div_five_vld, d_out_div_five_rdy;
wire data_x_div_five_rdy, data_y_div_five_rdy, d_out_div_five_vld;

integer cnt_div_five_op_one = 0;
integer cnt_div_five_op_two = 0;
// div five

reg [1:0] add_ten_op_one, add_ten_op_two;
wire [1:0] sum_ten;

reg data_x_add_ten_vld, data_y_add_ten_vld, d_out_add_ten_rdy;
wire data_x_add_ten_rdy, data_y_add_ten_rdy, d_out_add_ten_vld;

integer cnt_add_ten = 0;
integer cnt_add_ten_two = 0;
// add ten

integer data_in_file_x, data_in_file_x_two, data_in_file_x_three, data_in_file_x_four, data_in_file_x_five, data_in_file_x_six, data_in_file_y, data_out_file, data_out_three_file;
integer scan_file_add_one, scan_file_mul_one, scan_file_mul_two;
integer scan_file_mul_three, scan_file_mul_four; // these pointers used by mul_two
integer scan_file_add_two;
integer scan_file_add_three, data_in_file_y_two;
integer scan_file_mul_five; 
integer scan_file_add_five, data_in_file_y_three;
integer scan_file_mul_six;
integer data_in_file_x_seven;
integer scan_file_add_seven, data_in_file_y_four;
integer data_out_one_file, data_out_two_file;
integer scan_file_mul_eight, data_in_file_x_eight;
integer scan_file_mul_ten, data_in_file_x_ten;
integer scan_file_add_nine, data_in_file_y_five;
initial begin

        clk=1;
        while(1) begin
                #10 clk=~clk;
        end
end

initial begin
  	data_in_file_x = $fopen("/home/aaron/verilog/file_IO/Newton/x_value.txt","r");
  	data_in_file_x_two = $fopen("/home/aaron/verilog/file_IO/Newton/x_value.txt","r");
  	data_in_file_y = $fopen("/home/aaron/verilog/file_IO/Newton/b_value.txt","r");
  	data_out_file = $fopen("/home/aaron/verilog/file_IO/Newton/result.dat","w");
	data_out_one_file = $fopen("/home/aaron/verilog/file_IO/Newton/result_one.dat","w"); 
	data_out_two_file = $fopen("/home/aaron/verilog/file_IO/Newton/result_two.dat","w"); 
	data_out_three_file = $fopen ("/home/aaron/verilog/file_IO/Newton/div_five_result.dat","w");
	data_in_file_x_three = $fopen("/home/aaron/verilog/file_IO/Newton/x_value.txt","r");
	data_in_file_x_four = $fopen("/home/aaron/verilog/file_IO/Newton/x_value.txt","r");
	data_in_file_x_five =  $fopen("/home/aaron/verilog/file_IO/Newton/x_value.txt","r");
  	data_in_file_y_two = $fopen("/home/aaron/verilog/file_IO/Newton/b_value.txt","r");
	data_in_file_x_six =  $fopen("/home/aaron/verilog/file_IO/Newton/x_value.txt","r");
  	data_in_file_y_three = $fopen("/home/aaron/verilog/file_IO/Newton/b_value.txt","r");
	data_in_file_x_seven =  $fopen("/home/aaron/verilog/file_IO/Newton/x_value.txt","r");
  	data_in_file_y_four = $fopen("/home/aaron/verilog/file_IO/Newton/b_value.txt","r");
	data_in_file_x_eight =  $fopen("/home/aaron/verilog/file_IO/Newton/x_value.txt","r");
	data_in_file_x_ten = $fopen("/home/aaron/verilog/file_IO/Newton/x_value.txt","r");
	data_in_file_y_five = $fopen("/home/aaron/verilog/file_IO/Newton/b_value.txt","r");
end

initial begin
	scan_file_mul_one = $fscanf(data_in_file_x , "%b", mul_one_op_one);
	scan_file_mul_two = $fscanf(data_in_file_x_two, "%b", mul_one_op_two);
	scan_file_mul_three = $fscanf(data_in_file_x_three, "%b", mul_two_op_one); 
	scan_file_mul_four = $fscanf(data_in_file_x_four, "%b", mul_two_op_two); 
	data_x_mul_one_vld <= 1;
	data_y_mul_one_vld <= 1;
	d_out_mul_one_rdy <= 1;
	asyn_reset <= 1;
	flag <= 0;
	stop <= 3;
	
	data_y_add_one_vld <= 1;
	add_one_op_one <= 0;
	add_one_op_two <= 0;
	
	data_x_mul_two_vld <= 1;
	data_y_mul_two_vld <= 1;

	div_one_op_one = 0;
	div_one_op_two = 0;
	
	product_two_wait_one <= 0;
	product_two_wait_two <= 0;
	product_two_wait_three <= 0;

	add_two_op_one <= 0;
	add_two_op_two <= 0;
	data_x_add_two_vld <= 1;  // scanning from input file 

	mul_three_op_one <= 0;
	mul_three_op_two <= 0;
	
	add_three_op_one <= 0;
	add_three_op_two <= 0;
	data_y_add_three_vld <= 1;

	mul_four_op_one <= 0;
	mul_four_op_two <= 0;
	data_x_mul_four_vld <= 1;

	div_two_op_two <= 0;
	div_two_op_one <= 0;

	add_four_op_one <= 0;
	add_four_op_two <= 0;

	mul_five_op_one <= 0;
	mul_five_op_two <= 0;

	add_five_op_one <= 0;
	add_five_op_two <= 0;

	mul_six_op_one <= 0;
	mul_six_op_two <= 0;

	div_three_op_one <= 0;
	div_three_op_two <= 0;

	add_six_op_one <= 0;
	add_six_op_two <= 0;

	mul_seven_op_one <= 0;
	mul_seven_op_two <= 0;

	add_seven_op_one <= 0;
	add_seven_op_two <= 0;

	mul_eight_op_one <= 0;
	mul_eight_op_two <= 0;

	div_four_op_one <= 0;
	div_four_op_two <= 0;

	add_eight_op_one <= 0;
	add_eight_op_two <= 0;

	div_five_op_one <= 0;
	div_five_op_two <= 0;

	mul_nine_op_one <= 0;
	mul_nine_op_two <= 0;

	mul_ten_op_one <= 0;
	mul_ten_op_two <= 0;

	add_nine_op_one <= 0;
	add_nine_op_two <= 0;

	add_ten_op_one <= 0;
	add_ten_op_two <= 0;
end

always @ (*) begin
	data_x_add_one_vld <= d_out_mul_one_vld;
	d_out_mul_one_rdy <= data_x_add_one_rdy;
	// connecting mult_one with add_one
	data_x_div_one_vld <= d_out_add_one_vld;
	d_out_add_one_rdy <= data_x_div_one_rdy;
	data_y_div_one_vld <= d_out_mul_two_vld;	
	d_out_mul_two_rdy <= data_y_div_one_rdy;	
	// connecting divider with mul_two and add_one
	d_out_add_two_rdy <= 1;
	if (cnt_adder_two >= 40) begin
		d_out_div_one_rdy <= data_y_add_two_rdy;
		data_y_add_two_vld <= d_out_div_one_vld;
	end
	else begin
		d_out_div_one_rdy <= 1;
		data_y_add_two_vld <= 1;
	end
	// connecting adder_Two with div_one;
	
	data_x_mul_three_vld <= d_out_add_two_vld;
	data_y_mul_three_vld <= d_out_add_two_vld;
	d_out_add_two_rdy <= data_x_mul_three_rdy;
	// connecting adder_Two with mul_three
	
	data_x_add_three_vld <= d_out_mul_three_vld;
	d_out_mul_three_rdy <= data_x_add_three_rdy;
	// connecting mul_three with add_three
	
	data_y_mul_four_vld <= d_out_add_two_vld;
	data_x_mul_four_vld <= 1;
	// connecting mul_four with add_two
	
	data_x_div_two_vld <= d_out_add_three_vld;
	d_out_add_three_rdy <= data_x_div_two_rdy;
	data_y_div_two_vld <= d_out_mul_four_vld;
	d_out_mul_four_rdy <= data_y_div_two_rdy;
	
	// connecting mul_four,adder_three with div_two
	
	data_x_add_four_vld <= d_out_add_two_vld;

	data_y_add_four_vld <= d_out_div_two_vld;
	d_out_div_two_rdy <= data_y_add_four_rdy;	
	// connecting add_two, div_two with add_four
	if (cnt_adder_four >= 34) begin
	        data_x_mul_five_vld <= d_out_add_four_vld;
		data_y_mul_five_vld <= d_out_add_four_vld;
	end
 	else begin
		data_x_mul_five_vld <= 0;
		data_y_mul_five_vld <= 0;
	end

 	d_out_add_four_rdy <= data_x_mul_five_rdy & data_y_mul_five_rdy;
	// connecting mul_five with add_four
	
	data_x_add_five_vld <= d_out_mul_five_vld;
	d_out_mul_five_rdy <= data_x_add_five_rdy;
	data_y_add_five_vld <= 1;
	// connecting add_five with mul_five
	
	if (cnt_mul_six > 44) begin
		data_y_mul_six_vld <= d_out_add_four_vld;
		data_x_mul_six_vld <= 1;
	end
	else begin
		data_y_mul_six_vld <= 0;
		data_x_mul_six_vld <= 0;
	end

	// mul_six
	data_x_div_three_vld <= d_out_add_five_vld;
	data_y_div_three_vld <= d_out_mul_six_vld;
	d_out_add_five_rdy <= data_x_div_three_rdy;
	d_out_mul_six_rdy <= data_y_div_three_rdy;
	// div_three
	
	data_x_add_six_vld <= d_out_add_four_vld;
	data_y_add_six_vld <= d_out_div_three_vld;
	d_out_div_three_rdy <= data_y_add_six_rdy;
	// add_six
	if (cnt_mul_seven > 57) begin	
		data_x_mul_seven_vld <= d_out_add_six_vld;
		data_y_mul_seven_vld <= d_out_add_six_vld;
	end
	else begin
		data_x_mul_seven_vld <= 0;
		data_y_mul_seven_vld <= 0;
	end
	d_out_add_six_rdy <= data_x_mul_seven_rdy;

	// multiplier seven
	data_x_add_seven_vld <= d_out_mul_seven_vld;
	data_y_add_seven_vld <= 1;
	d_out_mul_seven_rdy <= data_x_add_seven_rdy;
	//adder seven

	data_x_mul_eight_vld <= 1;
	data_y_mul_eight_vld <= d_out_add_six_vld;
	// multiplier eight

	data_x_div_four_vld <= d_out_add_seven_vld;
	data_y_div_four_vld <= d_out_mul_eight_vld;
	d_out_add_seven_rdy <= data_x_div_four_rdy;
	d_out_mul_eight_rdy <= data_y_div_four_rdy;
	d_out_div_four_rdy <= 1;
	// div four
	
	data_x_add_eight_vld <= d_out_add_six_vld;
	data_y_add_eight_vld <= d_out_div_four_vld;
	d_out_div_four_rdy <= data_y_add_eight_rdy;
	// add eight

	if (cnt_mul_nine > 60) begin
		data_x_mul_nine_vld <= d_out_add_eight_vld;
		data_y_mul_nine_vld <= d_out_add_eight_vld;
	end
	else begin
		data_x_mul_nine_vld <= 0;
		data_y_mul_nine_vld <= 0;
	end

	d_out_add_eight_rdy <= data_x_mul_nine_rdy;
	// mul_nine
	data_x_mul_ten_vld <= 1;
	data_y_mul_ten_vld <= d_out_add_eight_vld;
	// mul_ten
	
	data_x_add_nine_vld <= d_out_mul_nine_vld;
	data_y_add_nine_vld <= 1;
	d_out_add_nine_rdy <= 1;
	// add nine
		
	data_x_div_five_vld <= d_out_mul_nine_vld;
	data_y_div_five_vld <= d_out_mul_ten_vld;
	d_out_mul_nine_rdy <= data_x_div_five_rdy;
	d_out_mul_ten_rdy <= data_y_div_five_rdy;
	d_out_div_five_rdy <= data_y_add_ten_rdy;
	// div five
	
	data_x_add_ten_vld <= d_out_add_eight_vld;
	data_y_add_ten_vld <= d_out_div_five_vld;
	d_out_add_ten_rdy <= 1;
end


wire [1:0] tmp_two;
wire [1:0] tmp_three;
reg [1:0] tmp_add_nine;

always@(negedge clk) begin
	asyn_reset <= 0;
        if(data_x_mul_one_rdy && data_x_mul_one_vld) begin
                scan_file_mul_one = $fscanf(data_in_file_x,"%b",mul_one_op_one);
        end
        if (data_y_mul_one_rdy && data_y_mul_one_vld) begin
                scan_file_mul_two = $fscanf(data_in_file_x_two,"%b",mul_one_op_two);
        end
        if (d_out_mul_one_rdy && d_out_mul_one_vld) begin
        	cnt_adder_one = cnt_adder_one + 1;
	end
	if (cnt_adder_one > 3) begin
		if (data_x_add_one_rdy && data_x_add_one_vld) begin
			add_one_op_one <= product_one;
		end
		if (data_y_add_one_rdy && data_y_add_one_vld) begin
                	scan_file_add_one = $fscanf ( data_in_file_y, "%b", add_one_op_two);
		end
	end
	if (data_x_mul_two_rdy && data_x_mul_two_vld) begin
		scan_file_mul_three = $fscanf(data_in_file_x_three, "%b", mul_two_op_one); 
	end
	if (data_y_mul_two_rdy && data_y_mul_two_vld) begin
		scan_file_mul_four = $fscanf(data_in_file_x_four, "%b", mul_two_op_two); 
	end
	if (d_out_add_one_rdy && d_out_add_one_vld) begin
		cnt_div_op_one = cnt_div_op_one + 1;
	end
	if (d_out_mul_two_rdy && d_out_mul_two_vld) begin
		cnt_div_op_two = cnt_div_op_two +1;
	end
	if (data_x_div_one_vld && data_x_div_one_rdy && (cnt_div_op_one > 7)) begin
		div_one_op_one <= ~sum_one;
	end
		if (data_y_div_one_vld && data_y_div_one_rdy) begin
		div_one_op_two <= product_two_wait_two;
		product_two_wait_three <= product_two_wait_two;	
		product_two_wait_two <= product_two_wait_one; 
		product_two_wait_one <= product_two;
	end
	if (d_out_div_one_rdy && d_out_div_one_vld) begin
		cnt_adder_two <= cnt_adder_two + 1;
	end

	if (data_x_add_two_vld && data_x_add_two_rdy) begin
		if (cnt_adder_two > 39) begin
			scan_file_add_two = $fscanf(data_in_file_x_five, "%b", add_two_op_one);
		end
		else begin
			add_two_op_one <= 0;
		end
	end
	if (data_y_add_two_rdy && data_y_add_two_vld) begin
		add_two_op_two <= quotient_one;
	end
	if (d_out_add_two_vld && d_out_add_two_rdy) begin
		cnt_mul_four <= cnt_mul_four + 1;
		cnt_adder_four <= cnt_adder_four + 1;
	end
	if (data_x_mul_three_rdy && data_x_mul_three_vld) begin
		mul_three_op_one <= sum_two;
	end
	if (data_y_mul_three_rdy && data_y_mul_three_vld) begin
		mul_three_op_two <= sum_two;
	end
	if (d_out_mul_three_rdy && d_out_mul_three_vld) begin
		cnt_adder_three <= cnt_adder_three + 1;
	end

	if (data_y_add_three_rdy && data_y_add_three_vld) begin
		if (cnt_adder_three > 28) begin
			scan_file_add_three = $fscanf(data_in_file_y_two, "%b", add_three_op_two);
		end
		else begin
			add_three_op_two <= 0;
		end
	end
	if (data_x_add_three_vld && data_x_add_three_rdy) begin
		add_three_op_one <= product_three;
	end

	if (data_x_mul_four_vld && data_x_mul_four_rdy) begin
		if (cnt_mul_four > 11) begin
			scan_file_mul_five = $fscanf (data_in_file_x_six, "%b", mul_four_op_one);
		end
		else begin
			mul_four_op_one <= 0;
		end
	end
	if (data_y_mul_four_vld && data_x_mul_four_rdy) begin
		mul_four_op_two <= sum_two;
	end

	if (data_x_div_two_rdy && data_x_div_two_vld) begin
		div_two_op_one <= sum_three;
	end
	if (data_y_div_two_rdy && data_y_div_two_vld) begin
		div_two_op_two <= product_four;
	end
//	if (data_x_add_four_rdy && data_x_add_four_vld) begin
//		add_four_op_one <= sum_two;
//	end
	if (data_y_add_four_rdy && data_y_add_four_vld) begin
		add_four_op_two <= quotient_two;
	end
	if (data_x_mul_five_rdy && data_x_mul_five_vld) begin
		mul_five_op_one <= sum_four;
	end
	if (data_y_mul_five_rdy && data_y_mul_five_vld) begin
		mul_five_op_two <= sum_four;
	end
	if (d_out_mul_five_rdy && d_out_mul_five_vld) begin
		cnt_adder_five = cnt_adder_five + 1;
	end
	if (data_x_add_five_rdy && data_x_add_five_vld) begin
		add_five_op_one <= product_five;
	end
	if (data_y_add_five_rdy && data_y_add_five_vld) begin
		if (cnt_adder_five < 7) begin
			add_five_op_two <= 0;
		end
		else begin
			scan_file_add_five = $fscanf (data_in_file_y_three, "%b", add_five_op_two);
		end
	end
	if (data_x_mul_six_rdy && data_x_mul_six_vld) begin
		if (cnt_mul_six > 45) begin
			scan_file_mul_six = $fscanf (data_in_file_x_seven, "%b", mul_six_op_one);	
		end
		else begin
			mul_six_op_one <= 0;
		end
	end
	if (data_y_mul_six_rdy && data_y_mul_six_vld) begin
		mul_six_op_two <= sum_four;
	end
	if (d_out_add_four_rdy && d_out_add_four_vld) begin
		cnt_mul_six <= cnt_mul_six + 1;
	end
	if (d_out_mul_six_rdy && d_out_mul_six_vld) begin
		cnt_div_three_op_one <= cnt_div_three_op_one + 1;
	end
	if (d_out_add_five_vld && d_out_add_five_rdy) begin
		cnt_div_three_op_two <= cnt_div_three_op_two + 1;
	end
	if (data_x_div_three_rdy && data_x_div_three_vld) begin
		div_three_op_one <= sum_five;
	end
	if (data_y_div_three_rdy && data_y_div_three_vld) begin
		div_three_op_two <= product_six;
	end
	if (d_out_div_three_vld && d_out_div_three_rdy) begin
		//$fwrite(data_out_file, "%b\n", quotient_three);
		cnt_adder_six <= cnt_adder_six + 1;
	end
	if (d_out_add_six_rdy && d_out_add_six_vld) begin
//		$fwrite(data_out_file, "%b\n", sum_six);
		cnt_mul_seven = cnt_mul_seven + 1;
	end

//	if (data_x_add_six_vld && data_x_add_six_rdy) begin
//		add_six_op_one <= sum_four;
//	end
	if (data_y_add_six_rdy && data_y_add_six_vld) begin
		add_six_op_two <= quotient_three;
	end
	if (data_x_mul_seven_vld && data_x_mul_seven_rdy) begin
		mul_seven_op_one <= sum_six;
	end
	if (data_y_mul_seven_vld && data_y_mul_seven_rdy) begin
		mul_seven_op_two <= sum_six;
	end
	if (d_out_mul_seven_vld && d_out_mul_seven_rdy) begin
		cnt_add_seven = cnt_add_seven + 1;
	end
	if (data_x_add_seven_rdy && data_x_add_seven_vld) begin
		add_seven_op_one <= product_seven;
	end
	if (d_out_add_seven_rdy && d_out_add_seven_vld) begin
	//	$fwrite(data_out_file, "%b\n", sum_seven);
	end

	if (data_y_add_seven_rdy && data_y_add_seven_vld) begin
		if (cnt_add_seven > 8) begin
			scan_file_add_seven = $fscanf (data_in_file_y_four, "%b", add_seven_op_two);
		end
		else begin
			add_seven_op_two <= 0;
		end
	end
	if (data_x_mul_eight_rdy && data_x_mul_eight_vld) begin
		scan_file_mul_eight = $fscanf (data_in_file_x_eight, "%b", mul_eight_op_one);
	end
	if (data_y_mul_eight_rdy && data_y_mul_eight_vld) begin
		mul_eight_op_two <= sum_six;
	end
	if (d_out_mul_eight_vld && d_out_mul_eight_rdy) begin
		cnt_mul_eight <= cnt_mul_eight + 1;
	end

	
	if (d_out_add_seven_vld && d_out_add_seven_rdy) begin
		cnt_div_four_op_one <= cnt_div_four_op_one + 1;
	end
	if (d_out_add_four_vld && d_out_add_four_rdy) begin
		cnt_div_four_op_two <= cnt_div_four_op_two + 1;
	end
	if (data_x_div_four_rdy && data_x_div_four_vld) begin
		if (sum_seven == 2'b11) begin
			div_four_op_one <= 0;
		end
		else begin
			div_four_op_one <= sum_seven;
		end

	end

	if (d_out_div_four_rdy && d_out_div_four_vld) begin
		cnt_add_eight <= cnt_add_eight + 1;
	end
	if (data_x_add_eight_vld && data_x_add_eight_rdy) begin
	//	add_eight_op_one <= sum_six;
		cnt_add_eight_two <= cnt_add_eight_two + 1;
	end
	if (data_y_add_eight_rdy && data_y_add_eight_vld) begin
		add_eight_op_two <= quotient_four;
	end
	if (d_out_add_eight_rdy && d_out_add_eight_vld) begin
		cnt_mul_nine <= cnt_mul_nine + 1;
		cnt_add_ten <= cnt_add_ten + 1;
	end
	if (data_x_mul_nine_rdy && data_x_mul_nine_vld) begin
		mul_nine_op_one <= sum_eight;
	end
	if (data_y_mul_nine_vld && data_y_mul_nine_rdy) begin
		mul_nine_op_two <= sum_eight;
	end
	if (d_out_mul_nine_rdy && d_out_mul_nine_vld) begin
		cnt_add_nine <= cnt_add_nine + 1;
	end
	if (data_x_mul_ten_vld && data_x_mul_ten_rdy) begin
		scan_file_mul_ten = $fscanf(data_in_file_x_ten, "%b", mul_ten_op_one);
	end
	if (data_y_mul_ten_vld && data_y_mul_ten_rdy) begin
		mul_ten_op_two <= sum_eight;
	end
	if (d_out_mul_ten_vld && d_out_mul_ten_rdy) begin
	end

	if (data_x_add_nine_rdy && data_x_add_nine_vld)begin
		add_nine_op_one <= product_nine;
	end
	if (data_y_add_nine_rdy && data_y_add_nine_vld) begin
		if (cnt_add_nine > 30 ) begin
			scan_file_add_nine = $fscanf(data_in_file_y_five, "%b", add_nine_op_two);
		end
		else begin
			add_nine_op_two <= 0;
		end

	end
	if (d_out_add_nine_rdy && d_out_add_nine_vld) begin
	end

	if (data_x_div_five_vld && data_x_div_five_rdy) begin
		$fwrite(data_out_one_file, "%b\n", div_five_op_one);
		if (cnt_add_nine > 50) begin
			div_five_op_one <= product_nine;
		end
		else begin
			div_five_op_one <= 0;
		end
	end
	if (data_y_div_five_vld && data_y_div_five_rdy) begin
		//div_five_op_two <= product_ten; 
		$fwrite(data_out_two_file, "%b\n", div_five_op_two);
	end

	if (d_out_div_five_rdy && d_out_div_five_vld) begin
		cnt_add_ten_two <= cnt_add_ten_two + 1;
	end
	if (data_x_add_ten_vld && data_x_add_ten_rdy) begin
		//add_ten_op_one <= sum_eight;
	end
	if (data_y_add_ten_vld && data_y_add_ten_rdy) begin
		add_ten_op_two <= quotient_five;
	end
	if (d_out_add_ten_rdy && d_out_add_ten_vld) begin
		$fwrite(data_out_file, "%b\n", sum_ten);
	end
end

wire [1:0] tmp;
shift_reg upper_shift( data_x_add_four_vld,sum_two[1],tmp[1]);
shift_reg lower_shift(data_x_add_four_vld,sum_two[0],tmp[0]);
always @ (*) begin
	add_four_op_one <= tmp;
end

wire [1:0] tmp_one;
shift_reg_one upper_shift_one (data_x_add_five_vld, sum_four[1], tmp_one[1]);
shift_reg_one lower_shift_one (data_x_add_five_vld, sum_four[0], tmp_one[0]);

always @ (*) begin
	add_six_op_one <= tmp_one;
end

shift_reg_two upper_shift_two(data_y_div_four_vld,product_eight[1],tmp_two[1]);
shift_reg_two lower_shift_two(data_y_div_four_vld,product_eight[0],tmp_two[0]);
always @ (*) begin
	div_four_op_two <= tmp_two;
end

shift_reg_three upper_shift_three(data_x_add_eight_vld,sum_six[1],tmp_three[1]);
shift_reg_three lower_shift_three(data_x_add_eight_vld,sum_six[0],tmp_three[0]);
always @ (*) begin
	add_eight_op_one<= tmp_three;
end

wire [1:0] tmp_four;
shift_reg_four upper_shift_four(data_y_div_five_vld,product_ten[1],tmp_four[1]);
shift_reg_four lower_shift_four(data_y_div_five_vld,product_ten[0],tmp_four[0]);
always @ (*) begin
	div_five_op_two<= tmp_four;
end

wire [1:0] tmp_five;
shift_reg_five upper_shift_five(data_x_add_ten_vld,sum_eight[1],tmp_five[1]);
shift_reg_five lower_shift_five(data_x_add_ten_vld,sum_eight[0],tmp_five[0]);
always @ (*) begin
	add_ten_op_one<= tmp_five;
end
Newton_Method Newton(
clk, 
asyn_reset, 
mul_one_op_one, 
mul_one_op_two, 
product_one, 
data_x_mul_one_vld, 
data_x_mul_one_rdy, 
data_y_mul_one_vld, 
data_y_mul_one_rdy,
d_out_mul_one_rdy, 
d_out_mul_one_vld, 
add_one_op_one, 
add_one_op_two, 
sum_one, 
data_x_add_one_vld, 
data_y_add_one_vld, 
d_out_add_one_rdy,
data_x_add_one_rdy, 
data_y_add_one_rdy, 
d_out_add_one_vld, 
mul_two_op_one,
mul_two_op_two,
product_two, 
product_two_wait_one, 
product_two_wait_two, 
product_two_wait_three, 
data_x_mul_two_vld,
data_y_mul_two_vld,
d_out_mul_two_rdy, 
data_x_mul_two_rdy,
data_y_mul_two_rdy,
d_out_mul_two_vld,
div_one_op_one, 
div_one_op_two,
quotient_one,
data_x_div_one_vld, 
data_y_div_one_vld, 
d_out_div_one_rdy,
data_x_div_one_rdy, 
data_y_div_one_rdy, 
d_out_div_one_vld,
add_two_op_one, 
add_two_op_two,
sum_two,
data_x_add_two_vld, 
data_y_add_two_vld, 
d_out_add_two_rdy,
data_x_add_two_rdy, 
data_y_add_two_rdy, 
d_out_add_two_vld,
mul_three_op_one, 
mul_three_op_two,
product_three,
data_x_mul_three_vld,
data_y_mul_three_vld,
d_out_mul_three_rdy,
data_x_mul_three_rdy,
data_y_mul_three_rdy,
d_out_mul_three_vld,
add_three_op_one, 
add_three_op_two,
sum_three,
data_x_add_three_vld, 
data_y_add_three_vld, 
d_out_add_three_rdy,
data_x_add_three_rdy, 
data_y_add_three_rdy, 
d_out_add_three_vld,
mul_four_op_one,
mul_four_op_two,
product_four,
data_x_mul_four_vld,
data_y_mul_four_vld,
d_out_mul_four_rdy,
data_x_mul_four_rdy,
data_y_mul_four_rdy,
d_out_mul_four_vld,
div_two_op_one, 
div_two_op_two,
quotient_two,
data_x_div_two_vld,
data_y_div_two_vld, 
d_out_div_two_rdy,
data_x_div_two_rdy, 
data_y_div_two_rdy, 
d_out_div_two_vld,
add_four_op_one, 
add_four_op_two,
sum_four,
data_x_add_four_vld, 
data_y_add_four_vld, 
d_out_add_four_rdy,
data_x_add_four_rdy, 
data_y_add_four_rdy, 
d_out_add_four_vld,
mul_five_op_one, 
mul_five_op_two,
product_five,
data_x_mul_five_vld,
data_y_mul_five_vld,
d_out_mul_five_rdy,
data_x_mul_five_rdy,
data_y_mul_five_rdy,
d_out_mul_five_vld,
add_five_op_one, 
add_five_op_two,
sum_five,
data_x_add_five_vld, 
data_y_add_five_vld, 
d_out_add_five_rdy,
data_x_add_five_rdy, 
data_y_add_five_rdy, 
d_out_add_five_vld,
mul_six_op_one, 
mul_six_op_two,
product_six,
data_x_mul_six_vld,
data_y_mul_six_vld,
d_out_mul_six_rdy,
data_x_mul_six_rdy,
data_y_mul_six_rdy,
d_out_mul_six_vld,
div_three_op_one,
div_three_op_two,
quotient_three,
data_x_div_three_vld, 
data_y_div_three_vld, 
d_out_div_three_rdy,
data_x_div_three_rdy, 
data_y_div_three_rdy, 
d_out_div_three_vld,
add_six_op_one, 
add_six_op_two,
sum_six,
data_x_add_six_vld, 
data_y_add_six_vld, 
d_out_add_six_rdy,
data_x_add_six_rdy, 
data_y_add_six_rdy, 
d_out_add_six_vld,
mul_seven_op_one, 
mul_seven_op_two,
product_seven,
data_x_mul_seven_vld,
data_y_mul_seven_vld,
d_out_mul_seven_rdy,
data_x_mul_seven_rdy,
data_y_mul_seven_rdy,
d_out_mul_seven_vld,
add_seven_op_one, 
add_seven_op_two,
sum_seven,
data_x_add_seven_vld, 
data_y_add_seven_vld,
d_out_add_seven_rdy,
data_x_add_seven_rdy, 
data_y_add_seven_rdy, 
d_out_add_seven_vld,
mul_eight_op_one, 
mul_eight_op_two,
product_eight,
data_x_mul_eight_vld,
data_y_mul_eight_vld,
d_out_mul_eight_rdy,
data_x_mul_eight_rdy,
data_y_mul_eight_rdy,
d_out_mul_eight_vld,
div_four_op_one,
div_four_op_two,
quotient_four,
data_x_div_four_vld,
data_y_div_four_vld, 
d_out_div_four_rdy,
data_x_div_four_rdy, 
data_y_div_four_rdy, 
d_out_div_four_vld,
add_eight_op_one, 
add_eight_op_two,
sum_eight,
data_x_add_eight_vld,
data_y_add_eight_vld,
d_out_add_eight_rdy,
data_x_add_eight_rdy, 
data_y_add_eight_rdy, 
d_out_add_eight_vld,
mul_nine_op_one, 
mul_nine_op_two,
product_nine,
data_x_mul_nine_vld,
data_y_mul_nine_vld,
d_out_mul_nine_rdy,
data_x_mul_nine_rdy,
data_y_mul_nine_rdy,
d_out_mul_nine_vld,
mul_ten_op_one,	
mul_ten_op_two,
product_ten,
data_x_mul_ten_vld,
data_y_mul_ten_vld,
d_out_mul_ten_rdy,
data_x_mul_ten_rdy,
data_y_mul_ten_rdy,
d_out_mul_ten_vld,
add_nine_op_one,
add_nine_op_two,
sum_nine,
data_x_add_nine_vld, 
data_y_add_nine_vld, 
d_out_add_nine_rdy,
data_x_add_nine_rdy, 
data_y_add_nine_rdy, 
d_out_add_nine_vld,
div_five_op_one, 
div_five_op_two,
quotient_five,
data_x_div_five_vld,
data_y_div_five_vld, 
d_out_div_five_rdy,
data_x_div_five_rdy,
data_y_div_five_rdy, 
d_out_div_five_vld,
add_ten_op_one, 
add_ten_op_two,
sum_ten,
data_x_add_ten_vld, 
data_y_add_ten_vld, 
d_out_add_ten_rdy,
data_x_add_ten_rdy, 
data_y_add_ten_rdy, 
d_out_add_ten_vld);



endmodule


module shift_reg (clk,sr_in,sr_out);
parameter DELAY = 20;
input clk;
input sr_in;
output  sr_out;
reg sr_out;
reg [DELAY:0] sr;


initial begin
	sr <= 0;
	sr_out <= 0;
end

always @ (posedge clk) begin
	sr[DELAY:1] <= sr[DELAY-1:0];
	sr[0] <= sr_in;
end

always @ (*) begin
       	sr_out = sr[DELAY];
end
endmodule

module shift_reg_one (clk,sr_in,sr_out);
parameter DELAY = 10;
input clk;
input sr_in;
output  sr_out;
reg sr_out;
reg [DELAY:0] sr;

initial begin
	sr <= 0;
	sr_out <= 0;
end

always @ (posedge clk) begin
	sr[DELAY:1] <= sr[DELAY-1:0];
	sr[0] <= sr_in;
end

always @ (*) begin
       	sr_out = sr[DELAY];
end
endmodule

module shift_reg_two (clk,sr_in,sr_out);
parameter DELAY = 15;
input clk;
input sr_in;
output  sr_out;
reg sr_out;
reg [DELAY:0] sr;

initial begin
	sr <= 0;
	sr_out <= 0;
end

always @ (posedge clk) begin
	sr[DELAY:1] <= sr[DELAY-1:0];
	sr[0] <= sr_in;
end

always @ (*) begin
       	sr_out = sr[DELAY];

end
endmodule

module shift_reg_three (clk,sr_in,sr_out);
parameter DELAY = 12;
input clk;
input sr_in;
output  sr_out;
reg sr_out;
reg [DELAY:0] sr;

initial begin
	sr <= 0;
	sr_out <= 0;
end

always @ (posedge clk) begin
	sr[DELAY:1] <= sr[DELAY-1:0];
	sr[0] <= sr_in;
end

always @ (*) begin
       	sr_out = sr[DELAY];
end

endmodule

module shift_reg_four (clk,sr_in,sr_out);
parameter DELAY = 38;
input clk;
input sr_in;
output  sr_out;
reg sr_out;
reg [DELAY:0] sr;

initial begin
	sr <= 0;
	sr_out <= 0;
end

always @ (posedge clk) begin
	sr[DELAY:1] <= sr[DELAY-1:0];
	sr[0] <= sr_in;
end

always @ (*) begin
       	sr_out = sr[DELAY];
end

endmodule

module shift_reg_five (clk,sr_in,sr_out);
parameter DELAY = 21;
input clk;
input sr_in;
output  sr_out;
reg sr_out;
reg [DELAY:0] sr;

initial begin
	sr <= 0;
	sr_out <= 0;
end

always @ (posedge clk) begin
	sr[DELAY:1] <= sr[DELAY-1:0];
	sr[0] <= sr_in;
end

always @ (*) begin
       	sr_out = sr[DELAY];
end

endmodule

