module Asynchrony_Counter(input clk,d,output reg q,nq);
reg qb;//qb 为D,Q之间的寄存
always@(posedge clk)
begin
  qb<=d;
   q<=qb;
	nq<=~qb;
	end
endmodule

module eg346(input clk1,clr,output [3:0]q);
   wire[4:0] ck;
   genvar k;
   assign ck[0]=clk1;
   generate
   for(k=0;k<=3;k=k+1)
     begin:U1
     Asynchrony_Counter al(ck[k],clr,ck[k+1],q[k]);
	  end
	  endgenerate
endmodule