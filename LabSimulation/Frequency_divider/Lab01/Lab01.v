//50MHz -> 3.84615MHz(13分频)  占空比为0.5
module Lab01(
    clkin,clkout,clk_aout,clk_bout
);
    input clkin;
    output clkout,clk_aout,clk_bout;
    parameter n = 13;
    parameter m = 3;
    reg[m:0] cnta,cntb;
    reg clka,clkb;
always @(posedge clkin) begin
    if(cnta>=n-1) cnta=0;
    else cnta=cnta + 1'b1;
    if(cnta < n/2) clka = 1;
    else clka = 0;
end

always @(negedge clkin) begin
    if(cntb>=n-1) cntb=0;
    else cntb=cntb + 1'b1;
    if(cntb < n/2) clkb = 1;
    else clkb = 0;
end
assign clkout = clka | clkb;
assign clk_aout = clka;
assign clk_bout = clkb;
endmodule 