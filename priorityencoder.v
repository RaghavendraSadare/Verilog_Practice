module encoder(i,out);
input [7:0]i;
output reg [2:0] out;
always @(i)begin
    if(i[7]) out=3'b111;
    else if(i[6]) out=3'b110;
    else if(i[5]) out=3'b101;
    else if(i[4]) out=3'b100;
    else if(i[3]) out=3'b011;
    else if(i[2]) out=3'b010;
    else if(i[1]) out=3'b001;
    else if(i[0]) out=3'b000;
    else out=3'bxxx;
end
endmodule 

module encoder_tb;
reg [7:0]i;
wire [2:0]out;
encoder e1(i,out);
initial begin 
    $dumpfile("encoder_tb.vcd");
    $dumpvars(0,encoder_tb);
    $monitor("I=%b || Out=%d",i,out);
    i=8'b10111111; 
    #5 i=8'b00100101;
    #5 i=8'b00000000;
    #5 i=8'b00000010;

    
    #5 $finish;
end
endmodule