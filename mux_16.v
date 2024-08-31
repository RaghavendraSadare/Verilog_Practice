module mux_16(in,sel,out);
input [15:0]in;
input [3:0]sel;
output out;
wire c1,c2,c3,c4;
mux_4 m1(in[3:0],sel[1:0],c1);
mux_4 m2(in[7:4],sel[1:0],c2);
mux_4 m3(in[11:8],sel[1:0],c3);
mux_4 m4(in[15:12],sel[1:0],c4);
mux_4 m5({c4,c3,c2,c1},sel[3:2],out);
endmodule
module mux_4(in,sel,out);
input [3:0]in;
input [1:0]sel;
output out;
assign out=in[sel];
endmodule
