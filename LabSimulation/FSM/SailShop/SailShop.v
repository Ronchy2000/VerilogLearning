module SailShop(
   clk,rst,a,z
);
   input clk,rst;
   input  [1:0]a;
   output reg [4:0] z;
   reg [4:0] current_state,next_state;
   parameter 
      s0=5'b10000,
      s1=5'b00100,
      s2=5'b01000,
      s3=5'b00001,
      s4=5'b00011; 
always@(posedge clk or negedge rst)
begin
   if(!rst) current_state<=s0;
   else current_state<=next_state;
   z<=current_state;
end

always@(current_state or a)
begin
case(current_state)
   s0:begin 
      if(a==2'b01) next_state<=s1;
      else 
      begin  
         if(a==2'b10) next_state<=s2;
   	   else  next_state<=s0; end 
      end
   s1:begin 
      if(a==2'b01) next_state<=s2;
      else 
      begin 
         if(a==2'b10) next_state<=s3;
   	   else  next_state<=s1; end         
      end
   s2:begin 
      if(a==2'b01) next_state<=s3;
      else 
      begin 
         if(a==2'b10) next_state<=s4;
   	   else  next_state<=s2; end 
      end
   s3:next_state<=s0;
   s4:next_state<=s0;
default:next_state<=s0;
endcase
end
endmodule 