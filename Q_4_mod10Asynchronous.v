module MOD10Asnchr(q, clear, clk);
	input clear, clk;
	output [3:0] q;
	wire a;
	nand(a, q[3], q[1]);
	JK_flipflop jk0(q[0], , 1, 1, clk, (clear && a));
	JK_flipflop jk1(q[1], , 1, 1, q[0], (clear && a));
	JK_flipflop jk2(q[2], , 1, 1, q[1], (clear && a));
	JK_flipflop jk3(q[3], , 1, 1, q[2], (clear && a));
endmodule
module JK_flipflop(q, q_bar, j, k, clk, clear);
	input j, k, clear, clk;
	output q, q_bar;
	wire a, b, c, d, y, y_bar;
	nand(a, j, q_bar, clear, clk);
	nand(b, k, q, clk);
	nand(y, a, y_bar);
	nand(y_bar, b, clear, y);
	not(c_bar, clk);

	nand(c, c_bar, y);
	nand(d, c_bar, y_bar);
	nand(q, c, q_bar);
	nand(q_bar, q, d, clear);
endmodule