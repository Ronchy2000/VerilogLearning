module Divider_2n (
    clkin,clkout
);
    input clkin;
    output reg clkout;
    parameter n = 7;
    parameter m = 3;
    reg[m:0] cnt;
always @(posedge clkin) begin
    if(cnt>=n-1) cnt<=4'b0000;
    else cnt<=cnt+1;
    if(cnt<n/2) clkout<=1;
    else clkout<=0;
end
endmodule