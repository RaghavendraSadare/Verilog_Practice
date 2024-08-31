module seq_detector(x,clk,reset,z);
input x,clk,reset;
output reg z;
parameter s0=0,s1=1,s2=2,s3=3;
reg[1:0]ps,ns;
always @(posedge clk or posedge reset)
begin
    if(reset) ps<=s0;
    else ps<=ns;
end
always @(ps or x)
begin 
    case(ps)
    s0:begin
    z=0;
    ns=x?s0:s1;
    end
    s1:begin z=0;
    ns=x?s2:s1;
    end
    s2:begin z=0;
    ns=x?s3:s1;
    end
    s3:begin z=x?0:1;
    ns=x?s0:s1;
    end
    endcase
end
endmodule

module seq_detect_tb;
reg clk,x,reset;
wire z;
seq_detector s1(x,clk,reset,z);
initial begin
    $dumpfile("sequence.vcd");
    $dumpvars(0,seq_detect_tb);
    clk=1'b0; reset=1'b1;
    #15 reset=1'b0;
end
always #5 clk=~clk;
initial begin
#10 x=0; #10 x=0; #10 x=1; #10 x=1;
#10 x=0; #10 x=1; #10 x=1; #10 x=0;
#100 $finish;
end
endmodule