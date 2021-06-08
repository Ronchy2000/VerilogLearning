module others (
    a1,a2,clk,rst,z
);
    input a1,a2,clk,rst;
    output reg z;
    reg[1:0] current_state,next_state;
//    parameter s0 = 2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
    parameter   l0 = 00000001,
                l1 = 00000010,
                l2 = 00000100,
                l3 = 00001000,
                l4 = 00010000,
                l5 = 00100000,
                l6 = 01000000,
                l7 = 10000000,
always @(posedge clk,negedge rst) begin
    if(rst==0) current_state<=l0;
    else current_state<=next_state;
end
always @(current_state,{a1,a2}) begin
    case(current_state)
        s0:z<=0;
        s1:z<=0;
        s2:begin
           z<=(a==0)?1:0;
        end
        default:z<=0;
    endcase
end
always @(posedge clk) begin
    case(current_state)
        l0:begin
            next_state<=({a1,a2}==0)?l0:l1;
        end
        l1:begin
            next_state<=({a1,a2}==0)?l1:l2; 
        end
        l2:begin
            next_state<=({a1,a2}==0)?l2:l3;
        end
        l3:begin
            next_state<=({a1,a2}==0)?l3:l4;
        end
        l4:begin
            next_state<=({a1,a2}==0)?l4:l5;
        end
        l5:begin
            next_state<=({a1,a2}==0)?l5:l6;
        end
        l6:begin
            next_state<=({a1,a2}==0)?l6:l7;
        end
        l7:begin
            next_state<=({a1,a2}==0)?l7:l0;
        end
        default:next_state<=l0;
    endcase
end
endmodule