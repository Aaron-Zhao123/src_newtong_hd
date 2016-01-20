module Newton_Method(
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






input clk;

input asyn_reset;
input [1:0] mul_one_op_two,mul_one_op_one;
output [1:0] product_one;

input data_x_mul_one_vld,data_y_mul_one_vld,d_out_mul_one_rdy;
output data_x_mul_one_rdy,data_y_mul_one_rdy,d_out_mul_one_vld;
// multiplier one hd signals

input [1:0] add_one_op_one, add_one_op_two;
output [1:0] sum_one;

input data_x_add_one_vld, data_y_add_one_vld, d_out_add_one_rdy;
output data_x_add_one_rdy, data_y_add_one_rdy, d_out_add_one_vld;

// adder one hd signals

input [1:0] mul_two_op_one, mul_two_op_two;
output [1:0] product_two;
input [1:0] product_two_wait_one, product_two_wait_two, product_two_wait_three;

input data_x_mul_two_vld,data_y_mul_two_vld,d_out_mul_two_rdy;
output data_x_mul_two_rdy,data_y_mul_two_rdy,d_out_mul_two_vld;
// multiplier two 

input [1:0] div_one_op_one, div_one_op_two;
output [1:0] quotient_one;

input data_x_div_one_vld, data_y_div_one_vld, d_out_div_one_rdy;
output data_x_div_one_rdy, data_y_div_one_rdy, d_out_div_one_vld;

integer cnt_div_op_one = 0;
integer cnt_div_op_two = 0;
// divider one

input [1:0] add_two_op_one, add_two_op_two;
output [1:0] sum_two;

input data_x_add_two_vld, data_y_add_two_vld, d_out_add_two_rdy;
output data_x_add_two_rdy, data_y_add_two_rdy, d_out_add_two_vld;

integer cnt_adder_two = 0;
// addder two


// second iteration

input [1:0] mul_three_op_one, mul_three_op_two;
output [1:0] product_three;

input data_x_mul_three_vld,data_y_mul_three_vld,d_out_mul_three_rdy;
output data_x_mul_three_rdy,data_y_mul_three_rdy,d_out_mul_three_vld;
// multiplier_three

input [1:0] add_three_op_one, add_three_op_two;
output [1:0] sum_three;

input data_x_add_three_vld, data_y_add_three_vld, d_out_add_three_rdy;
output data_x_add_three_rdy, data_y_add_three_rdy, d_out_add_three_vld;

integer cnt_adder_three = 0;
// adder three


input [1:0] mul_four_op_one, mul_four_op_two;
output [1:0] product_four;

input data_x_mul_four_vld,data_y_mul_four_vld,d_out_mul_four_rdy;
output data_x_mul_four_rdy,data_y_mul_four_rdy,d_out_mul_four_vld;
integer cnt_mul_four = 0;
//multiplier four


input [1:0] div_two_op_one, div_two_op_two;
output [1:0] quotient_two;

input data_x_div_two_vld, data_y_div_two_vld, d_out_div_two_rdy;
output data_x_div_two_rdy, data_y_div_two_rdy, d_out_div_two_vld;

// divider two

input [1:0] add_four_op_one, add_four_op_two;
output [1:0] sum_four;

input data_x_add_four_vld, data_y_add_four_vld, d_out_add_four_rdy;
output data_x_add_four_rdy, data_y_add_four_rdy, d_out_add_four_vld;

integer cnt_adder_four = 0;
// adder four

// third iteration

input [1:0] mul_five_op_one, mul_five_op_two;
output [1:0] product_five;

input data_x_mul_five_vld,data_y_mul_five_vld,d_out_mul_five_rdy;
output data_x_mul_five_rdy,data_y_mul_five_rdy,d_out_mul_five_vld;
integer cnt_mul_five = 0;
// multiplier five


input [1:0] add_five_op_one, add_five_op_two;
output [1:0] sum_five;

input data_x_add_five_vld, data_y_add_five_vld, d_out_add_five_rdy;
output data_x_add_five_rdy, data_y_add_five_rdy, d_out_add_five_vld;

integer cnt_adder_five = 0;
//adder five

input [1:0] mul_six_op_one, mul_six_op_two;
output [1:0] product_six;

input data_x_mul_six_vld,data_y_mul_six_vld,d_out_mul_six_rdy;
output data_x_mul_six_rdy,data_y_mul_six_rdy,d_out_mul_six_vld;
integer cnt_mul_six = 0;
// multiplier six 

input [1:0] div_three_op_one, div_three_op_two;
output [1:0] quotient_three;

input data_x_div_three_vld, data_y_div_three_vld, d_out_div_three_rdy;
output data_x_div_three_rdy, data_y_div_three_rdy, d_out_div_three_vld;

integer cnt_div_three_op_one = 0;
integer cnt_div_three_op_two = 0;
// divider three



input [1:0] add_six_op_one, add_six_op_two;
output [1:0] sum_six;

input data_x_add_six_vld, data_y_add_six_vld, d_out_add_six_rdy;
output data_x_add_six_rdy, data_y_add_six_rdy, d_out_add_six_vld;

integer cnt_adder_six = 0;
//adder six

//iteration four

input [1:0] mul_seven_op_one, mul_seven_op_two;
output [1:0] product_seven;

input data_x_mul_seven_vld,data_y_mul_seven_vld,d_out_mul_seven_rdy;
output data_x_mul_seven_rdy,data_y_mul_seven_rdy,d_out_mul_seven_vld;
integer cnt_mul_seven = 0;
// multiplier seven

input [1:0] add_seven_op_one, add_seven_op_two;
output [1:0] sum_seven;

input data_x_add_seven_vld, data_y_add_seven_vld, d_out_add_seven_rdy;
output data_x_add_seven_rdy, data_y_add_seven_rdy, d_out_add_seven_vld;

integer cnt_add_seven = 0;
//adder seven


input [1:0] mul_eight_op_one, mul_eight_op_two;
output [1:0] product_eight;

input data_x_mul_eight_vld,data_y_mul_eight_vld,d_out_mul_eight_rdy;
output data_x_mul_eight_rdy,data_y_mul_eight_rdy,d_out_mul_eight_vld;
integer cnt_mul_eight = 0;

// mult eight

input [1:0] div_four_op_one, div_four_op_two;
output [1:0] quotient_four;

input data_x_div_four_vld, data_y_div_four_vld, d_out_div_four_rdy;
output data_x_div_four_rdy, data_y_div_four_rdy, d_out_div_four_vld;

integer cnt_div_four_op_one = 0;
integer cnt_div_four_op_two = 0;
// divider four

input [1:0] add_eight_op_one, add_eight_op_two;
output [1:0] sum_eight;

input data_x_add_eight_vld, data_y_add_eight_vld, d_out_add_eight_rdy;
output data_x_add_eight_rdy, data_y_add_eight_rdy, d_out_add_eight_vld;

integer cnt_add_eight = 0;
integer cnt_add_eight_two = 0;

// iteration five

input [1:0] mul_nine_op_one, mul_nine_op_two;
output [1:0] product_nine;

input data_x_mul_nine_vld,data_y_mul_nine_vld,d_out_mul_nine_rdy;
output data_x_mul_nine_rdy,data_y_mul_nine_rdy,d_out_mul_nine_vld;
integer cnt_mul_nine = 0;
// mul nine

input[1:0] mul_ten_op_one, mul_ten_op_two;
output [1:0] product_ten;

input data_x_mul_ten_vld,data_y_mul_ten_vld,d_out_mul_ten_rdy;
output data_x_mul_ten_rdy,data_y_mul_ten_rdy,d_out_mul_ten_vld;
integer cnt_mul_ten = 0;
// mul ten

input [1:0] add_nine_op_one, add_nine_op_two;
output [1:0] sum_nine;

input data_x_add_nine_vld, data_y_add_nine_vld, d_out_add_nine_rdy;
output data_x_add_nine_rdy, data_y_add_nine_rdy, d_out_add_nine_vld;

integer cnt_add_nine = 0;
integer cnt_add_nine_two = 0;
// adder nine

input [1:0] div_five_op_one, div_five_op_two;
output [1:0] quotient_five;

input data_x_div_five_vld, data_y_div_five_vld, d_out_div_five_rdy;
output data_x_div_five_rdy, data_y_div_five_rdy, d_out_div_five_vld;

integer cnt_div_five_op_one = 0;
integer cnt_div_five_op_two = 0;
// div five

input [1:0] add_ten_op_one, add_ten_op_two;
output [1:0] sum_ten;

input data_x_add_ten_vld, data_y_add_ten_vld, d_out_add_ten_rdy;
output data_x_add_ten_rdy, data_y_add_ten_rdy, d_out_add_ten_vld;



Multiplier_hd mult_one(
mul_one_op_one,
mul_one_op_two, 
product_one, 
clk, 
asyn_reset,
data_x_mul_one_vld, 
data_x_mul_one_rdy, 
data_y_mul_one_vld, 
data_y_mul_one_rdy, 
d_out_mul_one_vld, 
d_out_mul_one_rdy);

Online_adder_hd adder_one(
add_one_op_one[1],
add_one_op_one[0],
~add_one_op_two[1], 
~add_one_op_two[0],
// negtate op two to perform subtraction
clk,
sum_one,
asyn_reset,
data_x_add_one_vld,
data_x_add_one_rdy,
data_y_add_one_vld,
data_y_add_one_rdy,
d_out_add_one_vld,
d_out_add_one_rdy
);

Multiplier_hd mult_two(
mul_two_op_one,
mul_two_op_two, 
product_two, 
clk, 
asyn_reset,
data_x_mul_two_vld, 
data_x_mul_two_rdy, 
data_y_mul_two_vld, 
data_y_mul_two_rdy, 
d_out_mul_two_vld, 
d_out_mul_two_rdy);

Divider_hd div_one(
div_one_op_one, 
div_one_op_two, 
quotient_one, 
clk, 
asyn_reset,
data_x_div_one_vld, 
data_x_div_one_rdy, 
data_y_div_one_vld, 
data_y_div_one_rdy, 
d_out_div_one_vld, 
d_out_div_one_rdy);


Online_adder_hd adder_two(
add_two_op_one[1],
add_two_op_one[0],
add_two_op_two[1], 
add_two_op_two[0],
clk,
sum_two,
asyn_reset,
data_x_add_two_vld,
data_x_add_two_rdy,
data_y_add_two_vld,
data_y_add_two_rdy,
d_out_add_two_vld,
d_out_add_two_rdy
);


Multiplier_hd mult_three(
mul_three_op_one,
mul_three_op_two, 
product_three, 
clk, 
asyn_reset,
data_x_mul_three_vld, 
data_x_mul_three_rdy, 
data_y_mul_three_vld, 
data_y_mul_three_rdy, 
d_out_mul_three_vld, 
d_out_mul_three_rdy);


Online_adder_hd adder_three(
add_three_op_one[1],
add_three_op_one[0],
~add_three_op_two[1], 
~add_three_op_two[0],
clk,
sum_three,
asyn_reset,
data_x_add_three_vld,
data_x_add_three_rdy,
data_y_add_three_vld,
data_y_add_three_rdy,
d_out_add_three_vld,
d_out_add_three_rdy
);


Multiplier_hd mult_four(
mul_four_op_one,
mul_four_op_two, 
product_four, 
clk, 
asyn_reset,
data_x_mul_four_vld, 
data_x_mul_four_rdy, 
data_y_mul_four_vld, 
data_y_mul_four_rdy, 
d_out_mul_four_vld, 
d_out_mul_four_rdy);

Divider_hd div_two(
div_two_op_one, 
div_two_op_two, 
quotient_two, 
clk, 
asyn_reset,
data_x_div_two_vld, 
data_x_div_two_rdy, 
data_y_div_two_vld, 
data_y_div_two_rdy, 
d_out_div_two_vld, 
d_out_div_two_rdy);


Online_adder_hd adder_four(
add_four_op_one[1],
add_four_op_one[0],
~add_four_op_two[1], 
~add_four_op_two[0],
clk,
sum_four,
asyn_reset,
data_x_add_four_vld,
data_x_add_four_rdy,
data_y_add_four_vld,
data_y_add_four_rdy,
d_out_add_four_vld,
d_out_add_four_rdy
);

Multiplier_hd mult_five(
mul_five_op_one,
mul_five_op_two, 
product_five, 
clk, 
asyn_reset,
data_x_mul_five_vld, 
data_x_mul_five_rdy, 
data_y_mul_five_vld, 
data_y_mul_five_rdy, 
d_out_mul_five_vld, 
d_out_mul_five_rdy);

Online_adder_hd adder_five(
add_five_op_one[1],
add_five_op_one[0],
~add_five_op_two[1], 
~add_five_op_two[0],
clk,
sum_five,
asyn_reset,
data_x_add_five_vld,
data_x_add_five_rdy,
data_y_add_five_vld,
data_y_add_five_rdy,
d_out_add_five_vld,
d_out_add_five_rdy
);

Multiplier_hd mult_six(
mul_six_op_one,
mul_six_op_two, 
product_six, 
clk, 
asyn_reset,
data_x_mul_six_vld, 
data_x_mul_six_rdy, 
data_y_mul_six_vld, 
data_y_mul_six_rdy, 
d_out_mul_six_vld, 
d_out_mul_six_rdy);

Divider_hd div_three(
div_three_op_one, 
div_three_op_two, 
quotient_three, 
clk, 
asyn_reset,
data_x_div_three_vld, 
data_x_div_three_rdy, 
data_y_div_three_vld, 
data_y_div_three_rdy, 
d_out_div_three_vld, 
d_out_div_three_rdy);

Online_adder_hd adder_six(
add_six_op_one[1],
add_six_op_one[0],
~add_six_op_two[1], 
~add_six_op_two[0],
clk,
sum_six,
asyn_reset,
data_x_add_six_vld,
data_x_add_six_rdy,
data_y_add_six_vld,
data_y_add_six_rdy,
d_out_add_six_vld,
d_out_add_six_rdy
);

Multiplier_hd mult_seven(
mul_seven_op_one,
mul_seven_op_two, 
product_seven, 
clk, 
asyn_reset,
data_x_mul_seven_vld, 
data_x_mul_seven_rdy, 
data_y_mul_seven_vld, 
data_y_mul_seven_rdy, 
d_out_mul_seven_vld, 
d_out_mul_seven_rdy);

Online_adder_hd adder_seven(
add_seven_op_one[1],
add_seven_op_one[0],
~add_seven_op_two[1], 
~add_seven_op_two[0],
clk,
sum_seven,
asyn_reset,
data_x_add_seven_vld,
data_x_add_seven_rdy,
data_y_add_seven_vld,
data_y_add_seven_rdy,
d_out_add_seven_vld,
d_out_add_seven_rdy
);

Multiplier_hd mult_eight(
mul_eight_op_one,
mul_eight_op_two, 
product_eight, 
clk, 
asyn_reset,
data_x_mul_eight_vld, 
data_x_mul_eight_rdy, 
data_y_mul_eight_vld, 
data_y_mul_eight_rdy, 
d_out_mul_eight_vld, 
d_out_mul_eight_rdy);

Divider_hd div_four(
div_four_op_one, 
div_four_op_two, 
quotient_four, 
clk, 
asyn_reset,
data_x_div_four_vld, 
data_x_div_four_rdy, 
data_y_div_four_vld, 
data_y_div_four_rdy, 
d_out_div_four_vld, 
d_out_div_four_rdy);

Online_adder_hd adder_eight(
add_eight_op_one[1],
add_eight_op_one[0],
~add_eight_op_two[1], 
~add_eight_op_two[0],
// negtate op two to perform subtraction
clk,
sum_eight,
asyn_reset,
data_x_add_eight_vld,
data_x_add_eight_rdy,
data_y_add_eight_vld,
data_y_add_eight_rdy,
d_out_add_eight_vld,
d_out_add_eight_rdy
);

Multiplier_hd mult_nine(
mul_nine_op_one,
mul_nine_op_two, 
product_nine, 
clk, 
asyn_reset,
data_x_mul_nine_vld, 
data_x_mul_nine_rdy, 
data_y_mul_nine_vld, 
data_y_mul_nine_rdy, 
d_out_mul_nine_vld, 
d_out_mul_nine_rdy);

Multiplier_hd mult_ten(
mul_ten_op_one,
mul_ten_op_two, 
product_ten, 
clk, 
asyn_reset,
data_x_mul_ten_vld, 
data_x_mul_ten_rdy, 
data_y_mul_ten_vld, 
data_y_mul_ten_rdy, 
d_out_mul_ten_vld, 
d_out_mul_ten_rdy);

Online_adder_hd adder_nine(
add_nine_op_one[1],
add_nine_op_one[0],
~add_nine_op_two[1], 
~add_nine_op_two[0],
// negtate op two to perform subtraction
clk,
sum_nine,
asyn_reset,
data_x_add_nine_vld,
data_x_add_nine_rdy,
data_y_add_nine_vld,
data_y_add_nine_rdy,
d_out_add_nine_vld,
d_out_add_nine_rdy
);

Divider_hd div_five(
div_five_op_one, 
div_five_op_two, 
quotient_five, 
clk, 
asyn_reset,
data_x_div_five_vld, 
data_x_div_five_rdy, 
data_y_div_five_vld, 
data_y_div_five_rdy, 
d_out_div_five_vld, 
d_out_div_five_rdy);


Online_adder_hd adder_ten(
add_ten_op_one[1],
add_ten_op_one[0],
~add_ten_op_two[1], 
~add_ten_op_two[0],
clk,
sum_ten,
asyn_reset,
data_x_add_ten_vld,
data_x_add_ten_rdy,
data_y_add_ten_vld,
data_y_add_ten_rdy,
d_out_add_ten_vld,
d_out_add_ten_rdy
);
endmodule

