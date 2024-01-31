//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------                     
//               
// Description: This top level module instantiates all synthesizable
//    static content.  This and tb_top.sv are the two top level modules
//    of the simulation.  
//
//    This module instantiates the following:
//        DUT: The Design Under Test
//        Interfaces:  Signal bundles that contain signals connected to DUT
//        Driver BFM's: BFM's that actively drive interface signals
//        Monitor BFM's: BFM's that passively monitor interface signals
//
//----------------------------------------------------------------------

//----------------------------------------------------------------------
//

module hdl_top;

import lc3_parameters_pkg::*;
import uvmf_base_pkg_hdl::*;

  // pragma attribute hdl_top partition_module_xrtl                                            
// pragma uvmf custom clock_generator begin
  bit clk;
  // Instantiate a clk driver 
  // tbx clkgen
  initial begin
    clk = 0;
    #21ns;
    forever begin
      clk = ~clk;
      #6ns;
    end
  end
// pragma uvmf custom clock_generator end

// pragma uvmf custom reset_generator begin
  bit rst;
  // Instantiate a rst driver
  // tbx clkgen
  initial begin
    rst = 1; 
    #250ns;
    rst =  0; 
  end
  
  
	//wire enable_execute;
	wire enable_execute_out;
	reg enable_execute_out1;
	wire enable_decode_out;
	reg enable_decode_out1;
    reg [1:0] mem_reg;
	wire [1:0] mem_latch;
	reg enable_fetch_out1;
	reg Imem_rd_out1;
    wire enable_fetch_out;
	wire Imem_rd_out;
  
  //latching
  
  always @(posedge clk)
	begin
		 enable_execute_out1<=dut_lc3.enable_execute;
		 enable_decode_out1<=dut_lc3.enable_decode;
		 mem_reg <= dut_lc3.mem_state;
		 enable_fetch_out1 <= dut_lc3.enable_fetch;
		 Imem_rd_out1 <= dut_lc3.instrmem_rd;
	end
	
	assign enable_execute_out=enable_execute_out1;
	assign enable_decode_out=enable_decode_out1;
	assign mem_latch = mem_reg;
	assign enable_fetch_out = enable_fetch_out1;
	assign Imem_rd_out = Imem_rd_out1;
  
// pragma uvmf custom reset_generator end

  // pragma uvmf custom module_item_additional begin
  // pragma uvmf custom module_item_additional end

  // Instantiate the signal bundle, monitor bfm and driver bfm for each interface.
  // The signal bundle, _if, contains signals to be connected to the DUT.
  // The monitor, monitor_bfm, observes the bus, _if, and captures transactions.
  // The driver, driver_bfm, drives transactions onto the bus, _if.
  fetch_in_if  fetch_env_In_Agent_bus(
     // pragma uvmf custom fetch_env_In_Agent_bus_connections begin
     .clock(clk), .reset(rst), .enable_fetch(dut_lc3.enable_fetch),.enable_updatePC(dut_lc3.enable_updatePC),.br_taken(dut_lc3.br_taken),.taddr(dut_lc3.taddr)
     // pragma uvmf custom fetch_env_In_Agent_bus_connections end
     );
  fetch_out_if  fetch_env_Out_Agent_bus(
     // pragma uvmf custom fetch_env_Out_Agent_bus_connections begin
     .clock(clk), .reset(rst), .npc(dut_lc3.npc_out_fetch), .pc(dut_lc3.pc), .Imem_rd(Imem_rd_out), .enable_fetch(enable_fetch_out)
     // pragma uvmf custom fetch_env_Out_Agent_bus_connections end
     );
  decode_in_if  decode_env_din_agent_bus(
     // pragma uvmf custom decode_env_din_agent_bus_connections begin
     .clock(clk), .reset(rst), .enable_decode(dut_lc3.enable_decode), .instr_dout(dut_lc3.Instr_dout), .npc_in(dut_lc3.npc_out_fetch)
     // pragma uvmf custom decode_env_din_agent_bus_connections end
     );
  decode_out_if  decode_env_dout_agent_bus(
     // pragma uvmf custom decode_env_dout_agent_bus_connections begin
     .clock(clk), .reset(rst), .enable_decode(enable_decode_out), .IR(dut_lc3.IR), .npc_out(dut_lc3.npc_out_dec), .E_control(dut_lc3.E_Control), .W_control(dut_lc3.W_Control), .mem_control(dut_lc3.Mem_Control)
     // pragma uvmf custom decode_env_dout_agent_bus_connections end
     );
  execute_in_if  execute_env_agent_in_bus(
     // pragma uvmf custom execute_env_agent_in_bus_connections begin
     .clock(clk), .reset(rst), .E_control		(dut_lc3.E_Control), 
                                             .bypass_alu_1	(dut_lc3.bypass_alu_1), 
					     .bypass_alu_2	(dut_lc3.bypass_alu_2), 
                                             .IR		(dut_lc3.IR), 
                                             .W_control_in	(dut_lc3.W_Control), 
					     .Mem_control_in	(dut_lc3.Mem_Control), 
                                             .VSR1		(dut_lc3.VSR1), 
                                             .VSR2		(dut_lc3.VSR2), 
					     .bypass_mem_1	(dut_lc3.bypass_mem_1), 
                                             .bypass_mem_2	(dut_lc3.bypass_mem_2), 
                                             .Mem_bypass_val	(dut_lc3.memout),
					     .enable_execute	(dut_lc3.enable_execute),
					     .npc_in            (dut_lc3.npc_out_dec)
     // pragma uvmf custom execute_env_agent_in_bus_connections end
     );
  execute_out_if  execute_env_agent_out_bus(
     // pragma uvmf custom execute_env_agent_out_bus_connections begin
     .clock(clk), .reset(rst), .W_control_out	(dut_lc3.W_Control_out), 
					       .Mem_control_out	(dut_lc3.Mem_Control_out), 
                                               .aluout		(dut_lc3.aluout), 
                                               .pcout		(dut_lc3.pcout), 
					       .sr1		(dut_lc3.sr1), 
                                               .sr2		(dut_lc3.sr2), 
                                               .dr		(dut_lc3.dr), 
                                               .M_data		(dut_lc3.M_Data), 
                                               .NZP		(dut_lc3.NZP), 
                                               .IR_exec		(dut_lc3.IR_Exec),
						.enable_execute (enable_execute_out)
     // pragma uvmf custom execute_env_agent_out_bus_connections end
     );
  writeback_in_if  writeback_env_writeback_in_agent_inst_bus(
     // pragma uvmf custom writeback_env_writeback_in_agent_inst_bus_connections begin
     .clock(clk), .reset(rst), .enable_writeback	(dut_lc3.enable_writeback), 
					         .W_Control		(dut_lc3.W_Control_out), 
                                                 .aluout		(dut_lc3.aluout), 
                                                 .memout		(dut_lc3.memout), 
                                                 .pcout			(dut_lc3.pcout), 
					         .npc			(dut_lc3.npc_out_dec), 
                                                 .sr1			(dut_lc3.sr1), 
                                                 .sr2			(dut_lc3.sr2), 
                                                 .dr			(dut_lc3.dr) 
     // pragma uvmf custom writeback_env_writeback_in_agent_inst_bus_connections end
     );
  writeback_out_if  writeback_env_writeback_out_agent_inst_bus(
     // pragma uvmf custom writeback_env_writeback_out_agent_inst_bus_connections begin
     .clock(clk), .reset(rst), .vsr1	(dut_lc3.VSR1), 
                                                   .vsr2	(dut_lc3.VSR2), 
                                                   .psr		(dut_lc3.psr),
						   .enable_writeback_pt(dut_lc3.enable_writeback)
     // pragma uvmf custom writeback_env_writeback_out_agent_inst_bus_connections end
     );
  memaccess_in_if  memaccess_env_agent_memaccess_in_bus(
     // pragma uvmf custom memaccess_env_agent_memaccess_in_bus_connections begin
     .clock(clk), .reset(rst),  .mem_state	(dut_lc3.mem_state), 
                                                 .M_Control	(dut_lc3.Mem_Control_out), 
                                                 .M_Data	(dut_lc3.M_Data), 
                                                 .M_addr	(dut_lc3.pcout), 
                                                 .DMem_dout	(dut_lc3.Data_dout)
     // pragma uvmf custom memaccess_env_agent_memaccess_in_bus_connections end
     );
  memaccess_out_if  memaccess_env_agent_memaccess_out_bus(
     // pragma uvmf custom memaccess_env_agent_memaccess_out_bus_connections begin
     .clock(clk), .reset(rst), .memout	(dut_lc3.memout), 
                                                   .DMem_addr	(dut_lc3.Data_addr), 
                                                   .Dmem_din	(dut_lc3.Data_din), 
					           .DMem_rd	(dut_lc3.Data_rd)
     // pragma uvmf custom memaccess_env_agent_memaccess_out_bus_connections end
     );
  control_in_if  control_env_agent_in_bus(
     // pragma uvmf custom control_env_agent_in_bus_connections begin
     .clock(clk), .reset(rst), .complete_data	(dut_lc3.complete_data), 
                                             .complete_instr	(dut_lc3.complete_instr), 
					     .NZP		(dut_lc3.NZP), 
                                             .psr		(dut_lc3.psr),
                                             .IR 		(dut_lc3.IR),
                                             .IR_Exec		(dut_lc3.IR_Exec),
                                             .IMem_dout		(dut_lc3.Instr_dout)
     // pragma uvmf custom control_env_agent_in_bus_connections end
     );
  control_out_if  control_env_agent_out_bus(
     // pragma uvmf custom control_env_agent_out_bus_connections begin
     .clock(clk), .reset(rst), .enable_fetch		(dut_lc3.enable_fetch), 
                                               .enable_decode		(dut_lc3.enable_decode), 
					       .enable_execute		(dut_lc3.enable_execute), 
                                               .enable_writeback	(dut_lc3.enable_writeback), 
					       .enable_updatePC		(dut_lc3.enable_updatePC), 
                                               .mem_state		(dut_lc3.mem_state),
                                               .bypass_alu_1		(dut_lc3.bypass_alu_1), 
                                               .bypass_alu_2		(dut_lc3.bypass_alu_2),
					       .bypass_mem_1		(dut_lc3.bypass_mem_1), 
                                               .bypass_mem_2		(dut_lc3.bypass_mem_2),
                                               .br_taken		(dut_lc3.br_taken)
     // pragma uvmf custom control_env_agent_out_bus_connections end
     );
  imem_if  imem_agent_bus(
     // pragma uvmf custom imem_agent_bus_connections begin
     .clock(clk), .reset(rst), . complete_instr(dut_lc3.complete_instr), .Instr_dout(dut_lc3.Instr_dout), .PC(dut_lc3.pc), .instrmem_rd(dut_lc3.instrmem_rd)
     // pragma uvmf custom imem_agent_bus_connections end
     );
  dmem_if  dmem_agent_bus(
     // pragma uvmf custom dmem_agent_bus_connections begin
     .clock(clk), .reset(rst), .complete_data(dut_lc3.complete_data) , .Data_dout(dut_lc3.Data_dout) , .Data_din(dut_lc3.Data_din) , .Data_addr(dut_lc3.Data_addr) , .Data_rd(dut_lc3.Data_rd)
     // pragma uvmf custom dmem_agent_bus_connections end
     );
  fetch_in_monitor_bfm  fetch_env_In_Agent_mon_bfm(fetch_env_In_Agent_bus);
  fetch_out_monitor_bfm  fetch_env_Out_Agent_mon_bfm(fetch_env_Out_Agent_bus);
  decode_in_monitor_bfm  decode_env_din_agent_mon_bfm(decode_env_din_agent_bus);
  decode_out_monitor_bfm  decode_env_dout_agent_mon_bfm(decode_env_dout_agent_bus);
  execute_in_monitor_bfm  execute_env_agent_in_mon_bfm(execute_env_agent_in_bus);
  execute_out_monitor_bfm  execute_env_agent_out_mon_bfm(execute_env_agent_out_bus);
  writeback_in_monitor_bfm  writeback_env_writeback_in_agent_inst_mon_bfm(writeback_env_writeback_in_agent_inst_bus);
  writeback_out_monitor_bfm  writeback_env_writeback_out_agent_inst_mon_bfm(writeback_env_writeback_out_agent_inst_bus);
  memaccess_in_monitor_bfm  memaccess_env_agent_memaccess_in_mon_bfm(memaccess_env_agent_memaccess_in_bus);
  memaccess_out_monitor_bfm  memaccess_env_agent_memaccess_out_mon_bfm(memaccess_env_agent_memaccess_out_bus);
  control_in_monitor_bfm  control_env_agent_in_mon_bfm(control_env_agent_in_bus);
  control_out_monitor_bfm  control_env_agent_out_mon_bfm(control_env_agent_out_bus);
  imem_monitor_bfm  imem_agent_mon_bfm(imem_agent_bus);
  dmem_monitor_bfm  dmem_agent_mon_bfm(dmem_agent_bus);
  imem_driver_bfm  imem_agent_drv_bfm(imem_agent_bus);
  dmem_driver_bfm  dmem_agent_drv_bfm(dmem_agent_bus);

  // pragma uvmf custom dut_instantiation begin
  // UVMF_CHANGE_ME : Add DUT and connect to signals in _bus interfaces listed above
  // Instantiate your DUT here
  // These DUT's instantiated to show verilog and vhdl instantiation
  //verilog_dut         dut_verilog(   .clk(clk), .rst(rst), .in_signal(vhdl_to_verilog_signal), .out_signal(verilog_to_vhdl_signal));
  //vhdl_dut            dut_vhdl   (   .clk(clk), .rst(rst), .in_signal(verilog_to_vhdl_signal), .out_signal(vhdl_to_verilog_signal));
  // pragma uvmf custom dut_instantiation end

  initial begin      // tbx vif_binding_block 
    import uvm_pkg::uvm_config_db;
    // The monitor_bfm and driver_bfm for each interface is placed into the uvm_config_db.
    // They are placed into the uvm_config_db using the string names defined in the parameters package.
    // The string names are passed to the agent configurations by test_top through the top level configuration.
    // They are retrieved by the agents configuration class for use by the agent.
    uvm_config_db #( virtual fetch_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , fetch_env_In_Agent_BFM , fetch_env_In_Agent_mon_bfm ); 
    uvm_config_db #( virtual fetch_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , fetch_env_Out_Agent_BFM , fetch_env_Out_Agent_mon_bfm ); 
    uvm_config_db #( virtual decode_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , decode_env_din_agent_BFM , decode_env_din_agent_mon_bfm ); 
    uvm_config_db #( virtual decode_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , decode_env_dout_agent_BFM , decode_env_dout_agent_mon_bfm ); 
    uvm_config_db #( virtual execute_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , execute_env_agent_in_BFM , execute_env_agent_in_mon_bfm ); 
    uvm_config_db #( virtual execute_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , execute_env_agent_out_BFM , execute_env_agent_out_mon_bfm ); 
    uvm_config_db #( virtual writeback_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , writeback_env_writeback_in_agent_inst_BFM , writeback_env_writeback_in_agent_inst_mon_bfm ); 
    uvm_config_db #( virtual writeback_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , writeback_env_writeback_out_agent_inst_BFM , writeback_env_writeback_out_agent_inst_mon_bfm ); 
    uvm_config_db #( virtual memaccess_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , memaccess_env_agent_memaccess_in_BFM , memaccess_env_agent_memaccess_in_mon_bfm ); 
    uvm_config_db #( virtual memaccess_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , memaccess_env_agent_memaccess_out_BFM , memaccess_env_agent_memaccess_out_mon_bfm ); 
    uvm_config_db #( virtual control_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , control_env_agent_in_BFM , control_env_agent_in_mon_bfm ); 
    uvm_config_db #( virtual control_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , control_env_agent_out_BFM , control_env_agent_out_mon_bfm ); 
    uvm_config_db #( virtual imem_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , imem_agent_BFM , imem_agent_mon_bfm ); 
    uvm_config_db #( virtual dmem_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , dmem_agent_BFM , dmem_agent_mon_bfm ); 
    uvm_config_db #( virtual imem_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , imem_agent_BFM , imem_agent_drv_bfm  );
    uvm_config_db #( virtual dmem_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , dmem_agent_BFM , dmem_agent_drv_bfm  );
  end
  
  LC3 dut_lc3 (	.clock(clk), .reset(rst), .pc(imem_agent_bus.PC) , .instrmem_rd(imem_agent_bus.instrmem_rd), .Instr_dout(imem_agent_bus.Instr_dout), .Data_addr(dmem_agent_bus.Data_addr), .complete_instr(imem_agent_bus.complete_instr), .complete_data(dmem_agent_bus.complete_data),  
				.Data_din(dmem_agent_bus.Data_din), .Data_dout(dmem_agent_bus.Data_dout), .Data_rd(dmem_agent_bus.Data_rd)	
			);


endmodule

// pragma uvmf custom external begin
// pragma uvmf custom external end

