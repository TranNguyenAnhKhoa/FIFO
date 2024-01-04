module memcell(data, write_en, row_sel, Q);
	input data, write_en, row_sel;
	output Q;
	wire and1, dlatch1;
	
	d_latch dl1(	.D(data),
						.enable(and1),
						.Q(dlatch1)
					);
	and a1(and1, write_en, row_sel);
	bufif1 b1(Q, dlatch1, row_sel);
endmodule

//module d_latch(D, enable, Q);
//	input D, enable;
//	output Q;
//	wire nand1, nand2, nand3, not1;
//	
//	nand na1(nand1, D, enable);
//	not n1(not1, D);
//	nand na2(nand2, enable);
//	nand na_Q(Q, nand3, nand1);
//	nand na_Qn(nand3, nand2, Q);
//endmodule
