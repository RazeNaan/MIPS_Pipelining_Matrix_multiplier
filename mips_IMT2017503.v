module mips(clock);

input clock;

reg [31:0] pc;
wire pc_src;
wire [31:0] pc_wire, pc_wire_add, pc_wire1, pc_wire2, pc_wire3, pc_wire4, pc_wire5, pc_wire6, pc_wire7;
wire [31:0] instruction_wire, instruction_wire1;
wire reg_write;
wire [31:0] write_data;
wire [4:0] write_reg;
wire [31:0] read_data1, read_data1_1, read_data2, read_data2_1;
wire [1:0] wb_wire, wb_wire1, wb_wire2;
wire [2:0] m_wire, m_wire1;
wire [3:0] ex_wire;
wire [1:0] alu_op;
wire reg_dst, alu_src;
wire [31:0] funct_and_add_wire;
wire [4:0] targ_wire1, targ_wire2;
wire [31:0] alu_in_2;
wire [3:0] alu_sig_wire;
wire [31:0] alu_result, alu_result1, alu_result2;
wire zero_flag, zero_flag1;
wire [4:0] write_back_reg_wire, write_back_reg_wire1, write_back_reg_wire2;
wire branch, mem_write, mem_read;
wire [31:0] write_reg_data_mem;
wire [31:0] read_data_wire, read_data_wire1;
wire mem_to_reg;
wire [31:0] mux_out;
wire [31:0] add_out;

assign pc_wire = 1;
assign pc_src = 0;
assign pc_wire_add = 1;
assign pc_wire3 = 32'b00000000000000000000000000000010;
assign pc_wire7 = 2;

mux_m m1(add_out, pc_wire7, pc_src, mux_out);
assign pc_wire1 = mux_out;
always @(posedge clock)
begin
	if(pc_src == 1 || pc_src == 0)
	pc = pc_wire1;
end
initial
begin
	pc = pc_wire;
end
initial
begin
	$display(pc_wire3);
end
assign pc_wire2 = pc;
instr_mem_file i1(pc_wire2, instruction_wire);

bit_32_adder b1(clock, pc_wire2, 32'b00000000000000000000000000000001, add_out);
assign pc_wire3 = add_out;

if_id_pipe_reg p1(clock, instruction_wire,instruction_wire1, add_out, pc_wire4);

reg_file rf1(clock, reg_write, write_back_reg_wire2, instruction_wire1[25:21], instruction_wire1[20:16], read_data1, read_data2, write_data);

control c1(instruction_wire1[31:26], wb_wire, m_wire, ex_wire);

id_ex_pipe_reg ip1(clock, wb_wire, wb_wire1, m_wire, m_wire1, ex_wire, alu_op, alu_src, reg_dst, pc_wire4, pc_wire5, read_data1, read_data1_1, read_data2, read_data2_1, instruction_wire1[20:16], targ_wire1, instruction_wire1[15:11], targ_wire2, instruction_wire1[15:0], funct_and_add_wire);

bit_32_adder b2(clock, pc_wire5, funct_and_add_wire, pc_wire6);
mux m2(read_data2_1, funct_and_add_wire, alu_src, alu_in_2);
alu_control ac1(alu_op, funct_and_add_wire[5:0], alu_sig_wire);
alu al1(read_data1, alu_in_2, alu_sig_wire, alu_result, zero_flag);
mux_5_bit m3(targ_wire1, targ_wire2, reg_dst, write_back_reg_wire);

ex_mem_pipe_reg ep1(clock, wb_wire1, wb_wire2, m_wire1, branch, mem_write, mem_read, zero_flag, zero_flag1, alu_result, alu_result1, read_data2_1, write_reg_data_mem, write_back_reg_wire, write_back_reg_wire2, pc_wire6, pc_wire7);


and a1(pc_src, branch, zero_flag1);

data_memory dm1(clock, alu_result1, write_reg_data_mem, mem_read, mem_write, read_data_wire);

mem_wb_pipe_reg mp1(clock, wb_wire, mem_to_reg, reg_write, read_data_wire, read_data_wire1, alu_result1, alu_result2, write_back_reg_wire2, write_reg);

mux m4(alu_result2, read_data_wire1,  mem_to_reg, write_data);


endmodule

module bit_32_adder(clock, in1, in2, out);

input clock;
input [31:0] in1, in2;
output reg[31:0] out;

always @(posedge clock)
begin
	out = in1 + in2;
end

endmodule
module adder32(
	   // Outputs
		     result, 
		 //       // Inputs
		          a, b
		              
);
input[31:0] a;
input[31:0] b;
output [31:0] result;
wire [32:0] sum = {1'b0,a} + {1'b0,b};
assign      result = sum[32] ? sum[32:1]: sum[31:0];
endmodule // adder32

module mux_m(Data_in_0, Data_in_1, sel, Data_out);

	input [31:0] Data_in_0;
	input [31:0] Data_in_1;
	input sel;
	output reg [31:0] Data_out;

	always @(Data_in_0,Data_in_1,sel)
	begin
		if(sel == 1'b0) 
			Data_out = Data_in_0;
		else
			Data_out = Data_in_1;
	end
endmodule
