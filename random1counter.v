// 0-1-2-4-6 counter
module rancounter(q,in,clk);
input  [2:0]in;
reg [2:0]t;
output reg [2:0]q;
input clk;
always @(in)t=in;
initial q=3'b000;
always @(posedge clk)
begin 
    t[0]=(~q[2])&(~q[1]) | q[0];
    t[1]=q[1] | (q[2] & (~q[0])) | ((~q[2]& (~q[1])& q[0]));
    t[2]=(q[2]&q[1]) | (q[1]&(~q[0]));
    if(t[0]==0) q[0]=q[0];
    else q[0]=~q[0];
     if(t[1]==0) q[1]=q[1];
    else q[1]=~q[1];
     if(t[2]==2) q[2]=q[2];
    else q[2]=~q[2];
  // if(q==3'b101 || q==3'b101  || q==3'b111)
   //q=3'b000;

end
endmodule
module rancounter_tb;
reg [2:0]in;
wire [2:0]q;
reg clk;
rancounter r1(q,in,clk);
initial begin
    $dumpfile("rancounter_tb.vcd");
    $dumpvars(0,rancounter_tb);
    $monitor("IN=%d || Q=%d ",in,q);
    in=3'b000; clk=0;
  #5  in=3'd1;
   #5 in=3'd2;
    #5 in=3'd4;
     #5 in=3'd6;
    #30 $finish;
end
always #5 clk=~clk;
endmodule