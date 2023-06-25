module testbench();
	
	reg reset;
	reg clk;
	
	process pro(clk, reset);
	
	initial begin
		reset = 1;
		clk = 1;
		#100 reset = 0;
	end
	
	always #50 clk = ~clk;
		
endmodule
