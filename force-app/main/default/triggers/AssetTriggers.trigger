trigger AssetTriggers on Asset (Before insert,after insert,Before Update,after update,Before Delete) {

    //afterinsert
    //Live Coding Task7
    if(Trigger.isafter && Trigger.isinsert){
        if(!TriggersTasks.quantityselected){
            TriggersTasks.quantityselected=true;
         TriggersTasks.AfterInsertLiveCodingTask7july13(Trigger.new);
        }
    }
    
    //Before insert
    //Live Coding Task8 Juy14
     if(Trigger.isBefore && Trigger.isinsert){
    TriggersTasks.BeforeInsertLiveCodingTask8(Trigger.new);
     }

 }