module excess3tobcd(b, a);
	input [3:0] a;
	output [3:0] b;
	assign b[0] = ~a[0];
	xor(b[1], a[1], a[0]);
	xor(b[2], a[2], (~a[1] | ~a[0]));
	and(b[3], a[3], (a[2] | (a[1] & a[0])));
endmodule
module excess3_stimulus;
	reg [3:0] a;
	wire [3:0] b;
	excess_3_to_bcd excess(b, a);
	initial
	begin
	    a = 4'b0011;
	#50 a = 4'b0100;
	#50 a = 4'b0101;
	#50 a = 4'b0110;
	#50 a = 4'b0111;
	#50 a = 4'b1000;
	#50 a = 4'b1001;
	#50 a = 4'b1010;
	#50 a = 4'b1011;
	#50 a = 4'b1100;
	#50 $finish;
	end
endmodule
