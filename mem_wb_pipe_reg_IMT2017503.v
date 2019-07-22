module mem_wb_pipe_reg(clock, wb_in, mem_to_reg, reg_write, read_data_in, read_data_out, alu_result_in, alu_result_out, write_back_in, write_back_out);

input clock;
input [1:0] wb_in;
output reg mem_to_reg, reg_write;
input [31:0] alu_result_in, read_data_in;
output reg [31:0] alu_result_out, read_data_out;
input [4:0] write_back_in;
output reg [4:0] write_back_out;

always @(posedge clock)
begin
	mem_to_reg = wb_in[0:0];
	reg_write = wb_in[1:1];
	alu_result_out = alu_result_in;
	read_data_out = read_data_in;
	write_back_out = write_back_in;
end
endmodule
