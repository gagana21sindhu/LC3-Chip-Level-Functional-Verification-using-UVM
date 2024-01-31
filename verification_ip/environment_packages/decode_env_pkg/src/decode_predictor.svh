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
//   d_analysis_export receives transactions of type  decode_in_transaction
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//  d_analysis_port broadcasts transactions of type decode_out_transaction
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class decode_predictor #(
  type CONFIG_T,
  type BASE_T = uvm_component
  ) extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( decode_predictor #(
                              CONFIG_T,
                              BASE_T
                              ))


  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;
	  bit temp;
  
  // Instantiate the analysis exports
  uvm_analysis_imp_d_analysis_export #(decode_in_transaction, decode_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) d_analysis_export;

  
  // Instantiate the analysis ports
  uvm_analysis_port #(decode_out_transaction) d_analysis_port;


  // Transaction variable for predicted values to be sent out d_analysis_port
  // Once a transaction is sent through an analysis_port, another transaction should
  // be constructed for the next predicted transaction. 
  typedef decode_out_transaction d_analysis_port_output_transaction_t;
  d_analysis_port_output_transaction_t d_analysis_port_output_transaction;
  // Code for sending output transaction out through d_analysis_port
  // d_analysis_port.write(d_analysis_port_output_transaction);

  // Define transaction handles for debug visibility 
  decode_in_transaction d_analysis_export_debug;


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

    d_analysis_export = new("d_analysis_export", this);
    d_analysis_port =new("d_analysis_port", this );
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // FUNCTION: write_d_analysis_export
  // Transactions received through d_analysis_export initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_d_analysis_export(decode_in_transaction t);
    // pragma uvmf custom d_analysis_export_predictor begin
    d_analysis_export_debug = t;
    `uvm_info("PRED", "Transaction Received through d_analysis_export", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    d_analysis_port_output_transaction = d_analysis_port_output_transaction_t::type_id::create("d_analysis_port_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here.  
    temp = decode_model(t.instr_dout,						//calls the decode_model of lc3_prediction_model
						t.npc_in,
						d_analysis_port_output_transaction.IR,
						d_analysis_port_output_transaction.npc_out,
						d_analysis_port_output_transaction.E_control,
						d_analysis_port_output_transaction.W_control,
            			d_analysis_port_output_transaction.mem_control);
    // Code for sending output transaction out through d_analysis_port
	if(!temp) begin
		d_analysis_port.write(d_analysis_port_output_transaction);
	end
    // pragma uvmf custom d_analysis_export_predictor end
  endfunction


endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

