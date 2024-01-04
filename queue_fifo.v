module queue_fifo(clk, enable, read_write, empty, full, IO);
	input clk, enable, read_write;
	output empty, full;
	inout [7:0] IO;
	
	wire notRW, and1, and2, and3, and4, xor1, nxor1, iszero;
	wire [5:0] F, B;
	wire [4:0] mux;
	
	not n1(notRW, read_write);
	and a1(and1, notRW, enable);
	and a2(and2, read_write, enable);
	
	counter_6bit front(	.clk(clk),
								.en(and1),
								.clear(1'b1),
								.out(F[5:0])
							);
	counter_6bit back(	.clk(clk),
								.en(and2),
								.clear(1'b1),
								.out(B[5:0])
							);
	comparator_equal com1(	.i_A(F[4:0]),
									.i_B(B[4:0]),
									.o_isZero(iszero)
								);
	mux2to1_5bit m21_5bit(	.A(F[4:0]),
									.B(B[4:0]),
									.sel(and1),
									.C(mux[4:0])
								);
	RAM_32x8 R1 (	.IO(IO[7:0]), 
						.addr(mux[4:0]), 
						.RW_sel(and2), 
						.chip_sel(enable)
					);
	
	xor x1(xor1, F[5], B[5]);
	not n2(nxor1, xor1);
	and a3(empty, nxor1, iszero);
	and a4(full, xor1, iszero);
endmodule
