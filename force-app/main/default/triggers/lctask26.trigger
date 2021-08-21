trigger lctask26 on Student_Activities__c(before insert,before update,after insert,after update,after delete,before delete) {
    
    if(Trigger.isBefore){
        if(Trigger.isinsert ||Trigger.isupdate){
            system.debug('map'+Trigger.newmap); 
           apexlvctask26.task26(Trigger.new);
        
            
        }
    }
    if(Trigger.isafter){
        if(Trigger.isinsert || Trigger.isupdate || Trigger.isdelete){
            // system.debug('maptask26b'+Trigger.newmap);
            apexlvctask26.task26B(Trigger.newmap,Trigger.oldmap);
        }
    }
    if(Trigger.isafter){
        if(Trigger.isinsert || Trigger.isupdate|| Trigger.isdelete){
        apexlvctask26.task27(Trigger.newmap,Trigger.oldmap);
        }
        
    }
    
  
    

}