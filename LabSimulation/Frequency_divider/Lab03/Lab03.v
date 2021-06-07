//1000Hz->10Hz  100分频(改过了已经，不是100分频)
module Lab03 (
    clkin,clkout
);
    input clkin;
    output reg clkout;
    parameter n = 50000000; //多少分频
    parameter m = 32;		//m =log2 （分频数）  m即寄存器位数;
    reg[m:0] cnt;
always @(posedge clkin) begin
    if(cnt>=n-1) cnt<=32'h00000000;
    else cnt<=cnt+1;
    if(cnt<n/2) clkout<=1;
    else clkout<=0;
end
endmodule
