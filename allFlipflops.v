module flipflops(in,clk,sr,jk,d,t);
input [1:0]in;
output reg jk,sr,d,t;
input clk;
parameter s0=0, s1=1,s2=2,s3=3;
initial t=1'b0;
//for T and D flip flop I have only considered LSB bit 

always @(posedge clk) begin
    case(in)
    s0: begin
    jk<=jk;
    sr<=sr;
    d<=1'b0;
    t<=t;
    end
    s1: begin
    jk<=1'b0;
    sr<=1'b1;
    d<=1'b1;
    t<=(~t);
    end
    s2: begin
    jk<=1'b1;
    sr<=1'b0;
    d<=1'b0;
    t<=t;
    end
    s3: begin
    jk<=(~jk);
    sr<=1'bx;
    d<=1'b1;
    t<=(~t);
    end
    endcase
end
/*always @(negedge clk)begin
    jk<=jk;
    sr<=sr;
    d<=d;
    t<=t;
end*/
endmodule

module flipflops_tb;
reg [1:0]in;
wire d,t,jk,sr;
reg clk;
flipflops f1(in,clk,sr,jk,d,t);
initial begin
    $dumpfile("flipflops_tb.vcd");
    $dumpvars(0,flipflops_tb);
    $monitor(" IN =%b || SR=%b || JK=%b || D=%b || T=%b",in,sr,jk,d,t);
    clk=1'b0;
  #5  in=2'b00;
    #200 $finish;
end
always #5 clk=~clk;
always #5 in=in+1;
endmodule