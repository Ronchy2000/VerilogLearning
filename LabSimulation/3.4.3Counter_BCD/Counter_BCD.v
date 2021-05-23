module Counter_BCD (
    clk,clr,en,Q,cout
);//BCD码，每一位不能超过9
    input clk,clr,en;
    output reg cout;
    output reg[7:0] Q;
    reg[7:0] count;
	 parameter[7:0] range = 8'b00011001; //19//注意：是BCD，看高四位第四位，单独看
always @(posedge clk,negedge clr) begin
    Q = count;
    if(clr == 0) count=0;
    else if(en==1) begin
        if(count==range)  //计数范围
            count = 0;
        else if(count[3:0]<range[3:0]) count[3:0] = count[3:0]+1'b1;
        else if(count[7:4]<range[7:4])begin
            count[7:4] = count[7:4] + 1'b1;
            count[3:0] = 4'b0000;    //请注意if，elseif语句的执行：else1执行后，跳出该if，执行后面的语句块
        end
        if(count==range) cout = 1'b1;
        else cout=0;
    end
end
endmodule