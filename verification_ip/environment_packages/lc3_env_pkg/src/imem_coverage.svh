//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// DESCRIPTION: 
//         This component is used to collect functional coverage at the environment level.
//   Coverage collection components typically do not have analysis ports for broadcasting
//   transactions.  They typically only receive transactions and sample functional coverage
//   on the transaction variables.
// 
//   This analysis component has the following analysis_exports that receive the 
//   listed transaction type.
//   
//   imem_cov_analysis_export receives transactions of type  imem_transaction  
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//


class imem_coverage #(
  type CONFIG_T,
  type BASE_T = uvm_component
  ) extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( imem_coverage #(
                              CONFIG_T,
                              BASE_T
                              ))

  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;

  
  // Instantiate the analysis exports
  uvm_analysis_imp_imem_cov_analysis_export #(imem_transaction, imem_coverage #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) imem_cov_analysis_export;




  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  imem_transaction coverage_trans;
  /*
  pc_t pc ;
  pc_t pc_past;
  instr_dout_t instr_dout ;
  opcode_t opcode ;
  reg_t dr ;
  reg_t sr1 ;
  reg_t sr2 ;
  reg_t baser ;
  imm5_t imm5 ;
  pcoffset6_t pcoffset6 ;
  nzp_t nzp ;
  pcoffset9_t pcoffset9 ;
  complete_instr_t complete_instr ;
  instrmem_rd_t instrmem_rd ;*/

// ****************************************************************************
  // UVMF_CHANGE_ME : Add coverage bins, crosses, exclusions, etc. according to coverage needs.
  covergroup imem_coverage_cg;
    // pragma uvmf custom covergroup begin
    option.auto_bin_max=1024;
    option.per_instance=1;
    // pragma uvmf custom covergroup end
  endgroup
  
  covergroup CTRL_OPR_cg ;

	OPCODE : coverpoint coverage_trans.Instr_dout[15:12]
	{
		bins BR_bin  = {BR};
		bins JMP_bin = {JMP};
	}
	BASER : coverpoint coverage_trans.Instr_dout[8:6] iff(coverage_trans.Instr_dout[15:12] == JMP)
	{
		bins BaseR_JMP_bin[] = {[0:7]};
	}
	NZP_JMP : coverpoint coverage_trans.Instr_dout[11:9] iff(coverage_trans.Instr_dout[15:12] == JMP)
	{
		bins NZP_JMP_bin = {7};
	}
	NZP_BR : coverpoint coverage_trans.Instr_dout[11:9] iff(coverage_trans.Instr_dout[15:12] == BR)
        {
                bins NZP_BR_bin = {[1:6]};
        }

	PCOFFSET9 : coverpoint coverage_trans.Instr_dout[8:0] iff(coverage_trans.Instr_dout[15:12] == BR)
	{
		option.auto_bin_max = 512 ;
	}
	PCOFFSET9C : coverpoint coverage_trans.Instr_dout[8:0] iff(coverage_trans.Instr_dout[15:12] == BR)
	{
		bins pcoffset9_corner_low   = {9'h000} ;
		bins pcoffset9_corner_high  = {9'h1FF} ;
	}

endgroup

covergroup ALU_OPR_cg;

	Cov_alu_opcode : coverpoint coverage_trans.Instr_dout[15:12]
	{
		bins ADD_b = {ADD};
		bins AND_b = {AND};
		bins NOT_b = {NOT};
	}
	Cov_alu_opcode_AND_ADD : coverpoint coverage_trans.Instr_dout[15:12]
	{
		bins AND_p = {AND};
		bins ADD_p = {ADD};
	}	
	Cov_alu_opcode_NOT : coverpoint coverage_trans.Instr_dout[15:12]
	{
		bins NOT_p = {NOT};
	}
	Cov_imm_en : coverpoint coverage_trans.Instr_dout[5]
	{
		bins HIGH = {1'b1};
		bins LOW  = {1'b0};
	}
	Cov_SR1 : coverpoint coverage_trans.Instr_dout[8:6]
	{
		bins ALU_SR1[] = {[0:7]};
	}
	Cov_SR2 : coverpoint coverage_trans.Instr_dout[2:0]
	{
		bins ALU_SR2[] = {[0:7]};
	}
	Cov_DR  : coverpoint coverage_trans.Instr_dout[11:9]
	{
		bins ALU_DR[] = {[0:7]};
	}
	Cov_imm5 : coverpoint coverage_trans.Instr_dout[4:0] iff(coverage_trans.Instr_dout[5] == 1'b1)
	{
		bins IMM[] = {[5'b00000:5'b11111]};
	}
	Xc_opcode_imm_en : cross Cov_alu_opcode_AND_ADD,Cov_imm_en;
	Xc_opcode_dr_sr1_imm5 : cross Cov_alu_opcode_AND_ADD,Cov_SR1,Cov_DR,Cov_imm5 iff(coverage_trans.Instr_dout[5] == 1'b1);			
	Xc_opcode_dr_sr1_sr2 : cross Cov_alu_opcode_AND_ADD,Cov_SR1,Cov_SR2,Cov_DR  iff(coverage_trans.Instr_dout[5] == 1'b0);		//&&((coverage_trans.Instr_dout[15:12]==1)||(instr_dout[15:12]==5)));	Cov_imm5 		//CHNAGED
endgroup


covergroup MEM_OPR_cg;
	Cov_mem_opcode : coverpoint coverage_trans.Instr_dout[15:12]
	{
		bins LD_b  = {LD };
		bins LDR_b = {LDR};
		bins LDI_b = {LDI};
		bins LEA_b = {LEA};
		bins ST_b  = {ST };
		bins STR_b = {STR};
		bins STI_b = {STI};
	}
	Cov_BaseR_LDR : coverpoint coverage_trans.Instr_dout[8:6] iff(coverage_trans.Instr_dout[15:12] == LDR)
	{
		bins LDR_BaseR[] = {[3'b000:3'b111]};
	}
	Cov_BaseR_STR : coverpoint coverage_trans.Instr_dout[8:6] iff(coverage_trans.Instr_dout[15:12] == STR)
	{
		bins STR_BaseR[] = {[3'b000:3'b111]};
	}
	Cov_SR_ST : coverpoint coverage_trans.Instr_dout[11:9] iff(coverage_trans.Instr_dout[15:12] == ST)
	{
		bins ST_SR[] = {[3'b000:3'b111]};
	}
	Cov_SR_STI : coverpoint coverage_trans.Instr_dout[11:9] iff(coverage_trans.Instr_dout[15:12] == STI)
	{
		bins STI_SR[] = {[3'b000:3'b111]};
	}
	Cov_SR_STR : coverpoint coverage_trans.Instr_dout[11:9] iff(coverage_trans.Instr_dout[15:12] == STR)
	{
		bins STR_SR[] = {[3'b000:3'b111]};
	}
	Cov_DR_LD : coverpoint coverage_trans.Instr_dout[11:9] iff(coverage_trans.Instr_dout[15:12] == LD)
	{
		bins LD_DR[] = {[3'b000:3'b111]};
	}
	Cov_DR_LDR : coverpoint coverage_trans.Instr_dout[11:9] iff(coverage_trans.Instr_dout[15:12] == LDR)
	{
		bins LDR_DR[] = {[3'b000:3'b111]};
	}
	Cov_DR_LDI : coverpoint coverage_trans.Instr_dout[11:9] iff(coverage_trans.Instr_dout[15:12] == LDI)
	{
		bins LDI_DR[] = {[3'b000:3'b111]};
	}
	Cov_DR_LEA : coverpoint coverage_trans.Instr_dout[11:9] iff(coverage_trans.Instr_dout[15:12] == LEA)
	{
		bins LEA_DR[] = {[3'b000:3'b111]};
	}
	Cov_PCoffset9 : coverpoint coverage_trans.Instr_dout[8:0] iff(coverage_trans.Instr_dout[15:12] == LD || coverage_trans.Instr_dout[15:12] == LDI || coverage_trans.Instr_dout[15:12] == LEA || coverage_trans.Instr_dout[15:12] == ST || coverage_trans.Instr_dout[15:12] == STI || coverage_trans.Instr_dout[15:12] == BR )
	{
		option.auto_bin_max = 512 ;
	}
	Cov_PCoffset6 : coverpoint coverage_trans.Instr_dout[5:0] iff(coverage_trans.Instr_dout[15:12] == LDR || coverage_trans.Instr_dout[15:12] == STR)
	{
		option.auto_bin_max = 64 ;
	}
	Cov_PCoffset9_c : coverpoint coverage_trans.Instr_dout[8:0] iff(coverage_trans.Instr_dout[15:12] == LD || coverage_trans.Instr_dout[15:12] == LDI || coverage_trans.Instr_dout[15:12] == LEA || coverage_trans.Instr_dout[15:12] == ST || coverage_trans.Instr_dout[15:12] == STI || coverage_trans.Instr_dout[15:12] == BR )
	{
		bins PCoffset9_c_high= {9'b111111111};
		bins PCoffset9_c_low= {9'b000000000};
	}
	Cov_PCoffset6_c : coverpoint coverage_trans.Instr_dout[5:0] iff(coverage_trans.Instr_dout[15:12] == LDR || coverage_trans.Instr_dout[15:12] == STR)
	{
		bins PCoffset6_c_high= {6'b111111};
		bins PCoffset6_c_low= {6'b000000};
	}
	
/* -----\/----- EXCLUDED -----\/----- too many cross combinations with wide offsets, source and dest registers take priority
	Xc_BaseR_SR_offset6 : cross Cov_PCoffset6,Cov_SR_STR,Cov_BaseR_STR,Cov_mem_opcode 
    	{
       		ignore_bins others = binsof(Cov_mem_opcode) intersect {LDR, LDI, STI, ST, LEA ,LD};
   	}

    	Xc_BaseR_DR_offset6 : cross Cov_PCoffset6,Cov_DR_LDR,Cov_BaseR_LDR,Cov_mem_opcode 
  	{
        	ignore_bins others = binsof(Cov_mem_opcode) intersect {STR, LD, LDI, STI, ST, LEA};
        }
 -----/\----- EXCLUDED -----/\----- */

	
endgroup



covergroup OPR_SEQ_cg ;
	Cov_opcode_order : coverpoint coverage_trans.Instr_dout[15:12]
	{
		bins ALU_Memory = (AND, ADD, NOT => LD, LDR, LDI, LEA, ST, STR, STI);
		bins ALU_Control = (AND, ADD, NOT => BR, JMP);		
		bins Control_Memory = (BR, JMP => LD, LDR, LDI, LEA, ST, STR, STI);
		bins Memory_ALU = (LD, LDR, LDI, LEA, ST, STR, STI => AND, ADD, NOT);
		bins Control_ALU = (BR, JMP => AND, ADD, NOT);
		bins Memory_Control = (LD, LDR, LDI, LEA, ST, STR, STI => BR, JMP );
	}
	Cov_mem_opcode_temp : coverpoint coverage_trans.Instr_dout[15:12]
	{
		bins LD_b  = {LD };
		bins LDR_b = {LDR};
		bins LDI_b = {LDI};
		bins LEA_b = {LEA};
		bins ST_b  = {ST };
		bins STR_b = {STR};
		bins STI_b = {STI};
	}
	Cov_alu_opcode_temp : coverpoint coverage_trans.Instr_dout[15:12]
	{
		bins ADD_b = {ADD};
		bins AND_b = {AND};
		bins NOT_b = {NOT};
	}
	Cov_ctrl_opcode_temp : coverpoint coverage_trans.Instr_dout[15:12]
	{
		bins BR_b  = {BR};
		bins JMP_b = {JMP};
	}
	//new coverpoints
	/*Cov_alu_imm_nonimm : coverpoint coverage_trans.Instr_dout[5] iff(coverage_trans.Instr_dout[15:12] == {ADD , AND} && (prev_instr[15:12] == {AND, ADD}) && (prev_instr[5]) == 1)
	{
		bins imm_nonimm = {0, 1};
	}*/
	//Xc_cov_inst : cross Cov_mem_opcode_temp,Cov_alu_opcode_temp,Cov_ctrl_opcode_temp;
endgroup

// ****************************************************************************
  // FUNCTION: new
  function new(string name, uvm_component parent);
     super.new(name,parent);
    imem_coverage_cg=new;
    CTRL_OPR_cg=new;
	ALU_OPR_cg=new;
	OPR_SEQ_cg=new;
	MEM_OPR_cg=new;
    `uvm_warning("COVERAGE_MODEL_REVIEW", "A covergroup has been constructed which may need review because of either generation or re-generation with merging.  Remove this warning after the covergroup has been reviewed.")
  // pragma uvmf custom new begin
  // pragma uvmf custom new end
  endfunction

// ****************************************************************************
  // FUNCTION: build_phase
  virtual function void build_phase (uvm_phase phase);

    imem_coverage_cg.set_inst_name($sformatf("imem_coverage_cg_%s",get_full_name()));
    CTRL_OPR_cg.set_inst_name($sformatf("CTRL_OPR_cg_%s",get_full_name()));
	ALU_OPR_cg.set_inst_name($sformatf("ALU_OPR_cg_%s",get_full_name()));
	OPR_SEQ_cg.set_inst_name($sformatf("OPR_SEQ_cg_%s",get_full_name()));
	MEM_OPR_cg.set_inst_name($sformatf("MEM_OPR_cg_%s",get_full_name()));
    imem_cov_analysis_export = new("imem_cov_analysis_export", this);
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // ****************************************************************************
  // FUNCTION: write_imem_cov_analysis_export
  // Transactions received through imem_cov_analysis_export initiate the execution of this function.
  // This function collects functional coverage on variables within the received transaction
  virtual function void write_imem_cov_analysis_export(imem_transaction t);
    // pragma uvmf custom imem_cov_analysis_export_coverage begin
    `uvm_info("COV", "Transaction Received through imem_cov_analysis_export", UVM_MEDIUM)
    `uvm_info("COV", {"            Data: ",t.convert2string()}, UVM_FULL)

    //  UVMF_CHANGE_ME: Add functional coverage to this component to implement coverage model.  
    //`uvm_info("UNIMPLEMENTED_COVERAGE_MODEL", "******************************************************************************************************",UVM_NONE)
   // `uvm_info("UNIMPLEMENTED_COVERAGE_MODEL", "UVMF_CHANGE_ME: This component needs to be completed with coverage model",UVM_NONE)
    //`uvm_info("UNIMPLEMENTED_COVERAGE_MODEL", "******************************************************************************************************",UVM_NONE)
    // pragma uvmf custom imem_cov_analysis_export_coverage end
    
    coverage_trans = t;
    /*
    pc = t.PC;
    coverage_trans.Instr_dout = t.coverage_trans.Instr_dout;
    opcode = t.opcode;
    dr = t.dr;
    sr1 = t.sr1;
    sr2 = t.sr2;
    baser = t.baser;
    imm5 = t.imm5;
    pcoffset6 = t.pcoffset6;
    nzp = t.nzp;
    pcoffset9 = t.pcoffset9;
    complete_instr = t.complete_instr;
    instrmem_rd = t.instrmem_rd;*/
    ALU_OPR_cg.sample();
    MEM_OPR_cg.sample();
    OPR_SEQ_cg.sample();
    CTRL_OPR_cg.sample();
    imem_coverage_cg.sample();
  endfunction

endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

