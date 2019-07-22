module alu_control(alu_op, funct, out);

input [1:0] alu_op;
input [5:0] funct;
output reg [3:0] out;

always @(*)
begin
case(alu_op)
	2'b00:out = 4'b0010;
	2'b01:out = 4'b0011;
	2'b10:	case(funct)
						6'b100000:out = 4'b0010;
						6'b100010:out = 4'b0011;
						6'b100100:out = 4'b0000;
						6'b100101:out = 4'b0001;
					endcase
endcase
end

endmodule

