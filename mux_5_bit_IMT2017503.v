module mux_5_bit(Data_in_0, Data_in_1, sel, Data_out);

	input [4:0] Data_in_0;
	input [4:0] Data_in_1;
	input sel;
	output reg [4:0] Data_out;

	always @(Data_in_0,Data_in_1,sel)
	begin
		if(sel == 0) 
			Data_out = Data_in_0;
		else
			Data_out = Data_in_1;
	end
endmodule

