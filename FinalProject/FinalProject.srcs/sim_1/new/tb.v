`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2022 07:53:32 PM
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb();
    reg clk;
    
    // IF Stage
    
    // PC
    wire [31:0] if_pc_in;
    wire [31:0] if_pc_out;
    
    // PC Adder
    wire [31:0] if_pc_adder_out;
    
    // Instruction Memory
    wire [31:0] if_instr_out;
    
    // IF/ID Buffer
    wire [31:0] id_pc_out, id_instr_out;
    
    // ID Stage
    wire id_regWrt, id_svpc, id_wai, id_memToReg, id_branchN, id_branchZ, id_jump, id_memWrite, id_memRead, id_aluSrc;
    wire [2:0] id_aluOp;
    wire [31:0] id_rs1_out, id_rs2_out, id_imm_out;
    
    // ID/ExMem Buffer
    wire exmem_regWrt_out, exmem_svpc_out, exmem_wai_out, exmem_memToReg_out, exmem_branchN_out, exmem_branchZ_out, exmem_jump_out, exmem_memWrite_out, exmem_memRead_out, exmem_aluSrc_out;
    wire [2:0] exmem_aluOp_out;
    wire [31:0] exmem_xrs1_out, exmem_xrs2_out, exmem_imm_out, exmem_pc_out;
    wire [5:0] exmem_rd_out; 
    
    // Ex/Mem Stage
    wire exmem_and_n;
    wire exmem_and_z;
    wire exmem_or;
    wire exmem_alu_n, exmem_alu_z;
    wire [31:0] exmem_alu_out;
    wire [31:0] exmem_pcadder_out, exmem_mux2to1_out;
    wire [31:0] exmem_mem_read_out;
    
    // EXMem/WB Buffer
    
    wire wb_svpc_out, wb_wai_out, wb_memToReg_out, wb_alu_n, wb_alu_z;
    wire [31:0] wb_pc_out, wb_pcadder_out, wb_alu_out, wb_mem_read_out;
    
    // Checking if the writing is working
    wire wb_regWrt_out; // Register File regWrt
    wire [5:0] wb_rd_out; // Register File rd
    wire [31:0] id_write_data; // Register File Write Data
    
    // WB Stage
    
    wire [31:0] wb_mux2to1_pc_out, wb_mux2to1_alu_mem_out;
    
    //  ---Components---
    
    // IF Stage
    
    mux2to1 if_mux2to1(.w0(if_pc_adder_out), .w1(exmem_xrs1_out), .s(exmem_or), .out(if_pc_in));
    adder32bit if_adder32bit(.a(1), .b(if_pc_out), .out(if_pc_adder_out));
    pc pc(.clock(clk), .pc_in(if_pc_in), .pc_out(if_pc_out));
    instmem instmem(.clock(clk), .address(if_pc_out), .inst(if_instr_out));
    
    // IF/ID Buffer
    
    iftoidbuff iftoidbuff(.clk(clk), .PCIn(if_pc_out), .InstrIn(if_instr_out), .PCOut(id_pc_out), .InstrOut(id_instr_out));
    
    // ID Stage
    
    Control_final control(.clk(clk), .Op(id_instr_out[31:28]), .RegWrt(id_regWrt), .SVPC(id_svpc), .WAI(id_wai), .MemToReg(id_memToReg), .BranchN(id_branchN), .BranchZ(id_branchZ), .Jump(id_jump), .MemWrite(id_memWrite), .MemRead(id_memRead), .AluSrc(id_aluSrc), .AluOp(id_aluOp));
    
    register register(.clock(clk), .write(wb_regWrt_out), .rs1(id_instr_out[21:16]), .rs2(id_instr_out[15:10]), .rd(wb_rd_out), .datain(id_write_data), .rs1_out(id_rs1_out), .rs2_out(id_rs2_out));
    
    immgen immgen(.instr(id_instr_out), .immout(id_imm_out));

    mux2to1 id_mux2to1(.w0(wb_mux2to1_alu_mem_out), .w1(wb_mux2to1_pc_out), .s(wb_svpc_out), .out(id_write_data));

    // ID/ExMem Buffer
    
    idtoexmembuff idtoexmembuff(.clk(clk), .RegWrtIn(id_regWrt), .SVPCIn(id_svpc), .WAIIn(id_wai), .MemToRegIn(id_memToReg), .JumpIn(id_jump), .BranchNIn(id_branchN), .BranchZIn(id_branchZ), .MemWriteIn(id_memWrite), .MemReadIn(id_memRead), .AluOpIn(id_aluOp), .AluSrcIn(id_aluSrc), .PCIn(id_pc_out), .Xrs1In(id_rs1_out), .Xrs2In(id_rs2_out), .ImmgenIn(id_imm_out), .RdIn(id_instr_out[27:22]), .RegWrtOut(exmem_regWrt_out), .SVPCOut(exmem_svpc_out), .WAIOut(exmem_wai_out), .MemToRegOut(exmem_memToReg_out), .JumpOut(exmem_jump_out), .BranchNOut(exmem_branchN_out), .BranchZOut(exmem_branchZ_out), .MemWriteOut(exmem_memWrite_out), .MemReadOut(exmem_memRead_out), .AluOpOut(exmem_aluOp_out), .AluSrcOut(exmem_aluSrc_out), .PCOut(exmem_pc_out), .Xrs1Out(exmem_xrs1_out), .Xrs2Out(exmem_xrs2_out), .ImmgenOut(exmem_imm_out), .RdOut(exmem_rd_out));

    // Ex/Mem Stage
    
    and(exmem_and_n, exmem_branchN_out, wb_alu_n);
    and(exmem_and_z, exmem_branchZ_out, wb_alu_z);
    or(exmem_or, exmem_and_n, exmem_jump_out, exmem_and_z);
    
    adder32bit exmem_adder32bit(.a(exmem_imm_out), .b(exmem_pc_out), .out(exmem_pcadder_out));
    mux2to1 exmem_mux2to1(.w0(exmem_xrs2_out), .w1(exmem_imm_out), .s(exmem_aluSrc_out), .out(exmem_mux2to1_out));
    alu exmem_alu(.A(exmem_mux2to1_out), .B(exmem_xrs1_out), .Op(exmem_aluOp_out), .Out(exmem_alu_out), .Z(exmem_alu_z), .N(exmem_alu_n));
    data exmem_data(.clock(clk), .memWrite(exmem_memWrite_out), .memRead(exmem_memRead_out), .address(exmem_xrs1_out), .WD(exmem_xrs2_out), .RD(exmem_mem_read_out));
    
    // EXMem/WB Buffer
    
    exmemtowbbuff exmemtowbbuff(.clk(clk), .RegWrtIn(exmem_regWrt_out), .SVPCIn(exmem_svpc_out), .WAIIn(exmem_wai_out), .MemToRegIn(exmem_memToReg_out), .PCIn(exmem_pc_out), .PCAddIn(exmem_pcadder_out), .NegIn(exmem_alu_n), .ZeroIn(exmem_alu_z),  .AluResultIn(exmem_alu_out), .MemReadDataIn(exmem_mem_read_out), .RdIn(exmem_rd_out), .RegWrtOut(wb_regWrt_out), .SVPCOut(wb_svpc_out), .WAIOut(wb_wai_out), .MemToRegOut(wb_memToReg_out), .PCOut(wb_pc_out), .PCAddOut(wb_pcadder_out), .NegOut(wb_alu_n), .ZeroOut(wb_alu_z), .AluResultOut(wb_alu_out), .MemReadDataOut(wb_mem_read_out), .RdOut(wb_rd_out));
    
    // WB Stage
    
    mux2to1 wb_mux2to1_pc(.w0(wb_pcadder_out), .w1(wb_pc_out), .s(wb_wai_out), .out(wb_mux2to1_pc_out));
    mux2to1 wb_mux2to1_alu_mem(.w0(wb_alu_out), .w1(wb_mem_read_out), .s(wb_memToReg_out), .out(wb_mux2to1_alu_mem_out));
    
    initial
    begin
        clk = 1;
        forever #5 clk = ~clk;
    end

endmodule
