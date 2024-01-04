module comparator_equal(i_A, i_B, o_isZero);
	input [4:0]i_A, i_B;
	output o_isZero;
	wire xor0, xor1, xor2, xor3, xor4;
	genvar i;
	
	nor no1(o_isZero, xor0, xor1, xor2, xor3, xor4);
	xor x0(xor0, i_A[0], i_B[0]);
	xor x1(xor1, i_A[1], i_B[1]);
	xor x2(xor2, i_A[2], i_B[2]);
	xor x3(xor3, i_A[3], i_B[3]);
	xor x4(xor4, i_A[4], i_B[4]);
	
endmodule
