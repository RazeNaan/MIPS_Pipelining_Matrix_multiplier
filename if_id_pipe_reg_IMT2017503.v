module if_id_pipe_reg(clock, instr_in, instr_out, pc_in, pc_out);

input clock;
input [31:0] instr_in, pc_in;
output reg [31:0] instr_out, pc_out;

always @(posedge clock)
begin
	instr_out = instr_in;
	pc_out = pc_in;
end
	
endmodule
