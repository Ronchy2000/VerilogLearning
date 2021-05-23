module Counter_other ( //状态机实现4位格雷码计数器
    clk,clr,en,Q,cout);
    input clk,clr,en;
    output reg[3:0] Q;
	 output reg cout;// 进位
    reg[3:0] count;
	 
always @(posedge clk,negedge clr) begin
    Q = count;
    if(clr==0) count = 0;
    else if(en==1)begin
        case(count)
            4'b0000:count = 4'b0001;
            4'b0001:count = 4'b0011;
            4'b0011:count = 4'b0010;
            4'b0010:count = 4'b0110;
            4'b0110:count = 4'b0111;
            4'b0111:count = 4'b0101;
            4'b0101:count = 4'b0100;
            4'b0100:count = 4'b1100;
            4'b1100:count = 4'b1101;
            4'b1101:count = 4'b1111;
            4'b1111:count = 4'b1110;
            4'b1110:count = 4'b1010;
            4'b1010:count = 4'b1011;
            4'b1011:count = 4'b1001;
            4'b1001:count = 4'b1000;
            4'b1000:count = 4'b0000;				  			
            default:count = 4'b0000;
        endcase  
	end 
end
always@(count)begin
	if(count == 4'b1111)
		cout = 1;
	else 
		cout = 0;
end
endmodule
