 

onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider fetch_env_In_Agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.fetch_env/In_Agent/In_Agent_monitor/txn_stream
add wave -noupdate -group fetch_env_In_Agent_bus /hdl_top/fetch_env_In_Agent_bus/*
add wave -noupdate -divider fetch_env_Out_Agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.fetch_env/Out_Agent/Out_Agent_monitor/txn_stream
add wave -noupdate -group fetch_env_Out_Agent_bus /hdl_top/fetch_env_Out_Agent_bus/*
add wave -noupdate -divider decode_env_din_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.decode_env/din_agent/din_agent_monitor/txn_stream
add wave -noupdate -group decode_env_din_agent_bus /hdl_top/decode_env_din_agent_bus/*
add wave -noupdate -divider decode_env_dout_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.decode_env/dout_agent/dout_agent_monitor/txn_stream
add wave -noupdate -group decode_env_dout_agent_bus /hdl_top/decode_env_dout_agent_bus/*
add wave -noupdate -divider execute_env_agent_in 
add wave -noupdate /uvm_root/uvm_test_top/environment.execute_env/agent_in/agent_in_monitor/txn_stream
add wave -noupdate -group execute_env_agent_in_bus /hdl_top/execute_env_agent_in_bus/*
add wave -noupdate -divider execute_env_agent_out 
add wave -noupdate /uvm_root/uvm_test_top/environment.execute_env/agent_out/agent_out_monitor/txn_stream
add wave -noupdate -group execute_env_agent_out_bus /hdl_top/execute_env_agent_out_bus/*
add wave -noupdate -divider writeback_env_writeback_in_agent_inst 
add wave -noupdate /uvm_root/uvm_test_top/environment.writeback_env/writeback_in_agent_inst/writeback_in_agent_inst_monitor/txn_stream
add wave -noupdate -group writeback_env_writeback_in_agent_inst_bus /hdl_top/writeback_env_writeback_in_agent_inst_bus/*
add wave -noupdate -divider writeback_env_writeback_out_agent_inst 
add wave -noupdate /uvm_root/uvm_test_top/environment.writeback_env/writeback_out_agent_inst/writeback_out_agent_inst_monitor/txn_stream
add wave -noupdate -group writeback_env_writeback_out_agent_inst_bus /hdl_top/writeback_env_writeback_out_agent_inst_bus/*
add wave -noupdate -divider memaccess_env_agent_memaccess_in 
add wave -noupdate /uvm_root/uvm_test_top/environment.memaccess_env/agent_memaccess_in/agent_memaccess_in_monitor/txn_stream
add wave -noupdate -group memaccess_env_agent_memaccess_in_bus /hdl_top/memaccess_env_agent_memaccess_in_bus/*
add wave -noupdate -divider memaccess_env_agent_memaccess_out 
add wave -noupdate /uvm_root/uvm_test_top/environment.memaccess_env/agent_memaccess_out/agent_memaccess_out_monitor/txn_stream
add wave -noupdate -group memaccess_env_agent_memaccess_out_bus /hdl_top/memaccess_env_agent_memaccess_out_bus/*
add wave -noupdate -divider control_env_agent_in 
add wave -noupdate /uvm_root/uvm_test_top/environment.control_env/agent_in/agent_in_monitor/txn_stream
add wave -noupdate -group control_env_agent_in_bus /hdl_top/control_env_agent_in_bus/*
add wave -noupdate -divider control_env_agent_out 
add wave -noupdate /uvm_root/uvm_test_top/environment.control_env/agent_out/agent_out_monitor/txn_stream
add wave -noupdate -group control_env_agent_out_bus /hdl_top/control_env_agent_out_bus/*
add wave -noupdate -divider imem_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment/imem_agent/imem_agent_monitor/txn_stream
add wave -noupdate -group imem_agent_bus /hdl_top/imem_agent_bus/*
add wave -noupdate -divider dmem_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment/dmem_agent/dmem_agent_monitor/txn_stream
add wave -noupdate -group dmem_agent_bus /hdl_top/dmem_agent_bus/*



TreeUpdate [SetDefaultTree]
quietly wave cursor active 0
configure wave -namecolwidth 472
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {27 ns} {168 ns}

