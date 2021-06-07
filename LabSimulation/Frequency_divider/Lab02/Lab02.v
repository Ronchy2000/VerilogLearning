//32分频 占空比0.5
module Lab02(
    clkin,clkout
);
    input clkin;
    output reg clkout;
    parameter n = 32;
    parameter m = 4;
    reg[m:0] cnt;
always @(posedge clkin) begin
    if(cnt>=n-1) cnt<=5'b00000;
    else cnt<=cnt+1;
    if(cnt<n/2) clkout<=1;
    else clkout<=0;
end
endmodule