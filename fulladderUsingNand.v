module fulladder(x,y,z,sum,carry);
input x,y,z;
output sum,carry;
wire [6:0]d;
nand n1(d[0],x,y);
nand n2(d[1],x,d[0]);
nand n3(d[2],y,d[0]);
nand n4(d[3],d[1],d[2]);
nand n5(d[4],d[3],z);
nand n6(d[5],d[4],d[3]);
nand n7(d[6],d[4],z);
nand n8(sum,d[5],d[6]);
nand n9(carry,d[0],d[4]);
endmodule

module fulladder_tb;
reg a,b,c;
wire sum,carry;
fulladder f1(a,b,c,sum,carry);
always #10
a=a+1;
always #5
b=b+1;
always #2
c=c+1;
initial begin
    $dumpfile("fulladder_tb.vcd");
    $dumpvars(0,fulladder_tb);
    $monitor("A=%b B=%b Sum=%b",a,b,sum);
 a=0;b=0;c=0;
    #100 $finish;
end
endmodule