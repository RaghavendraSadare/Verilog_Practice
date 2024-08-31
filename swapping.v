module swap(a,b,d);
input a,b;
reg c;
output reg d;
always @(*)
begin
c=0;
d=a^c;
end
endmodule
module swap_tb;
reg a,b;
wire d;
swap s1(a,b,d);
initial begin
    $dumpfile("swap_tb.vcd");
    $dumpvars(0,swap_tb);
    $monitor("A=%b B=%b OUT=%b",a,b,d);
    a=0;b=0;
    #5 a=1;
    #5 a=0;
    #5 $finish;
end
endmodule