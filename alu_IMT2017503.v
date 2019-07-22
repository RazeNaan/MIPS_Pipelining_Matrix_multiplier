module alu(data1, data2, contr_in ,out, zero_flag);

input [31:0]data1;
input [31:0]data2;
input [3:0]contr_in;

output reg [31:0]out;
output reg zero_flag;

always @ (data1 or data2 or contr_in)
begin
    case(contr_in)
    4'b0010:begin
        		out = data1 + data2;
        		end
    4'b0011:begin
        		out = data1 - data2;
        		end
    4'b0000:begin
        		out = data1 * data2;
        		end
    4'b0001:begin
        		out = data1 | data2;
        		end
    endcase
		if(out == 0)
		begin
			zero_flag = 1;
		end
end
endmodule
