
class imem_responder_alu_str_sequence 
  extends imem_responder_sequence ;

  `uvm_object_utils( imem_responder_alu_str_sequence )

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  function new(string name = "imem_responder_str_sequence");
    super.new(name);
  endfunction

  task body();
    req=imem_transaction::type_id::create("req");
    forever begin
      start_item(req);
	  if((!req.randomize() with {req.opcode inside {ADD, AND, NOT, STR};}))`uvm_fatal("SEQ", "imem_random_sequence::body()-imem_transaction randomization failed")
	  
      finish_item(req);
      // pragma uvmf custom body begin
      // UVMF_CHANGE_ME : Do something here with the resulting req item.  The
      // finish_item() call above will block until the req transaction is ready
      // to be handled by the responder sequence.
      // If this was an item that required a response, the expectation is
      // that the response should be populated within this transaction now.
      `uvm_info("SEQ",$sformatf("Processed txn: %s",req.convert2string()),UVM_HIGH)
      // pragma uvmf custom body end
    end
  endtask

endclass
