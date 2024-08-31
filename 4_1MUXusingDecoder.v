module mux_to_deco(s,d,i,y);
input [1:0]s;
output reg [3:0]d;
input [3:0]i;
output reg y;
always @(*) begin
if(s==(2'b00))begin
d[0]=1;
y=i[0];
end
else if(s==2'b01)begin
d[1]=1;
y=i[1];
end
else if(s[0]==1'b1 && s[1]==1'b0)begin
d[2]=1;
y=i[2];
end
else if(s[0]==1'b1 && s[1]==1'b1)begin
d[3]=1;
y=i[3];
end
else d=3'bxxx;
end
endmodule

module MUXDEC_tb;
reg[1:0]s;
reg[3:0]i;
wire [3:0]d;
wire y;
mux_to_deco m1(s,d,i,y);
initial begin
    $dumpfile("muxdec_tb.vcd");
    $dumpvars(0,MUXDEC_tb);
    $monitor("Select=%b DecOut=%b MuxIn=%b Output=%b",s,d,i,y);
    s=2'b01;i=4'b0010;
    #5 s=2'b11;i=4'b0011;
    #5 s=2'b00;i=4'b0001;
    #10 $finish;
end
endmodule
