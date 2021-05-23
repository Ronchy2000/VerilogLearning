module Keyin(clk,keyin,keyout);
	input clk,keyin;
	output keyout;
	reg[3:0]cta,ctb;
	reg keyout;
always@(posedge clk)
begin
	if(keyin==0)
	begin
		ctb<=4'b0000;
		if(cta>=5)
		begin 
			cta<=cta;
			keyout<=0;
		end
		else
			cta<=cta+1;
	end
	else
	begin
		cta<=4'b0000;
		if(ctb>=5)
		begin
			ctb<=ctb;
			keyout<=1;
		end
		else ctb<=ctb+1;end
end
endmodule

		
	