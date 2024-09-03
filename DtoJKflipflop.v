module DtoJK(jk,q,clk);
input [1:0]jk;
output reg q;
input clk;
reg d;
initial q=1;
always @(posedge clk) begin
d=(jk[1] & (~q)) + ((~jk[0]) & q);
q=d;
end
endmodule

module DtoJK_tb;
reg clk;
reg [1:0]jk;
wire q;
DtoJK d1(jk,q,clk);
initial begin
    $dumpfile("DtoJK_tb.vcd");
    $dumpvars(0,DtoJK_tb);
    jk=2'b00; clk=1'b1;
    #200 $finish;
end
always  #10 jk=jk+1;
always #5 clk=~clk;
endmodule
