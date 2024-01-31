//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the execute_out interface signals.
//      It is instantiated once per execute_out bus.  Bus Functional Models, 
//      BFM's named execute_out_driver_bfm, are used to drive signals on the bus.
//      BFM's named execute_out_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(execute_out_bus.enable_execute), // Agent output 
// .dut_signal_port(execute_out_bus.IR_exec), // Agent output 
// .dut_signal_port(execute_out_bus.aluout), // Agent output 
// .dut_signal_port(execute_out_bus.W_control_out), // Agent output 
// .dut_signal_port(execute_out_bus.Mem_control_out), // Agent output 
// .dut_signal_port(execute_out_bus.pcout), // Agent output 
// .dut_signal_port(execute_out_bus.sr1), // Agent output 
// .dut_signal_port(execute_out_bus.sr2), // Agent output 
// .dut_signal_port(execute_out_bus.dr), // Agent output 
// .dut_signal_port(execute_out_bus.NZP), // Agent output 
// .dut_signal_port(execute_out_bus.M_data), // Agent output 

import uvmf_base_pkg_hdl::*;
import execute_out_pkg_hdl::*;

interface  execute_out_if 

  (
  input tri clock, 
  input tri reset,
  inout tri  enable_execute,
  inout tri [15:0] IR_exec,
  inout tri [15:0] aluout,
  inout tri [1:0] W_control_out,
  inout tri  Mem_control_out,
  inout tri [15:0] pcout,
  inout tri [2:0] sr1,
  inout tri [2:0] sr2,
  inout tri [2:0] dr,
  inout tri [2:0] NZP,
  inout tri [15:0] M_data
  );

modport monitor_port 
  (
  input clock,
  input reset,
  input enable_execute,
  input IR_exec,
  input aluout,
  input W_control_out,
  input Mem_control_out,
  input pcout,
  input sr1,
  input sr2,
  input dr,
  input NZP,
  input M_data
  );

modport initiator_port 
  (
  input clock,
  input reset,
  output enable_execute,
  output IR_exec,
  output aluout,
  output W_control_out,
  output Mem_control_out,
  output pcout,
  output sr1,
  output sr2,
  output dr,
  output NZP,
  output M_data
  );

modport responder_port 
  (
  input clock,
  input reset,  
  input enable_execute,
  input IR_exec,
  input aluout,
  input W_control_out,
  input Mem_control_out,
  input pcout,
  input sr1,
  input sr2,
  input dr,
  input NZP,
  input M_data
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

