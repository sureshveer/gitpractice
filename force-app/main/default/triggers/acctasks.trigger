trigger acctasks on Account (before insert,after insert,before update,after update,before delete,after delete,after undelete) {
        
         if(trigger.isafter )
            if(Trigger.isinsert || trigger.isupdate){
            
          //  recordsharingtask2.getuserrecords(trigger.new);
        }
    
    }