module FSM_demo5 (
    a,clk,rst,z
);
    input a,clk,rst;
    output z;
    reg[2:0] current_state,next_state;
    parameter s0 = 3'b000,s1=3'b010,s2=3'b100,s3=3'b001;
always @(posedge clk,negedge rst) begin
    if(rst==0) current_state<=s0;
    else
        current_state<= next_state; 
end
always @(current_state,a) begin
    case(current_state)
    s0:begin next_state<=(a==0)?s0:s1;end
    s1:next_state<=(a==0)?s0:s2;
    s2:next_state<=(a==0)?s3:s2;
    s3:next_state<=(a==0)?s0:s1;
    default:next_state<=s0;
    endcase
end
assign z = current_state[0];
endmodule 