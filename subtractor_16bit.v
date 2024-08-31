module sub_16(in1,in2,in3,d,b);
input [15:0]in1,in2;
input in3;
output [15:0]d;
output b;
sub_4 r1(in1[3:0],in2[3:0],in3,d[3:0],c1);
sub_4 r2(in1[7:4],in2[7:4],c1,d[7:4],c2);
sub_4 r3(in1[11:8],in2[11:8],c2,d[11:8],c3);
sub_4 r4(in1[15:12],in2[15:12],c3,d[15:12],b);
endmodule



module sub_4(in1,in2,in3,d,b);
input [3:0]in1,in2;
input in3;
output [3:0]d;
output b;
wire c1,c2,c3;
full_sub f1(in1[0],in2[0],in3,d[0],c1);
full_sub f2(in1[1],in2[1],c1,d[1],c2);
full_sub f3(in1[2],in2[2],c2,d[2],c3);
full_sub f4(in1[3],in2[3],c3,d[3],b);

endmodule

module full_sub(in1,in2,in3,d,b);
input in1,in2,in3;
output d,b;
assign d=in1^in2^in3;
assign b=(!in1)&(in2)|(!in1)&(in3)|(in2)&(in3);
endmodule

module subtractor_tb;
reg [15:0]in1,in2;
reg in3;
wire [15:0]d;
wire b;
sub_16 s1(in1,in2,in3,d,b);
initial begin
    $dumpfile("subtractor_tb.vcd");
    $dumpvars(0,subtractor_tb);
    $display("Subtraction of 16 bit number");
    $monitor("A=%h B=%h C=%h Diff=%h Borrow=%h",in1,in2,in3,d,b);
    #10 in1=16'habcd;in2=16'ha214;in3=0;
end
endmodule
