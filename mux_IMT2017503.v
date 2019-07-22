module mux(Data_in_0, Data_in_1, sel, Data_out);

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
