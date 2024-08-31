module counter(clk,q,count);
input clk;
input [3:0]q;
output reg [3:0]count;
//initial count=q;
initial count=4'b0000;
always @(posedge clk)
begin
    if((!(count[3]^count[2]))==0)
    count<=4'b0000;
    else
    count<=count+4'b0001;
end
//always @(posedge clk)
//begin
    
//end
endmodule

module counter_tb;
reg clk;
reg [3:0]q;
wire [3:0]count;
counter c1(clk,q,count);
initial clk=1'b0;
initial 
begin
    $dumpfile("counter_tb.vcd");
    $dumpvars(0,counter_tb);
    #5 q=4'b0000;
    #800 $finish;
end
initial forever #5 clk=~clk;
endmodule