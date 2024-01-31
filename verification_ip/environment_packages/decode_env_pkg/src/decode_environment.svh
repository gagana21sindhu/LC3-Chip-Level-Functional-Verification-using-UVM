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

class decode_environment  extends uvmf_environment_base #(
    .CONFIG_T( decode_env_configuration 
  ));
  `uvm_component_utils( decode_environment )





  typedef decode_in_agent  din_agent_t;
  din_agent_t din_agent;

  typedef decode_out_agent  dout_agent_t;
  dout_agent_t dout_agent;




  typedef decode_predictor #(
                .CONFIG_T(CONFIG_T)
                ) d_predictor_t;
  d_predictor_t d_predictor;

  typedef uvmf_in_order_race_scoreboard #(.T(decode_out_transaction))  d_scoreboard_t;
  d_scoreboard_t d_scoreboard;



  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(decode_env_configuration)) decode_vsqr_t;
  decode_vsqr_t vsqr;

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
    din_agent = din_agent_t::type_id::create("din_agent",this);
    din_agent.set_config(configuration.din_agent_config);
    dout_agent = dout_agent_t::type_id::create("dout_agent",this);
    dout_agent.set_config(configuration.dout_agent_config);
    d_predictor = d_predictor_t::type_id::create("d_predictor",this);
    d_predictor.configuration = configuration;
    d_scoreboard = d_scoreboard_t::type_id::create("d_scoreboard",this);

    vsqr = decode_vsqr_t::type_id::create("vsqr", this);
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
    din_agent.monitored_ap.connect(d_predictor.d_analysis_export);
    dout_agent.monitored_ap.connect(d_scoreboard.actual_analysis_export);
    d_predictor.d_analysis_port.connect(d_scoreboard.expected_analysis_export);
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
     configuration.decode_configuration_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

