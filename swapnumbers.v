module swapp(a,b,clk);
input [2:0]a,b;
input clk;
reg [2:0]c,d;
always @(posedge clk)
begin
    c=a;
    d=b;
    //temp=c;
    //c=d;
   // d=temp;
end
always @(posedge clk)
begin
    c<=d;
    d<=c;
end
endmodule
module swapp_tb;
reg [2:0]a,b;
reg clk;
swapp s1(a,b,clk);
initial 
clk=1'b0;
initial 
begin 
    $dumpfile("swapp_tb.vcd");
    $dumpvars(0,swapp_tb);
    #5 a=3'b111; b=3'b101;
    #15 a=3'b100;b=3'b110;
    #25 a=3'b001;b=3'b010;
    #100 $finish;
end
initial forever #5 clk=~clk;
endmodule