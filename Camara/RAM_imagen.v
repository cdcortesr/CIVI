module RAM_imagen (
	input		clk_i,
	input		rst,

	input		we_i,
	input		re_i,
	//
	input      [18:0] adr_i,
	input      [7:0] dat_i,
	output reg [7:0] dat_o,
	output reg fin);

parameter word_depth = 307200; //640 x480
parameter word_width = 8;

reg [7:0] ram [0:word_depth-1];

always @(posedge clk_i)
begin
	if(rst)
		fin=0;
	if (we_i)
		begin
		ram[ adr_i ] <= dat_i;
		if(adr_i==307199)  
			fin=1;
		end 
end

always @(posedge re_i)
	dat_o <= ram[ adr_i ];

endmodule
