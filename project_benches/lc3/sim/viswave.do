 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { fetch_env_In_Agent }
wave add uvm_test_top.environment.fetch_env.In_Agent.In_Agent_monitor.txn_stream -radix string -tag F0
wave group fetch_env_In_Agent_bus
wave add -group fetch_env_In_Agent_bus hdl_top.fetch_env_In_Agent_bus.* -radix hexadecimal -tag F0
wave group fetch_env_In_Agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { fetch_env_Out_Agent }
wave add uvm_test_top.environment.fetch_env.Out_Agent.Out_Agent_monitor.txn_stream -radix string -tag F0
wave group fetch_env_Out_Agent_bus
wave add -group fetch_env_Out_Agent_bus hdl_top.fetch_env_Out_Agent_bus.* -radix hexadecimal -tag F0
wave group fetch_env_Out_Agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { decode_env_din_agent }
wave add uvm_test_top.environment.decode_env.din_agent.din_agent_monitor.txn_stream -radix string -tag F0
wave group decode_env_din_agent_bus
wave add -group decode_env_din_agent_bus hdl_top.decode_env_din_agent_bus.* -radix hexadecimal -tag F0
wave group decode_env_din_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { decode_env_dout_agent }
wave add uvm_test_top.environment.decode_env.dout_agent.dout_agent_monitor.txn_stream -radix string -tag F0
wave group decode_env_dout_agent_bus
wave add -group decode_env_dout_agent_bus hdl_top.decode_env_dout_agent_bus.* -radix hexadecimal -tag F0
wave group decode_env_dout_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { execute_env_agent_in }
wave add uvm_test_top.environment.execute_env.agent_in.agent_in_monitor.txn_stream -radix string -tag F0
wave group execute_env_agent_in_bus
wave add -group execute_env_agent_in_bus hdl_top.execute_env_agent_in_bus.* -radix hexadecimal -tag F0
wave group execute_env_agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { execute_env_agent_out }
wave add uvm_test_top.environment.execute_env.agent_out.agent_out_monitor.txn_stream -radix string -tag F0
wave group execute_env_agent_out_bus
wave add -group execute_env_agent_out_bus hdl_top.execute_env_agent_out_bus.* -radix hexadecimal -tag F0
wave group execute_env_agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { writeback_env_writeback_in_agent_inst }
wave add uvm_test_top.environment.writeback_env.writeback_in_agent_inst.writeback_in_agent_inst_monitor.txn_stream -radix string -tag F0
wave group writeback_env_writeback_in_agent_inst_bus
wave add -group writeback_env_writeback_in_agent_inst_bus hdl_top.writeback_env_writeback_in_agent_inst_bus.* -radix hexadecimal -tag F0
wave group writeback_env_writeback_in_agent_inst_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { writeback_env_writeback_out_agent_inst }
wave add uvm_test_top.environment.writeback_env.writeback_out_agent_inst.writeback_out_agent_inst_monitor.txn_stream -radix string -tag F0
wave group writeback_env_writeback_out_agent_inst_bus
wave add -group writeback_env_writeback_out_agent_inst_bus hdl_top.writeback_env_writeback_out_agent_inst_bus.* -radix hexadecimal -tag F0
wave group writeback_env_writeback_out_agent_inst_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { memaccess_env_agent_memaccess_in }
wave add uvm_test_top.environment.memaccess_env.agent_memaccess_in.agent_memaccess_in_monitor.txn_stream -radix string -tag F0
wave group memaccess_env_agent_memaccess_in_bus
wave add -group memaccess_env_agent_memaccess_in_bus hdl_top.memaccess_env_agent_memaccess_in_bus.* -radix hexadecimal -tag F0
wave group memaccess_env_agent_memaccess_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { memaccess_env_agent_memaccess_out }
wave add uvm_test_top.environment.memaccess_env.agent_memaccess_out.agent_memaccess_out_monitor.txn_stream -radix string -tag F0
wave group memaccess_env_agent_memaccess_out_bus
wave add -group memaccess_env_agent_memaccess_out_bus hdl_top.memaccess_env_agent_memaccess_out_bus.* -radix hexadecimal -tag F0
wave group memaccess_env_agent_memaccess_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { control_env_agent_in }
wave add uvm_test_top.environment.control_env.agent_in.agent_in_monitor.txn_stream -radix string -tag F0
wave group control_env_agent_in_bus
wave add -group control_env_agent_in_bus hdl_top.control_env_agent_in_bus.* -radix hexadecimal -tag F0
wave group control_env_agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { control_env_agent_out }
wave add uvm_test_top.environment.control_env.agent_out.agent_out_monitor.txn_stream -radix string -tag F0
wave group control_env_agent_out_bus
wave add -group control_env_agent_out_bus hdl_top.control_env_agent_out_bus.* -radix hexadecimal -tag F0
wave group control_env_agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { imem_agent }
wave add uvm_test_top.environment.imem_agent.imem_agent_monitor.txn_stream -radix string -tag F0
wave group imem_agent_bus
wave add -group imem_agent_bus hdl_top.imem_agent_bus.* -radix hexadecimal -tag F0
wave group imem_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { dmem_agent }
wave add uvm_test_top.environment.dmem_agent.dmem_agent_monitor.txn_stream -radix string -tag F0
wave group dmem_agent_bus
wave add -group dmem_agent_bus hdl_top.dmem_agent_bus.* -radix hexadecimal -tag F0
wave group dmem_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]



wave update on
WaveSetStreamView

