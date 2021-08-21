trigger mcqtask1 on Student__c (before insert,Before update) {
    
     if (Trigger.isBefore  && Trigger.isUpdate){
        system.debug ('trigger fired due to update before commit to db '+trigger.new);
    
       Date DOB = Date.newInstance(2000, 07, 02);
        for (Student__c std : trigger.new){
           
            std.Date_of_Birth__c = DOB; 
        }
     }

}