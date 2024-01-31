//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the execute_out package.
//   These macros include packed struct definitions.  These structs are
//   used to pass data between classes, hvl, and BFM's, hdl.  Use of 
//   structs are more efficient and simpler to modify.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_struct
//      and from_struct methods defined in the macros below that are used in  
//      the execute_out_configuration class.
//
  `define execute_out_CONFIGURATION_STRUCT \
typedef struct packed  { \
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } execute_out_configuration_s;

  `define execute_out_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function execute_out_configuration_s to_struct();\
    execute_out_configuration_struct = \
       {\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( execute_out_configuration_struct );\
  endfunction

  `define execute_out_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(execute_out_configuration_s execute_out_configuration_struct);\
      {\
      this.active_passive,\
      this.initiator_responder  \
      } = execute_out_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the execute_out_transaction class.
//
  `define execute_out_MONITOR_STRUCT typedef struct packed  { \
  ir_t _IR_exec ; \
  M_data_t _M_data ; \
  bit [2:0] _nzp ; \
  W_control_out_t _W_control_out ; \
  Mem_control_out_t _Mem_control_out ; \
  bit [2:0] _sr1 ; \
  bit [2:0] _sr2 ; \
  bit [2:0] _dr ; \
  bit [2:0] _aluout ; \
  bit [15:0] _pcout ; \
     } execute_out_monitor_s;

  `define execute_out_TO_MONITOR_STRUCT_FUNCTION \
  virtual function execute_out_monitor_s to_monitor_struct();\
    execute_out_monitor_struct = \
            { \
            this._IR_exec , \
            this._M_data , \
            this._nzp , \
            this._W_control_out , \
            this._Mem_control_out , \
            this._sr1 , \
            this._sr2 , \
            this._dr , \
            this._aluout , \
            this._pcout  \
            };\
    return ( execute_out_monitor_struct);\
  endfunction\

  `define execute_out_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(execute_out_monitor_s execute_out_monitor_struct);\
            {\
            this._IR_exec , \
            this._M_data , \
            this._nzp , \
            this._W_control_out , \
            this._Mem_control_out , \
            this._sr1 , \
            this._sr2 , \
            this._dr , \
            this._aluout , \
            this._pcout  \
            } = execute_out_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the execute_out_transaction class.
//      Also update the comments in the driver BFM.
//
  `define execute_out_INITIATOR_STRUCT typedef struct packed  { \
  ir_t _IR_exec ; \
  M_data_t _M_data ; \
  bit [2:0] _nzp ; \
  W_control_out_t _W_control_out ; \
  Mem_control_out_t _Mem_control_out ; \
  bit [2:0] _sr1 ; \
  bit [2:0] _sr2 ; \
  bit [2:0] _dr ; \
  bit [2:0] _aluout ; \
  bit [15:0] _pcout ; \
     } execute_out_initiator_s;

  `define execute_out_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function execute_out_initiator_s to_initiator_struct();\
    execute_out_initiator_struct = \
           {\
           this._IR_exec , \
           this._M_data , \
           this._nzp , \
           this._W_control_out , \
           this._Mem_control_out , \
           this._sr1 , \
           this._sr2 , \
           this._dr , \
           this._aluout , \
           this._pcout  \
           };\
    return ( execute_out_initiator_struct);\
  endfunction

  `define execute_out_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(execute_out_initiator_s execute_out_initiator_struct);\
           {\
           this._IR_exec , \
           this._M_data , \
           this._nzp , \
           this._W_control_out , \
           this._Mem_control_out , \
           this._sr1 , \
           this._sr2 , \
           this._dr , \
           this._aluout , \
           this._pcout  \
           } = execute_out_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the execute_out_transaction class.
//      Also update the comments in the driver BFM.
//
  `define execute_out_RESPONDER_STRUCT typedef struct packed  { \
  ir_t _IR_exec ; \
  M_data_t _M_data ; \
  bit [2:0] _nzp ; \
  W_control_out_t _W_control_out ; \
  Mem_control_out_t _Mem_control_out ; \
  bit [2:0] _sr1 ; \
  bit [2:0] _sr2 ; \
  bit [2:0] _dr ; \
  bit [2:0] _aluout ; \
  bit [15:0] _pcout ; \
     } execute_out_responder_s;

  `define execute_out_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function execute_out_responder_s to_responder_struct();\
    execute_out_responder_struct = \
           {\
           this._IR_exec , \
           this._M_data , \
           this._nzp , \
           this._W_control_out , \
           this._Mem_control_out , \
           this._sr1 , \
           this._sr2 , \
           this._dr , \
           this._aluout , \
           this._pcout  \
           };\
    return ( execute_out_responder_struct);\
  endfunction

  `define execute_out_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(execute_out_responder_s execute_out_responder_struct);\
           {\
           this._IR_exec , \
           this._M_data , \
           this._nzp , \
           this._W_control_out , \
           this._Mem_control_out , \
           this._sr1 , \
           this._sr2 , \
           this._dr , \
           this._aluout , \
           this._pcout  \
           } = execute_out_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
