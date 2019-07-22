module ex_mem_pipe_reg(clock, wb_in, wb_out, m_in, branch, mem_write, mem_read, zero_flag_in, zero_flag_out, alu_result_in, alu_result_out, write_data_in, write_data_out, write_back_reg_in, write_back_reg_out, pc_add_in, pc_add_out);

input clock, flag_in;
input [1:0] wb_in;
output reg [1:0] wb_out;
input [2:0] m_in;
input zero_flag_in;
output reg branch, mem_read, mem_write, zero_flag_out;
input [31:0] pc_add_in, alu_result_in, write_data_in;
output reg [31:0] pc_add_out, alu_result_out, write_data_out;
input [4:0] write_back_reg_in;
output reg [4:0] write_back_reg_out;

always @(posedge clock)
begin
	wb_out <= wb_in;
	branch <= m_in[2:2];
	mem_read <= m_in[1:1];
	mem_write <= m_in[0:0];
	pc_add_out <= pc_add_in;
	zero_flag_out <= zero_flag_in;
	alu_result_out <= alu_result_in;
	write_data_out <= write_data_in;
	write_back_reg_out <= write_back_reg_in;


end
endmodule
