trigger opportunitytriggers on Opportunity(after update) {

    
    //Triggertask10,15
    //After Update
     if(Trigger.isAfter && Trigger.isupdate){ 
    TriggersTasks.Afterupdatetriggertask10(Trigger.new);
    TriggersTasks.Afterupdatetriggertask15(Trigger.new);
    }
     
}