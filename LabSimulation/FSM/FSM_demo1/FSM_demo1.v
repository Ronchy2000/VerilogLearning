module FSM_demo1(
		a,clk,rst,z
); 
	input a,clk,rst;
	output reg z;
	reg[1:0] current_state,next_state;
	parameter S0=2'b00,S1=2'b01,S2=2'b10; 
always @(posedge clk,negedge rst)
begin 
    if(rst==0) current_state<=S0; 
    else current_state<=next_state; 
end 
always @(current_state,a)
begin 
    case(current_state)
        S0:begin z<=0;next_state<=(a==0)?S0:S1;end
        S1:begin z<=0;next_state<=(a==0)?S0:S2;end
        S2:begin z<=(a==0)?1:0; next_state<=(a==0)?S0:S2;end 
        default:begin next_state<=S0;z<=0;end 
    endcase 
end 
endmodule 