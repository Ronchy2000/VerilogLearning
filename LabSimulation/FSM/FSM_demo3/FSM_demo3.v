module FSM_demo3 (
    a,clk,rst,z
);
    input a,clk,rst;
    output reg z;
    reg[1:0] state;
    parameter s0 = 2'b00,s1=2'b01,s2=2'b10;
always @(posedge clk,negedge rst) begin
    if(rst==0) state<=0;
    else
        case(state)
            s0:begin
                z<=0;state<=(a==0)?s0:s1;end
            s1:begin
                z<=0;state<=(a==0)?s0:s2;end
            s2:begin
                z<=(a==0)?1:0;state<=(a==0)?s0:s2;end
            default:begin state<=s0;z<=0;end
        endcase
end
endmodule