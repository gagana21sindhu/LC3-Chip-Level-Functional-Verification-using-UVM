//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class defines the variables required for an execute_in
//    transaction.  Class variables to be displayed in waveform transaction
//    viewing are added to the transaction viewing stream in the add_to_wave
//    function.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class execute_in_transaction  extends uvmf_transaction_base;

  `uvm_object_utils( execute_in_transaction )

  bit [15:0] npc_in ;
  op_t opcode ;
  reg_t sr1 ;
  reg_t sr2 ;
  reg_t dr ;
  baser_t baser ;
  pcoffset9_t pcoffset9 ;
  pcoffset6_t pcoffset6 ;
  imm5_t imm5 ;
  n_t n ;
  z_t z ;
  p_t p ;
  bit [15:0] instruction ;
  bit [5:0] E_control ;
  bit [15:0] IR ;
  bypass_alu_1_t bypass_alu_1 ;
  bypass_alu_2_t bypass_alu_2 ;
  bypass_mem_1_t bypass_mem_1 ;
  bypass_mem_2_t bypass_mem_2 ;
  bit [15:0] VSR1 ;
  bit [15:0] VSR2 ;
  bit [1:0] W_control_in ;
  bit [1:0] Mem_control_in ;
  bit enable_execute ;
  bit [15:0] Mem_bypass_val ;
  bit is_immediate ;

  //Constraints for the transaction variables:

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  //*******************************************************************
  //*******************************************************************
  // Macros that define structs and associated functions are
  // located in execute_in_macros.svh

  //*******************************************************************
  // Monitor macro used by execute_in_monitor and execute_in_monitor_bfm
  // This struct is defined in execute_in_macros.svh
  `execute_in_MONITOR_STRUCT
    execute_in_monitor_s execute_in_monitor_struct;
  //*******************************************************************
  // FUNCTION: to_monitor_struct()
  // This function packs transaction variables into a execute_in_monitor_s
  // structure.  The function returns the handle to the execute_in_monitor_struct.
  // This function is defined in execute_in_macros.svh
  `execute_in_TO_MONITOR_STRUCT_FUNCTION 
  //*******************************************************************
  // FUNCTION: from_monitor_struct()
  // This function unpacks the struct provided as an argument into transaction 
  // variables of this class.
  // This function is defined in execute_in_macros.svh
  `execute_in_FROM_MONITOR_STRUCT_FUNCTION 

  //*******************************************************************
  // Initiator macro used by execute_in_driver and execute_in_driver_bfm
  // to communicate initiator driven data to execute_in_driver_bfm.
  // This struct is defined in execute_in_macros.svh
  `execute_in_INITIATOR_STRUCT
    execute_in_initiator_s execute_in_initiator_struct;
  //*******************************************************************
  // FUNCTION: to_initiator_struct()
  // This function packs transaction variables into a execute_in_initiator_s
  // structure.  The function returns the handle to the execute_in_initiator_struct.
  // This function is defined in execute_in_macros.svh
  `execute_in_TO_INITIATOR_STRUCT_FUNCTION  
  //*******************************************************************
  // FUNCTION: from_initiator_struct()
  // This function unpacks the struct provided as an argument into transaction 
  // variables of this class.
  // This function is defined in execute_in_macros.svh
  `execute_in_FROM_INITIATOR_STRUCT_FUNCTION 

  //*******************************************************************
  // Responder macro used by execute_in_driver and execute_in_driver_bfm
  // to communicate Responder driven data to execute_in_driver_bfm.
  // This struct is defined in execute_in_macros.svh
  `execute_in_RESPONDER_STRUCT
    execute_in_responder_s execute_in_responder_struct;
  //*******************************************************************
  // FUNCTION: to_responder_struct()
  // This function packs transaction variables into a execute_in_responder_s
  // structure.  The function returns the handle to the execute_in_responder_struct.
  // This function is defined in execute_in_macros.svh
  `execute_in_TO_RESPONDER_STRUCT_FUNCTION 
  //*******************************************************************
  // FUNCTION: from_responder_struct()
  // This function unpacks the struct provided as an argument into transaction 
  // variables of this class.
  // This function is defined in execute_in_macros.svh
  `execute_in_FROM_RESPONDER_STRUCT_FUNCTION 
  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new( string name = "" );
    super.new( name );
  endfunction

  // ****************************************************************************
  // FUNCTION: convert2string()
  // This function converts all variables in this class to a single string for 
  // logfile reporting.
  //
  virtual function string convert2string();
    // pragma uvmf custom convert2string begin
    // UVMF_CHANGE_ME : Customize format if desired.
    return $sformatf("npc_in:0x%x opcode:0x%x sr1:0x%x sr2:0x%x dr:0x%x baser:0x%x pcoffset9:0x%x pcoffset6:0x%x imm5:0x%x n:0x%x z:0x%x p:0x%x instruction:0x%x E_control:0x%x IR:0x%x bypass_alu_1:0x%x bypass_alu_2:0x%x bypass_mem_1:0x%x bypass_mem_2:0x%x VSR1:0x%x VSR2:0x%x W_control_in:0x%x Mem_control_in:0x%x enable_execute:0x%x Mem_bypass_val:0x%x is_immediate:0x%x ",npc_in,opcode,sr1,sr2,dr,baser,pcoffset9,pcoffset6,imm5,n,z,p,instruction,E_control,IR,bypass_alu_1,bypass_alu_2,bypass_mem_1,bypass_mem_2,VSR1,VSR2,W_control_in,Mem_control_in,enable_execute,Mem_bypass_val,is_immediate);
    // pragma uvmf custom convert2string end
  endfunction

  //*******************************************************************
  // FUNCTION: do_print()
  // This function is automatically called when the .print() function
  // is called on this class.
  //
  virtual function void do_print(uvm_printer printer);
    // pragma uvmf custom do_print begin
    // UVMF_CHANGE_ME : Current contents of do_print allows for the use of UVM 1.1d, 1.2 or P1800.2.
    // Update based on your own printing preference according to your preferred UVM version
    $display(convert2string());
    // pragma uvmf custom do_print end
  endfunction

  //*******************************************************************
  // FUNCTION: do_compare()
  // This function is automatically called when the .compare() function
  // is called on this class.
  //
  virtual function bit do_compare (uvm_object rhs, uvm_comparer comparer);
    execute_in_transaction  RHS;
    if (!$cast(RHS,rhs)) return 0;
    // pragma uvmf custom do_compare begin
    // UVMF_CHANGE_ME : Eliminate comparison of variables not to be used for compare
    return (super.do_compare(rhs,comparer)
            &&(this.npc_in == RHS.npc_in)
            &&(this.instruction == RHS.instruction)
            &&(this.E_control == RHS.E_control)
            &&(this.IR == RHS.IR)
            &&(this.bypass_alu_1 == RHS.bypass_alu_1)
            &&(this.bypass_alu_2 == RHS.bypass_alu_2)
            &&(this.bypass_mem_1 == RHS.bypass_mem_1)
            &&(this.bypass_mem_2 == RHS.bypass_mem_2)
            &&(this.VSR1 == RHS.VSR1)
            &&(this.VSR2 == RHS.VSR2)
            &&(this.W_control_in == RHS.W_control_in)
            &&(this.Mem_control_in == RHS.Mem_control_in)
            &&(this.enable_execute == RHS.enable_execute)
            &&(this.Mem_bypass_val == RHS.Mem_bypass_val)
            );
    // pragma uvmf custom do_compare end
  endfunction

  //*******************************************************************
  // FUNCTION: do_copy()
  // This function is automatically called when the .copy() function
  // is called on this class.
  //
  virtual function void do_copy (uvm_object rhs);
    execute_in_transaction  RHS;
    if(!$cast(RHS,rhs))begin
      `uvm_fatal("CAST","Transaction cast in do_copy() failed!")
    end
    // pragma uvmf custom do_copy begin
    super.do_copy(rhs);
    this.npc_in = RHS.npc_in;
    this.opcode = RHS.opcode;
    this.sr1 = RHS.sr1;
    this.sr2 = RHS.sr2;
    this.dr = RHS.dr;
    this.baser = RHS.baser;
    this.pcoffset9 = RHS.pcoffset9;
    this.pcoffset6 = RHS.pcoffset6;
    this.imm5 = RHS.imm5;
    this.n = RHS.n;
    this.z = RHS.z;
    this.p = RHS.p;
    this.instruction = RHS.instruction;
    this.E_control = RHS.E_control;
    this.IR = RHS.IR;
    this.bypass_alu_1 = RHS.bypass_alu_1;
    this.bypass_alu_2 = RHS.bypass_alu_2;
    this.bypass_mem_1 = RHS.bypass_mem_1;
    this.bypass_mem_2 = RHS.bypass_mem_2;
    this.VSR1 = RHS.VSR1;
    this.VSR2 = RHS.VSR2;
    this.W_control_in = RHS.W_control_in;
    this.Mem_control_in = RHS.Mem_control_in;
    this.enable_execute = RHS.enable_execute;
    this.Mem_bypass_val = RHS.Mem_bypass_val;
    this.is_immediate = RHS.is_immediate;
    // pragma uvmf custom do_copy end
  endfunction

  // ****************************************************************************
  // FUNCTION: add_to_wave()
  // This function is used to display variables in this class in the waveform 
  // viewer.  The start_time and end_time variables must be set before this 
  // function is called.  If the start_time and end_time variables are not set
  // the transaction will be hidden at 0ns on the waveform display.
  // 
  virtual function void add_to_wave(int transaction_viewing_stream_h);
    `ifdef QUESTA
    if (transaction_view_h == 0) begin
      transaction_view_h = $begin_transaction(transaction_viewing_stream_h,"execute_in_transaction",start_time);
    end
    super.add_to_wave(transaction_view_h);
    // pragma uvmf custom add_to_wave begin
    // UVMF_CHANGE_ME : Color can be applied to transaction entries based on content, example below
    // case()
    //   1 : $add_color(transaction_view_h,"red");
    //   default : $add_color(transaction_view_h,"grey");
    // endcase
    // UVMF_CHANGE_ME : Eliminate transaction variables not wanted in transaction viewing in the waveform viewer
    $add_attribute(transaction_view_h,npc_in,"npc_in");
    $add_attribute(transaction_view_h,opcode,"opcode");
    $add_attribute(transaction_view_h,sr1,"sr1");
    $add_attribute(transaction_view_h,sr2,"sr2");
    $add_attribute(transaction_view_h,dr,"dr");
    $add_attribute(transaction_view_h,baser,"baser");
    $add_attribute(transaction_view_h,pcoffset9,"pcoffset9");
    $add_attribute(transaction_view_h,pcoffset6,"pcoffset6");
    $add_attribute(transaction_view_h,imm5,"imm5");
    $add_attribute(transaction_view_h,n,"n");
    $add_attribute(transaction_view_h,z,"z");
    $add_attribute(transaction_view_h,p,"p");
    $add_attribute(transaction_view_h,instruction,"instruction");
    $add_attribute(transaction_view_h,E_control,"E_control");
    $add_attribute(transaction_view_h,IR,"IR");
    $add_attribute(transaction_view_h,bypass_alu_1,"bypass_alu_1");
    $add_attribute(transaction_view_h,bypass_alu_2,"bypass_alu_2");
    $add_attribute(transaction_view_h,bypass_mem_1,"bypass_mem_1");
    $add_attribute(transaction_view_h,bypass_mem_2,"bypass_mem_2");
    $add_attribute(transaction_view_h,VSR1,"VSR1");
    $add_attribute(transaction_view_h,VSR2,"VSR2");
    $add_attribute(transaction_view_h,W_control_in,"W_control_in");
    $add_attribute(transaction_view_h,Mem_control_in,"Mem_control_in");
    $add_attribute(transaction_view_h,enable_execute,"enable_execute");
    $add_attribute(transaction_view_h,Mem_bypass_val,"Mem_bypass_val");
    $add_attribute(transaction_view_h,is_immediate,"is_immediate");
    // pragma uvmf custom add_to_wave end
    $end_transaction(transaction_view_h,end_time);
    $free_transaction(transaction_view_h);
    `endif // QUESTA
  endfunction

  
  function void post_randomize();
		W_control_in = 0;
		Mem_control_in=0;
		//IR[15:12]=opcode;
		case (opcode)
			BR: 	begin 
						IR[15:0] = {BR,n,z,p,pcoffset9};
						E_control = 6'b000110;
					end
			JMP: 	begin
						IR[15:0] = {JMP,3'b000,baser,6'b000000};
						E_control = 6'b001100;
					end
			LD: 	begin 
						IR[15:0] = {LD,dr,pcoffset9};
						W_control_in = 1;
						E_control = 6'b000110;
					end
					
			LDR:	begin 
						IR[15:0] = {LDR,dr,baser,pcoffset6};
						W_control_in = 1;
						E_control = 6'b001000;
					end
			LDI: 	begin 
						IR[15:0] = {LDI,dr,pcoffset9};
						W_control_in=1;
						E_control = 6'b000110;
						Mem_control_in=1;
					end
			LEA: 	begin 
						IR[15:0] = {LEA,dr,pcoffset9};
						W_control_in=2;
						E_control = 6'b000110;
					end
			ST: 	begin 
						IR[15:0] = {ST,sr1,pcoffset9};
						E_control = 6'b000110;
					end
			STI: 	begin 
						IR[15:0] = {STI,sr1,pcoffset9};
						E_control = 6'b000110;
						Mem_control_in=1;
					end
			STR: 	begin 
						IR[15:0] = {STR,sr1,baser,pcoffset6};
						E_control = 6'b001000;
					end
			NOT: 	begin 
						IR[15:0] = {NOT,dr,sr1,6'b111111};
						E_control = 6'b100000;
					end
			ADD: 	begin
						if(is_immediate) begin
							IR[15:0] = {ADD,dr,sr1,1'b1,imm5};
							E_control = 6'b000000;
						end
						else begin
							IR[15:0] = {ADD,dr,sr1,3'b000,sr2};
							E_control = 6'b000001;
						end
					end
			AND: 	begin
						if(is_immediate) begin
							IR[15:0] = {AND,dr,sr1,1'b1,imm5};
							E_control = 6'b010000;
						end
						else begin
							IR[15:0] = {AND,dr,sr1,3'b000,sr2};
							E_control = 6'b010001;
						end
					end
			default: 	if(is_immediate)
							IR[15:0] = {AND,dr,sr1,1'b1,imm5};
						else
							IR[15:0] = {AND,dr,sr1,3'b000,sr2};
		endcase
	endfunction
 
 
endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

