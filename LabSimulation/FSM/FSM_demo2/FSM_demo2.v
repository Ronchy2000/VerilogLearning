module FSM_demo2 (
    a,clk,rst,z
);
    input a,clk,rst;
    output reg z;
    reg[1:0] current_state,next_state;
    parameter s0 = 2'b00,s1=2'b01,s2=2'b10;
always @(posedge clk,negedge rst) begin
    if(rst==0) current_state<=s0;
    else current_state<=next_state;
end
always @(current_state,a) begin
    case(current_state)
        s0:z<=0;
        s1:z<=0;
        s2:begin
           z<=(a==0)?1:0;
        end
        default:z<=0;
    endcase
end
always @(current_state,a) begin
    case(current_state)
        s0:begin
            next_state<=(a==0)?s0:s1;
        end
        s1:begin
           next_state<=(a==0)?s0:s2; 
        end
        s2:begin
            next_state<=(a==0)?s0:s2;
        end
        default:next_state<=s0;
    endcase
end
endmodule