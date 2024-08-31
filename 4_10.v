/*The logic block shown below generates an output of a logic 1 when the inputs 
contain an odd number of 1s. Use only this type of logic block to generate a 
parity bit for an 8-bit byte of data. The parity bit will be a logic 1 when there 
are an even number of 1s in the byte of data. All inputs must be used. Using 
user-defined primitives, obtain the design module, test bench, and outputs for 
eight combinations of the input variables*/
/*module evenOnes(a,count1,count0,y);
input [7:0]a;
output reg [3:0]count1,count0;
output reg y;
reg flag;
reg [3:0]c1,c0;
integer i;
initial begin
    count0=4'd0;
    count1=4'd0;
    flag=1'b0;
end
always @(flag) begin
    count1=c1;
    count0=c0;
    c1=0;c0=0;
end
always @(a)
begin
    y=~(^a);
    if(y==1'b1)
    y=1'b1;
    for(i=0;i<8;i=i+1)begin
        if(a[i]==1)
        c1=c1+1;
        else 
        c0=c0+1;
    end
    flag=~flag;
end
endmodule

module evenOnes_tb;
reg [7:0]a;
wire [3:0]count0,count1;
wire y;
evenOnes e1(a,count1,count0,y);
initial begin
    $dumpfile("evenOnes_tb.vcd");
    $dumpvars(0,evenOnes_tb);
    $monitor("A=%b|| Count0=%d|| Count1=%d || Output=%b",a,count0,count1,y);
    a=8'b11111111;
   #5 a=8'b10101101;
  #5 a=8'b00000000;
    #10 $finish;
end
endmodule
*/
module evenOnes(a, count1, count0, y);
  input [7:0] a;
  output reg [3:0] count1, count0;
  output reg y;
  
  integer i;
  
  always @(a) begin
    // Reset the counts at the beginning of each evaluation
    count1 = 4'd0;
    count0 = 4'd0;

    // Count the number of 1s and 0s in 'a'
    for(i = 0; i < 8; i = i + 1) begin
      if(a[i] == 1)
        count1 = count1 + 1;
      else 
        count0 = count0 + 1;
    end

    // Calculate 'y' based on whether the number of 1s is even or odd
    y = ~(^a);
  end
endmodule

module evenOnes_tb;
  reg [7:0] a;
  wire [3:0] count0, count1;
  wire y;
  
  evenOnes e1(a, count1, count0, y);
  
  initial begin
    $dumpfile("evenOnes_tb.vcd");
    $dumpvars(0, evenOnes_tb);
    $monitor("A=%b || Count0=%d || Count1=%d || Output=%b", a, count0, count1, y);
    a = 8'b11111111;
    #5 a = 8'b10101101;
    #5 a = 8'b00000000;
    #10 $finish;
  end
endmodule

