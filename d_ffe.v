module d_ffe(D, enable, clk, Q);
	input D, enable, clk;
	output Q;
	wire and1, and2, not1, or1;
	
	and a1(and1, D, enable);
	not n1(not1, enable);
	and a2(and2, not1, Q);
	or o1(or1, and1, and2);
	d_ff df1(	.D(or1),
				.clk(clk),
				.Q(Q));
	
endmodule

module d_ff(D, clk, Q);
	input D, clk;
	output Q;
	wire dlatch1, not1, not2;
	
	not n1(not1, clk);
	not n2(not2, not1);
	d_latch dl1(		.D(D), 
						.enable(not1), 
						.Q(dlatch1)
					);
	d_latch dl2(		.D(dlatch1),
						.enable(not2),
						.Q(Q)
					);
endmodule

module d_latch(D, enable, Q);
	input D, enable;
	output Q;
	wire nand1, nand2, nand3, not1;
	
	nand na1(nand1, D, enable);
	not n1(not1, D);
	nand na2(nand2, enable);
	nand na_Q(Q, nand3, nand1);
	nand na_Qn(nand3, nand2, Q);
endmodule


