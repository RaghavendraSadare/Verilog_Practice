/*Obtain the equation for a logic circuit that will generate a logic 1 on output z1
if a 4-bit unsigned binary number N = x1x2x3x4 satisfies the following criteria, where x4 is the low-order bit:
2 < N ≤ 6 or 11 ≤ N < 14
Use NOR user-defined primitives. Obtain the design module, the test bench 
module, and outputs*/
module book_4_8(x1,x2,x3,x4,z);
input x1,x2,x3,x4;
output z;
assign z=(x2&(~x3)) | ((~x2)&(x3)&(x4)) | ((~x1)&(x2)&(~x4));
endmodule

module book_4_8_tb;
reg x1,x2,x3,x4;
wire z;
book_4_8 b1(x1,x2,x3,x4,z);
initial begin 
    $dumpfile("book_4_8_tb.vcd");
    $dumpvars(0,book_4_8_tb);
    $monitor("X1 =%b || X2=%B || X3=%B || X4=%B |||| Z=%B",x1,x2,x3,x4,z);
    {x1,x2,x3,x4}=4'd0;
   #5 {x1,x2,x3,x4}=4'd1;
    #10 {x1,x2,x3,x4}=4'd2;
    #15 {x1,x2,x3,x4}=4'd3;
    #20 {x1,x2,x3,x4}=4'd4;
   #25 {x1,x2,x3,x4}=4'd5;

    #30 {x1,x2,x3,x4}=4'd7;
    #40 {x1,x2,x3,x4}=4'd8;
   #45 {x1,x2,x3,x4}=4'd9;
   #50 {x1,x2,x3,x4}=4'd10;
   #55 {x1,x2,x3,x4}=4'd11;
   #60 {x1,x2,x3,x4}=4'd12;
   #65 {x1,x2,x3,x4}=4'd13;
   #70 {x1,x2,x3,x4}=4'd14;
   #75 {x1,x2,x3,x4}=4'd15;
      #80 {x1,x2,x3,x4}=4'd6;




    #5 $finish;
end
endmodule