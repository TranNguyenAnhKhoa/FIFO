module REG_8bit(D, Q, row_sel, write_en);
	// port 
	input [7:0]D;
	input row_sel, write_en;
	output [7:0]Q;
	// variable
	genvar i;
	//logic
	generate
	for(i=7; i>=0; i=i-1) begin: reg1
		memcell mc( .data(D[i]), 
						.write_en(write_en), 
						.row_sel(row_sel), 
						.Q(Q[i])
						);
		end
	endgenerate
endmodule
