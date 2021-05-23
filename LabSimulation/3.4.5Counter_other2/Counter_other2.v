module Counter_other2 (
    clk,clr,en,Q,cout
);
    //用二进制码来计数，转换为格雷码输出
    input clk,clr,en;
    output reg[3:0] Q;
    output reg cout;
    reg[3:0] count;
always @(posedge clk,negedge clr) begin
    Q = count^(count>>1); //看格雷码计数的值（转换）  右移一位^原来
    if(clr == 0) count =0;
    else if(en)
        if(count < 4'b1010)
		    begin
            count = count +1;
				cout =0;
		    end
        else
		    begin
            count = 0;
				cout = 1;
		    end
end
endmodule