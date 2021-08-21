trigger casetriggers on Case (Before update,after update,Before insert,After insert,Before Delete,After Delete ) {

     //Triggertask 13
    //After Update
     if(Trigger.isAfter && Trigger.isupdate){ 
   // TriggersTasks.Afterupdatetriggertask13(Trigger.new);
    }
    
    //Live Coding  Task12
    //After insert and after Update
    if(Trigger.isafter){
        if(Trigger.isinsert){
           //  TriggersTasks.Afterinsertlctask12(Trigger.newmap);
           
        }
        if(Trigger.isupdate){
          //  TriggersTasks.Afterupdatelctask12(Trigger.newmap,Trigger.oldmap);
        }
        if(Trigger.isinsert || Trigger.isupdate || Trigger.isdelete){
           //  TriggersTasks.AfterInsertandAfterUpdatelctask12(Trigger.newmap);
        }
    }
    
    if(Trigger.isafter){
        if(Trigger.isinsert || Trigger.isupdate || Trigger.isdelete){
          //   July16_A5TriggerCode_Review.July16_Approach1(Trigger.new,Trigger.newmap,Trigger.oldmap);
          //  July16_A5TriggerCode_Review.July16_Approach2(Trigger.newmap);
          //  July16_A5TriggerCode_Review.July16_Approach3(Trigger.newmap);
            July16_A5TriggerCode_Review.July16_Approach4(Trigger.newmap);
        }
    }
    
}