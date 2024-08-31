module calci(a,b,o,check);
input [1:0]a,b, check;
output reg [3:0]o;
parameter add=2'b00,sub=2'b01,div=2'b10,mul=2'b11;
always @(a or b or check)
begin
    case(check)
    add:o=a+b;
    sub:o=a-b;
    div:o=a/b;
    mul:o=a*b;
    endcase
end
endmodule

module calci_tb;
wire [3:0]o;
reg [1:0]a,b ,check;
calci c1(a,b,o,check);
//always #8
//a=a+1;
always #5
b=b+1;
always #5
check=check+1;
initial begin
    $dumpfile("calci_tb.vcd");
    $dumpvars(0,calci_tb);
    $monitor("A=%d B=%d Output=%d",a,b,o);
    a=0;b=0;check=0;
    //#100 $finish;
    forever #2 a=~a;
    #10 $finish;
end
initial begin
        #10 $finish;
end



endmodule
