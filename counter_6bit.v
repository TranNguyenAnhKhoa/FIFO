module counter_6bit (clk, en, clear, out);
	input wire clk, en, clear;
	output wire [5:0] out;
	
	genvar i;
	wire _not [5:0];
	wire and1;
	
	and a1 (and1, clk, en);
	
	generate 
		for (i = 0; i <= 5; i = i + 1) begin: counter1
			if(i == 0) begin
				not n0 (_not[i], out[i]);
				asyn_dff dff0 (.clk(and1),
									.D(_not[i]),
									.clear(clear),
									.preset(1'b1),
									.Q(out[i])
									);
			end else begin
				not n0 (_not[i], out[i]);
				asyn_dff dff1 (.clk(_not[i - 1]),
									.D(_not[i]),
									.clear(clear),
									.preset(1'b1),
									.Q(out[i])
									);
			end
		end
	endgenerate

endmodule

module asyn_dff(D, clk, preset, clear, Q);
	input wire D, clk, preset, clear;
	output wire Q;
	
	wire and1, and2, and3, and4, not1, not2, not3, not4, not5, not6, not7, not8, not9, or1, or2, _Q;
	
	and a1 (and1, D, not6, clear);
	not n1 (not1, D);
	and a2 (and2, not1, not6, preset);
	not n2 (not2, or1);
	not n3 (not3, or2);
	not n4 (not4, preset);
	not n5 (not5, clear);
	not n6 (not6, clk);
	or o1 (or1, and1, not3, not4);
	or o2 (or2, and2, not2, not5);
	not n7 (not7, not6);
	and a3 (and3, or1, not7);
	and a4 (and4, or2, not7);
	not n8 (not8, Q);
	not n9 (not9, _Q);
	or o3 (Q, not4, and3, not9);
	or o4 (_Q, not5, and4, not8);
endmodule
