module mips_tb();

reg clock;

mips uut(
	.clock(clock)
);

initial
begin
	clock = 0;
end
	always #3 clock = ~clock;
	initial #20000 $finish;
endmodule
