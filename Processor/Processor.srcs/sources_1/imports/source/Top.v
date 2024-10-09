module Top(clk, reset);
    input wire      clk, reset;

    wire [31:0]     pc, instruction;
    wire [31:0]     dmemDataStore, dmemDataRead, dmemAdrs;
    wire [2:0]      dmemMode;
    wire            dmemWE;      

    Processor processor(
        .clk(clk), 
        .reset(reset), 
        .instruction(instruction),
        .pc(pc),
        .dmemWE(dmemWE), 
        .dmemMode(dmemMode),
        .dmemAdrs(dmemAdrs), 
        .dmemDataRead(dmemDataRead), 
        .dmemDataStore(dmemDataStore));
        
    Data_Memory dataMemory(
        .addr(dmemAdrs), 
        .readdata(dmemDataRead), 
        .writedata(dmemDataStore), 
        .clk(clk), 
        .we(dmemWE),                // Control Logic
        .mode(dmemMode),            // Control Logic
        .reset(reset));

    Instruction_Memory instructionMemory (
        .addr(pc), 
        .rd(instruction));

endmodule