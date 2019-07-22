module control(opcode, wb, m, ex);

input [5:0] opcode;
output reg [1:0] wb;
output reg [2:0] m;
output reg [3:0] ex;

always @(opcode)
begin
	case(opcode)
		0:begin
			ex = 4'b1010;
			wb = 2'b10;
			m = 3'b000;
			end
		35:begin
			 ex = 4'b0100;
			 wb = 2'b11;
			 m = 3'b010;
		   end
		43:begin
			 ex = 4'b0100;
			 wb = 2'b00;
			 m = 3'b001;
		 	 end
		04:begin
			 ex = 4'b0001;
			 wb = 2'b10;
			 m = 3'b100;
		 	 end
	endcase
end
endmodule
