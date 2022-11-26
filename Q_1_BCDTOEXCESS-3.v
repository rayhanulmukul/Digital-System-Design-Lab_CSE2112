module BcdToExcess(b, a);
	input [3:0] a;
	output [3:0] b;
	wire p, q;
	assign b[0] = ~a[0];
	xnor(b[1], a[0], a[1]);
	or(p, a[1], a[0]);
	xor(b[2], a[2], p);
	and(q, p, a[2]);
	or(b[3], a[3], q);
endmodule
module bcd_stimulus;
	reg [3:0] a;
	wire [3:0] b;
	BcdToExcess bcd(b, a);
	initial
	begin
	    a = 4'b0000;
	#50 a = 4'b0001;
	#50 a = 4'b0010;
	#50 a = 4'b0011;
	#50 a = 4'b0100;
	#50 a = 4'b0101;
	#50 a = 4'b0110;
	#50 a = 4'b0111;
	#50 a = 4'b1000;
	#50 a = 4'b1001;
	#50 $finish;
	end
endmodule