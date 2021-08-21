trigger AccountTriggers on Account(before insert,before update,after insert,Before delete) {

    //triggertask1,4,8,16 
    //Before Insert 
    if(Trigger.isBefore && Trigger.isinsert){ 
        //  TriggersTasks.BeforeInserttriggertask1(Trigger.new);
        // TriggersTasks.BeforeInserttriggertask4(Trigger.new);
        //  TriggersTasks.BeforeInserttriggertask8(Trigger.new);
         
    }
    //triggertask1
    //Before update
    if(trigger.isBefore && trigger.isupdate){
       //TriggersTasks.BeforeUpdatetriggertask1(Trigger.new);    
    }
    
    
    //Triggertask2 , 8,16
    //After insert
     if(Trigger.isAfter && Trigger.isinsert){ 
         // TriggersTasks.AfterInserttriggertask2(Trigger.new);
        //  TriggersTasks.AfterInserttriggertask8(Trigger.new);
       //   TriggersTasks.BeforeInserttriggertask16(Trigger.new);
    }
    
    //triggertask3,11
    //After update
    if(trigger.isAfter && trigger.isupdate){
     //  TriggersTasks.AfterUpdatetriggertask3(Trigger.new); 
     //  TriggersTasks.AfterUpdatetriggertask11(Trigger.new);  
    }
    
  
    
    //Triggertask7
    //Before delete
     if(Trigger.isBefore && Trigger.isdelete){ 
  //  TriggersTasks.BeforeDeletetriggertask7(Trigger.old);
    }
    
}