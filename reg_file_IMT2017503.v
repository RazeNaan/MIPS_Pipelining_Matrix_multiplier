module reg_file(clock, reg_write, write_reg, read_reg1, read_reg2, read_data1, read_data2, write_data);

input clock, reg_write;
input [4:0] write_reg, read_reg1, read_reg2;
input [31:0] write_data;
output reg [31:0] read_data1, read_data2;
reg [31:0] s0,s1,s2,s3,s4,s5,s6,s7;
reg [31:0] t0,t1,t2,t3,t4,t5,t6,t7;

initial
begin
	s0 = 0;
	s1 = 0;
end



always @ (clock, read_reg1, read_reg2, write_reg, reg_write)
begin
	if(clock == 1)//doubt bitch
	begin
    case(read_reg1)
    16:read_data1=s0;
    17:read_data1=s1;
    18:read_data1=s2;
    19:read_data1=s3;
    20:read_data1=s4;
    21:read_data1=s5;
    22:read_data1=s6;
    23:read_data1=s7;
    endcase

		case(read_reg2)
    16:read_data2=s0;
    17:read_data2=s1;
    18:read_data2=s2;
    19:read_data2=s3;
    20:read_data2=s4;
    21:read_data2=s5;
    22:read_data2=s6;
    23:read_data2=s7;
		endcase
	end
	else if(clock == 0 && reg_write == 1)//doubt bitch
	begin
		case(write_reg)
			16:s0 = write_data;
			17:s1 = write_data;
			18:s2 = write_data;
			19:s3 = write_data;
			20:s4 = write_data;
			21:s5 = write_data;
			22:s6 = write_data;
			23:s7 = write_data;
		endcase
	end
end
endmodule

