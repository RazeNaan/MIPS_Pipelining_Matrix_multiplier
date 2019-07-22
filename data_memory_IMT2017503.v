module data_memory(clock, address, write_data, mem_read, mem_write, read_data);

input clock;
input [31:0] address, write_data;
input mem_write, mem_read;
output reg [31:0] read_data; 

reg [31:0] m[0:29];
initial
begin
	m[0] = 6;
	m[1] = 2;
	m[2] = 3;
	m[3] = 5;
	m[4] = 5;
	m[5] = 4;
	m[6] = 5;
	m[7] = 6;
	m[8] = 5;

	m[9] = 7;
	m[10] = 2;
	m[11] = 2;
	m[12] = 5;
	m[13] = 2;
	m[14] = 5;
	m[15] = 3;
	m[16] = 5;
	m[17] = 8;
end

always @(clock)
begin
	if(clock == 0 && mem_write == 1)
	begin
		m[address] = write_data;
	end
	else if(mem_read == 1 && clock == 1)
	begin
		read_data = m[address];
	end
	$display("matrix =  ",m[18],m[19],m[20], m[21], m[22], m[23], m[24], m[25], m[26]);
end

endmodule
