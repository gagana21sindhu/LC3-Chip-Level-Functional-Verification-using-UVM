//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//
// DESCRIPTION: This analysis component contains analysis_exports for receiving
//   data and analysis_ports for sending data.
// 
//   This analysis component has the following analysis_exports that receive the 
//   listed transaction type.
//   
//   analysis_export receives transactions of type  execute_in_transaction
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//  analysis_port broadcasts transactions of type execute_out_transaction
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class execute_predictor #(
  type CONFIG_T,
  type BASE_T = uvm_component
  ) extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( execute_predictor #(
                              CONFIG_T,
                              BASE_T
                              ))


  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;
  bit temp;

  
  // Instantiate the analysis exports
  uvm_analysis_imp_analysis_export #(execute_in_transaction, execute_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) analysis_export;

  
  // Instantiate the analysis ports
  uvm_analysis_port #(execute_out_transaction) analysis_port;


  // Transaction variable for predicted values to be sent out analysis_port
  // Once a transaction is sent through an analysis_port, another transaction should
  // be constructed for the next predicted transaction. 
  typedef execute_out_transaction analysis_port_output_transaction_t;
  analysis_port_output_transaction_t analysis_port_output_transaction;
  // Code for sending output transaction out through analysis_port
  // analysis_port.write(analysis_port_output_transaction);

  // Define transaction handles for debug visibility 
  execute_in_transaction analysis_export_debug;


  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // FUNCTION: new
  function new(string name, uvm_component parent);
     super.new(name,parent);
    //`uvm_warning("PREDICTOR_REVIEW", "This predictor has been created either through generation or re-generation with merging.  Remove this warning after the predictor has been reviewed.")
  // pragma uvmf custom new begin
  // pragma uvmf custom new end
  endfunction

  // FUNCTION: build_phase
  virtual function void build_phase (uvm_phase phase);

    analysis_export = new("analysis_export", this);
    analysis_port =new("analysis_port", this );
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // FUNCTION: write_analysis_export
  // Transactions received through analysis_export initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_analysis_export(execute_in_transaction t);
    // pragma uvmf custom analysis_export_predictor begin
    analysis_export_debug = t;
    `uvm_info("PRED", "Transaction Received through analysis_export", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    analysis_port_output_transaction = analysis_port_output_transaction_t::type_id::create("analysis_port_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here. 

	
	temp = 				execute_model(t.E_control,
									  t.bypass_alu_1,
									  t.bypass_alu_2,
									  t.bypass_mem_1,
									  t.bypass_mem_2,
									  t.enable_execute,
									  t.IR,
									  t.npc_in,
									  t.Mem_control_in,
									  t.W_control_in,
									  t.Mem_bypass_val,
									  t.VSR1,
									  t.VSR2,
									  analysis_port_output_transaction.aluout,
									  analysis_port_output_transaction.W_control_out,
									  analysis_port_output_transaction.Mem_control_out,
									  analysis_port_output_transaction.M_data,
									  analysis_port_output_transaction.dr,
									  analysis_port_output_transaction.sr1,
									  analysis_port_output_transaction.sr2,
									  analysis_port_output_transaction.IR_exec,
									  analysis_port_output_transaction.nzp,
									  analysis_port_output_transaction.pcout);
	
	
    // Code for sending output transaction out through analysis_port
	if(!temp) begin
		analysis_port.write(analysis_port_output_transaction);
	end
    // pragma uvmf custom analysis_export_predictor end
  endfunction


endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

