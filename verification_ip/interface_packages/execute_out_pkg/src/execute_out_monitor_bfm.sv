//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface performs the execute_out signal monitoring.
//      It is accessed by the uvm execute_out monitor through a virtual
//      interface handle in the execute_out configuration.  It monitors the
//      signals passed in through the port connection named bus of
//      type execute_out_if.
//
//     Input signals from the execute_out_if are assigned to an internal input
//     signal with a _i suffix.  The _i signal should be used for sampling.
//
//     The input signal connections are as follows:
//       bus.signal -> signal_i 
//
//      Interface functions and tasks used by UVM components:
//             monitor(inout TRANS_T txn);
//                   This task receives the transaction, txn, from the
//                   UVM monitor and then populates variables in txn
//                   from values observed on bus activity.  This task
//                   blocks until an operation on the execute_out bus is complete.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import execute_out_pkg_hdl::*;
`include "src/execute_out_macros.svh"


interface execute_out_monitor_bfm 
  ( execute_out_if  bus );
  // The pragma below and additional ones in-lined further down are for running this BFM on Veloce
  // pragma attribute execute_out_monitor_bfm partition_interface_xif                                  

`ifndef XRTL
// This code is to aid in debugging parameter mismatches between the BFM and its corresponding agent.
// Enable this debug by setting UVM_VERBOSITY to UVM_DEBUG
// Setting UVM_VERBOSITY to UVM_DEBUG causes all BFM's and all agents to display their parameter settings.
// All of the messages from this feature have a UVM messaging id value of "CFG"
// The transcript or run.log can be parsed to ensure BFM parameter settings match its corresponding agents parameter settings.
import uvm_pkg::*;
`include "uvm_macros.svh"
initial begin : bfm_vs_agent_parameter_debug
  `uvm_info("CFG", 
      $psprintf("The BFM at '%m' has the following parameters: ", ),
      UVM_DEBUG)
end
`endif


  // Structure used to pass transaction data from monitor BFM to monitor class in agent.
`execute_out_MONITOR_STRUCT
  execute_out_monitor_s execute_out_monitor_struct;

  // Structure used to pass configuration data from monitor class to monitor BFM.
 `execute_out_CONFIGURATION_STRUCT
 

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  tri clock_i;
  tri reset_i;
  tri  enable_execute_i;
  tri [15:0] IR_exec_i;
  tri [15:0] aluout_i;
  tri [1:0] W_control_out_i;
  tri  Mem_control_out_i;
  tri [15:0] pcout_i;
  tri [2:0] sr1_i;
  tri [2:0] sr2_i;
  tri [2:0] dr_i;
  tri [2:0] NZP_i;
  tri [15:0] M_data_i;
  assign clock_i = bus.clock;
  assign reset_i = bus.reset;
  assign enable_execute_i = bus.enable_execute;
  assign IR_exec_i = bus.IR_exec;
  assign aluout_i = bus.aluout;
  assign W_control_out_i = bus.W_control_out;
  assign Mem_control_out_i = bus.Mem_control_out;
  assign pcout_i = bus.pcout;
  assign sr1_i = bus.sr1;
  assign sr2_i = bus.sr2;
  assign dr_i = bus.dr;
  assign NZP_i = bus.NZP;
  assign M_data_i = bus.M_data;

  // Proxy handle to UVM monitor
  execute_out_pkg::execute_out_monitor  proxy;
  // pragma tbx oneway proxy.notify_transaction   


  reg enable_execute_delayed;
  reg [2:0] sr1_delayed;
  reg [2:0] sr2_delayed;
  
  initial begin
	forever begin
		@(posedge clock_i)
		//enable_execute_delayed<=enable_execute_i;
		sr1_delayed<=sr1_i;
		sr2_delayed<=sr2_i;		
	end
  end  

  // pragma uvmf custom interface_item_additional begin
  // pragma uvmf custom interface_item_additional end
  
  //******************************************************************                         
  task wait_for_reset();// pragma tbx xtf  
    @(posedge clock_i) ;                                                                    
    do_wait_for_reset();                                                                   
  endtask                                                                                   

  // ****************************************************************************              
  task do_wait_for_reset(); 
  // pragma uvmf custom reset_condition begin
    wait ( reset_i === 0 ) ;                                                              
    @(posedge clock_i) ;                                                                    
  // pragma uvmf custom reset_condition end                                                                
  endtask    

  //******************************************************************                         
 
  task wait_for_num_clocks(input int unsigned count); // pragma tbx xtf 
    @(posedge clock_i);  
                                                                   
    repeat (count-1) @(posedge clock_i);                                                    
  endtask      

  //******************************************************************                         
  event go;                                                                                 
  function void start_monitoring();// pragma tbx xtf    
    -> go;
  endfunction                                                                               
  
  // ****************************************************************************              
  initial begin                                                                             
    @go;  
	@(negedge reset_i);	
	@(posedge clock_i);
    forever begin 
	  @(posedge clock_i) begin
      do_monitor( execute_out_monitor_struct );
                                                                 
 
      if (  (execute_out_monitor_struct.IR_exec != 0) ||
            (execute_out_monitor_struct.aluout != 0) ||
            (execute_out_monitor_struct.sr2 != 0) ||
            (execute_out_monitor_struct.Mem_control_out != 0) ||
            (execute_out_monitor_struct.W_control_out != 0) ||
            (execute_out_monitor_struct.sr1 != 0) ||
            (execute_out_monitor_struct.dr != 0) ||
            (execute_out_monitor_struct.pcout != 0) ||
            (execute_out_monitor_struct.nzp != 0) ||
            (execute_out_monitor_struct.M_data != 0))
		begin
			proxy.notify_transaction( execute_out_monitor_struct );
		end end
			
    end                                                                                    
  end                                                                                       

  //******************************************************************
  // The configure() function is used to pass agent configuration
  // variables to the monitor BFM.  It is called by the monitor within
  // the agent at the beginning of the simulation.  It may be called 
  // during the simulation if agent configuration variables are updated
  // and the monitor BFM needs to be aware of the new configuration 
  // variables.
  //
    function void configure(execute_out_configuration_s execute_out_configuration_arg); // pragma tbx xtf  
    initiator_responder = execute_out_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction   


  // ****************************************************************************  
            
  task do_monitor(output execute_out_monitor_s execute_out_monitor_struct);
    //
    // Available struct members:
    //     //    execute_out_monitor_struct.IR_exec
    //     //    execute_out_monitor_struct.M_data
    //     //    execute_out_monitor_struct.nzp
    //     //    execute_out_monitor_struct.W_control_out
    //     //    execute_out_monitor_struct.Mem_control_out
    //     //    execute_out_monitor_struct.sr1
    //     //    execute_out_monitor_struct.sr2
    //     //    execute_out_monitor_struct.dr
    //     //    execute_out_monitor_struct.aluout
    //     //    execute_out_monitor_struct.pcout
    //     //
    // Reference code;
    //    How to wait for signal value
    //      while (control_signal === 1'b1) @(posedge clock_i);
    //    
    //    How to assign a struct member, named xyz, from a signal.   
    //    All available input signals listed.
    //      execute_out_monitor_struct.xyz = enable_execute_i;  //     
    //      execute_out_monitor_struct.xyz = IR_exec_i;  //    [15:0] 
    //      execute_out_monitor_struct.xyz = aluout_i;  //    [15:0] 
    //      execute_out_monitor_struct.xyz = W_control_out_i;  //    [1:0] 
    //      execute_out_monitor_struct.xyz = Mem_control_out_i;  //     
    //      execute_out_monitor_struct.xyz = pcout_i;  //    [15:0] 
    //      execute_out_monitor_struct.xyz = sr1_i;  //    [2:0] 
    //      execute_out_monitor_struct.xyz = sr2_i;  //    [2:0] 
    //      execute_out_monitor_struct.xyz = dr_i;  //    [2:0] 
    //      execute_out_monitor_struct.xyz = NZP_i;  //    [2:0] 
    //      execute_out_monitor_struct.xyz = M_data_i;  //    [15:0] 
    // pragma uvmf custom do_monitor begin

	while (enable_execute_i == 1'b0) @(posedge clock_i);
    //while ((reset_i==1'b1) || (enable_execute_i === 1'b0)) @(posedge clock_i);
		execute_out_monitor_struct.IR_exec=IR_exec_i;
		execute_out_monitor_struct.aluout=aluout_i;
		execute_out_monitor_struct.W_control_out=W_control_out_i;
		execute_out_monitor_struct.Mem_control_out=Mem_control_out_i;
		//execute_out_monitor_struct.sr1=sr1_i;
		execute_out_monitor_struct.sr1=sr1_delayed;
		//execute_out_monitor_struct.sr2=sr2_i;
		execute_out_monitor_struct.sr2=sr2_delayed;
		execute_out_monitor_struct.dr=dr_i;
		execute_out_monitor_struct.pcout=pcout_i;
		execute_out_monitor_struct.nzp=NZP_i;
		execute_out_monitor_struct.M_data=M_data_i;
	
    // pragma uvmf custom do_monitor end
  endtask         
  
 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

