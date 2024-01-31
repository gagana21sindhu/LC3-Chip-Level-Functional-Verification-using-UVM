//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences randomizes the control_in transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and randomizes a control_in_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class control_in_random_sequence 
  extends control_in_sequence_base ;

  `uvm_object_utils( control_in_random_sequence )

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  //*****************************************************************
  function new(string name = "");
    super.new(name);
  endfunction: new

  // ****************************************************************************
  // TASK : body()
  // This task is automatically executed when this sequence is started using the 
  // start(sequencerHandle) task.
  //
  task body();
  
      // Construct the transaction
      repeat(3)
      begin
        req=control_in_transaction::type_id::create("req");
        start_item(req);
        // Randomize the transaction
        $display("Dem");
        if(!req.randomize()) `uvm_fatal("SEQ", "control_in_random_sequence::body()-control_in_transaction randomization failed")
        $display("complete_data:0x%x complete_instr:0x%x IR:0x%x NZP:0x%x psr:0x%x IR_Exec:0x%x IMem_dout:0x%x ",req.complete_data,req.complete_instr,req.IR,req.NZP,req.psr,req.IR_Exec,req.IMem_dout);
        // Send the transaction to the control_in_driver_bfm via the sequencer and control_in_driver.
        finish_item(req);
      end
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: control_in_random_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end

