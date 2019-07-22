module id_ex_pipe_reg(clock, wb_in, wb_out, m_in, m_out, ex_in, alu_op, alu_src, reg_dst, pc_in, pc_out, read_data1_in, read_data1_out, read_data2_in, read_data2_out, instr_reg1_in, instr_reg1_out, instr_reg2_in, instr_reg2_out, instr_add_to_reg_in, instr_add_to_reg_out);

input clock;
input [31:0] pc_in, read_data1_in, read_data2_in;
input [15:0] instr_add_to_reg_in;
input [4:0] instr_reg1_in, instr_reg2_in;
input [1:0] wb_in;
output reg[1:0] wb_out;
input [2:0] m_in;
output reg [2:0] m_out;
input [3:0] ex_in;
output reg [31:0] pc_out, read_data1_out, read_data2_out, instr_add_to_reg_out;
output reg [4:0] instr_reg1_out, instr_reg2_out;
output reg [1:0] alu_op;
output reg reg_dst;
output reg alu_src;

always @(posedge clock)
begin
	pc_out <= pc_in;
	read_data1_out <= read_data1_in;
	read_data2_out <= read_data2_in;
	instr_add_to_reg_out <= instr_add_to_reg_in;
	instr_reg1_out <= instr_reg1_in;
	instr_reg2_out <= instr_reg2_in;
	wb_out <= wb_in;
	m_out <= m_in;
	alu_op <= ex_in[1:0];
	alu_src <= ex_in[2:2];
	reg_dst <= ex_in[3:3];
end
endmodule
