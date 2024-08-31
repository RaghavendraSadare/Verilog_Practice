module full_adder(a,b,cin,sum,c_out);
input a,b,cin;
output sum,c_out;
assign sum=a^b^cin;
assign c_out=(a&b)|(b&cin)|(a&cin);
endmodule


module RCA(carry_out,sum,a,b,carry);
parameter n=8;
input [n-1:0]a,b;
input carry;
output [n-1:0]sum;
wire [n:0]c;
output carry_out;
genvar i;
generate for(i=0;i<n;i=i+1)
begin :fa_loop
      /* wire t1,t2,t3;
xor g1(t1,a[i],b[i]),g2(sum[i],t1,c[i]);
and g3(t2,a[i],b[i]),g4(t3,t1,c[i]);
or g5(c[i+1],t2,t3);*/
full_adder f1(a[i],b[i],c[i],sum[i],c[i+1]);
end
endgenerate
assign c[0]=carry;
assign carry_out=c[n];
endmodule

module rca_tb;
parameter n=8;
reg [n-1:0]a,b;
reg carry;
wire [n-1:0]sum;
wire carry_out;
RCA r1(carry_out,sum,a,b,carry);
initial begin 
    $dumpfile("rca_tb.vcd");
    $dumpvars(0,rca_tb);
    $monitor("A=%d || B=%d || C=%d Out=%d C_out=%d",a,b,carry,sum,carry_out);
    a=8'd7;b=8'd7;carry=0;
    #5 a=8'b11111111;b=8'b11111111;
    #10 $finish;
end
endmodule
