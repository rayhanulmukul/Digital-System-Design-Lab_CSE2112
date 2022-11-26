module up(u,q,clk,clear);
input u,clk,clear;
output[0:2]q;
	jk jk0(q[0],(u&~q[2]&~q[1])+(~u&q[2]&q[1]),(u&~q[2]&~q[1])+(~u&q[2]&q[1]),clear, clk);
    	jk jk1(q[1],u^q[2],u^q[2],clear, clk);
    	jk jk2(q[2],1,1,clear, clk);
endmodule

module jk(q, j, k, clear, clk);
	input j, k, clear, clk;
	output q;
	wire a, b, c, d, y, y_bar, c_bar,q_bar;
	nand(a, q_bar, j, clk, clear);
	nand(b, k, clk, q);
	nand(c, a, d);
	nand(d, c, clear, b);
	not(c_bar, clk);
	nand(y, c, c_bar);
	nand(y_bar, d, c_bar);
	nand(q, y, q_bar);
	nand(q_bar, q, clear, y_bar);
endmodule