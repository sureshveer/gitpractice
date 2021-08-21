trigger Trigger_LIve_Coding_May23 on Case (after update) {
    
    //after update
     if(Trigger.isAfter && Trigger.isupdate){ 
     
         LiveCoding_May23.AfterUpdatetask11(Trigger.new);
         
    }

}