module RAM_32x8(IO, addr, RW_sel, chip_sel );
	
	input [4:0]addr;
	input RW_sel, chip_sel;
	inout [7:0]IO;
	
	genvar i;
	wire and1, and2, not1;
	wire [31:0]d;
	wire [7:0]q;
	
	decoder_5to32 dec1(
							.A(addr),
							.D(d[31:0])
							);
	not n1(not1, RW_sel);
	and a1(and1, RW_sel, chip_sel);
	and a2(and2, not1, chip_sel);
	
	generate
		for(i=31; i>=0; i=i-1) begin: block1
			REG_8bit reg8b(.D(d[i]), 
								.Q(q[i]), 
								.row_sel(), 
								.write_en(and1)
								);
		end
		for(i=0; i<=7; i=i+1) begin: block3
			bufif1 b2(IO[i],q[i],and2);
		end
	endgenerate
	
endmodule
