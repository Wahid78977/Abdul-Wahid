
//
//	alu32_tb.v
//		Testbench for Register file for the RV32I
//

// -------------------------------- //
//	By: Bryce Keen	
//	Created: 09/29/2022
// -------------------------------- //
//	Last Modified: 09/30/2022

// Change Log:	NA



module alu32_tb();
	reg [31:0]		a = 0, b = 0;
	reg [3:0]		ALUControl = 4'b0000;
	wire [31:0]		result;
	
	alu32 UUT(
		.a(a),
		.b(b),
		.ALUControl(ALUControl),
		.result(result));
		
	initial begin
		ALUControl <= 4'b0000;
		a <= 10;
		b <= 10;
		
		#2
		
		ALUControl <= 4'b0001;
		a <= 10;
		b <= 10;
		
		#2
		
		ALUControl <= 4'b0010;
		a <= 10;
		b <= 10;
				
		#2
		
		ALUControl <= 4'b0011;
		a <= 10;
		b <= 10;
			
		#2
	
		ALUControl <= 4'b0100;
		a <= 10;
		b <= 10;
			
		#2
	
		$finish;
	end
	
endmodule