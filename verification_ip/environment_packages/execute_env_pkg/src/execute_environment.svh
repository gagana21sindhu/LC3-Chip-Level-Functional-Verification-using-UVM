//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: This environment contains all agents, predictors and
// scoreboards required for the block level design.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class execute_environment  extends uvmf_environment_base #(
    .CONFIG_T( execute_env_configuration 
  ));
  `uvm_component_utils( execute_environment )





  typedef execute_in_agent  exin_agent_t;
  exin_agent_t exin_agent;

  typedef execute_out_agent  exout_agent_t;
  exout_agent_t exout_agent;




  typedef execute_predictor #(
                .CONFIG_T(CONFIG_T)
                ) ex_predictor_t;
  ex_predictor_t ex_predictor;

  typedef uvmf_in_order_race_scoreboard #(.T(execute_out_transaction))  ex_scoreboard_t;
  ex_scoreboard_t ex_scoreboard;



  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(execute_env_configuration)) execute_vsqr_t;
  execute_vsqr_t vsqr;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
 
// ****************************************************************************
// FUNCTION : new()
// This function is the standard SystemVerilog constructor.
//
  function new( string name = "", uvm_component parent = null );
    super.new( name, parent );
  endfunction

// ****************************************************************************
// FUNCTION: build_phase()
// This function builds all components within this environment.
//
  virtual function void build_phase(uvm_phase phase);
// pragma uvmf custom build_phase_pre_super begin
// pragma uvmf custom build_phase_pre_super end
    super.build_phase(phase);
    exin_agent = exin_agent_t::type_id::create("exin_agent",this);
    exin_agent.set_config(configuration.exin_agent_config);
    exout_agent = exout_agent_t::type_id::create("exout_agent",this);
    exout_agent.set_config(configuration.exout_agent_config);
    ex_predictor = ex_predictor_t::type_id::create("ex_predictor",this);
    ex_predictor.configuration = configuration;
    ex_scoreboard = ex_scoreboard_t::type_id::create("ex_scoreboard",this);

    vsqr = execute_vsqr_t::type_id::create("vsqr", this);
    vsqr.set_config(configuration);
    configuration.set_vsqr(vsqr);

    // pragma uvmf custom build_phase begin
    // pragma uvmf custom build_phase end
  endfunction

// ****************************************************************************
// FUNCTION: connect_phase()
// This function makes all connections within this environment.  Connections
// typically inclue agent to predictor, predictor to scoreboard and scoreboard
// to agent.
//
  virtual function void connect_phase(uvm_phase phase);
// pragma uvmf custom connect_phase_pre_super begin
// pragma uvmf custom connect_phase_pre_super end
    super.connect_phase(phase);
    exin_agent.monitored_ap.connect(ex_predictor.analysis_export);
    exout_agent.monitored_ap.connect(ex_scoreboard.actual_analysis_export);
    ex_predictor.analysis_port.connect(ex_scoreboard.expected_analysis_export);
    // pragma uvmf custom reg_model_connect_phase begin
    // pragma uvmf custom reg_model_connect_phase end
  endfunction

// ****************************************************************************
// FUNCTION: end_of_simulation_phase()
// This function is executed just prior to executing run_phase.  This function
// was added to the environment to sample environment configuration settings
// just before the simulation exits time 0.  The configuration structure is 
// randomized in the build phase before the environment structure is constructed.
// Configuration variables can be customized after randomization in the build_phase
// of the extended test.
// If a sequence modifies values in the configuration structure then the sequence is
// responsible for sampling the covergroup in the configuration if required.
//
  virtual function void start_of_simulation_phase(uvm_phase phase);
     configuration.execute_configuration_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

