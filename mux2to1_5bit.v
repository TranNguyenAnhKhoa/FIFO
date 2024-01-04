module mux2to1_5bit(A, B, sel, C);
	input [4:0]A, B;
	input sel;
	output [4:0]C;
	genvar i;
	
	generate
		for(i=4; i>=0; i=i-1) begin: block1
			mux2to1 m1( .A(A[i]),
							.B(B[i]),
							.sel(sel),
							.C(C[i])
						);
		end
	endgenerate
	
endmodule

module mux2to1 (A, B, sel, C);
	input A, B, sel;
	output C;
	wire and1, and2, not1;
	
	not n1(not1, sel);
	and a1(and1, A, sel);
	and a2(and2, B, not1);
	or o1(C, and1, and2);
endmodule
