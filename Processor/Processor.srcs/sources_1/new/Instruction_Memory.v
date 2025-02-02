module Instruction_Memory(addr, rd);
	input wire [31:0]	addr;
	output wire [31:0]	rd;
	
	reg [31:0] mem [0:63];

	parameter INITIAL_DATA_PATH = "/Data/imem.dat";
	
	initial
		$readmemh(INITIAL_DATA_PATH, mem);
	
	
	assign rd = mem[addr[31:2]];

endmodule
