module complement(a,b,posneg,out);
input [3:0]a,b;
output reg posneg;
reg [3:0]c;
reg [3:0]sub;
output reg [3:0]out;
always @(a,b)
begin
    c=(~b)+1;
    sub=a+c;
    if((a<b)|| (sub[3]==1'b1))begin//if MSB is 1 means b is negative
    posneg=1;
    sub=(~sub)+1;
    end
    else posneg=0;
    out=sub;

end
endmodule

module complement_tb;
reg [3:0]a,b;
wire posneg;
wire [3:0]out;
complement c1(a,b,posneg,out);
initial begin
    $dumpfile("complement_tb.vcd");
    $dumpvars(0,complement_tb);
    $monitor("A=%d B=%d PosNeg=%d Ouput=%d",a,b,posneg,out);
    a=4'b0110;b=4'b1001;
    #5 a=4'b1001;b=4'b0110;
    #5 $finish;
end
endmodule
