trigger LeadTriggers on Lead(before insert,before update) {

    
     //Triggertask5
    //Before Insert
    if(Trigger.isBefore && Trigger.isinsert){ 
    TriggersTasks.BeforeInserttriggertask5(Trigger.new);
    }
    
    
     //Triggertask5
    //Before Insert
    if(Trigger.isBefore && Trigger.isupdate){ 
    TriggersTasks.BeforeUpdatetriggertask5(Trigger.new);
    }
    
    
    
}