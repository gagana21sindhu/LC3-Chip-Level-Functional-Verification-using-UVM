//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: This test extends test_top and makes 
//    changes to test_top using the UVM factory type_override:
//
//    Test scenario: 
//      This is a template test that can be used to create future tests.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class alu_mem_test extends test_top;

  `uvm_component_utils( alu_mem_test );

  function new( string name = "", uvm_component parent = null );
    super.new( name, parent );
  endfunction

  virtual function void build_phase(uvm_phase phase);
     //imem_responder_sequence::type_id::set_type_override(imem_alu_mem_responder_sequence::get_type());
     super.build_phase(phase);
    // pragma uvmf custom configuration_settings_post_randomize begin
    set_type_override_by_type(imem_responder_sequence::get_type(), imem_alu_mem_responder_sequence::get_type());
    // The configuration structure has already been randomized.
    // pragma uvmf custom configuration_settings_post_randomize end
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

