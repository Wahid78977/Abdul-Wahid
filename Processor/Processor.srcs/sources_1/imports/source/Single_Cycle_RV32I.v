module Processor(clk, reset, instruction, pc, dmemWE, dmemMode, dmemAdrs, dmemDataRead, dmemDataStore);
    input wire          clk, reset;
    input wire [31:0]   instruction, dmemDataRead;

    output wire [31:0]  dmemAdrs, dmemDataStore, pc;
    output wire [2:0]   dmemMode;
    output wire         dmemWE;

    wire [31:0]         ALUResults;
    wire [3:0]          ALUControl;
    wire [2:0]          immSEL;
    wire [1:0]          regSEL, pcSEL;
    wire                regWE, rs1SEL, rs2SEL;      

    Datapath datapath (
            .clk(clk), 
            .reset(reset), 
            .regWE(regWE), 
            .rs1sel(rs1SEL), 
            .rs2sel(rs2SEL), 
            .regsel(regSEL), 
            .PCsel(pcSEL), 
            .ImmSel(immSEL), 
            .ALUControl(ALUControl), 
            .Instruction(instruction),  
            .dmemData(dmemDataRead), 
            .pc(pc), 
            .dmemrs2(dmemDataStore), 
            .ALUout(ALUResults));
    assign dmemAdrs = ALUResults;

    Control_Logic control_logic (
            .clk(clk),
            .reset(reset),
            .instruction(instruction), 
            .jump(ALUResults[0]), 
            .ALUControl(ALUControl), 
            .dmemMode(dmemMode), 
            .immSEL(immSEL), 
            .regSEL(regSEL), 
            .pcSEL(pcSEL), 
            .dmemWE(dmemWE), 
            .regWE(regWE), 
            .rs1SEL(rs1SEL), 
            .rs2SEL(rs2SEL));



endmodule
