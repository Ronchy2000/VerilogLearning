module f_adder(ain,bin,cin,cout,sum);
	input ain,bin,cin;
	output cout,sum;
	wire net1,net2,net3;
	h_adder U1(ain,bin,net1,net2);
	h_adder U2(.A(net1),.SO(sum),.B(cin),.CO(net3));
	   or	  U3(cout,net2,net3);
endmodule
