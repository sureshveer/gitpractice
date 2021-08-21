trigger PracticeMCQTrigger on Student__c (before insert,before update,after update) {
/*
    public static Boolean selected=false;
    set<id> idlist= new set<id>();
    for(Student__c s:Trigger.new){
        idlist.add(s.id); 
    }
    
    if(Trigger.isAfter){
        if(Trigger.isupdate ){
            if(!selected){
                selected=true;
            Date d1= Date.newInstance(2021, 5, 24);
            system.debug('date is'+d1);
            List<Student__c> stlist=[select id,name,DOJ__c from Student__c where id in: idlist];
            for(Student__c s1:stlist){
                s1.DOJ__c=d1;              
            }
                update stlist;
            }
            
        }
        
        
    }*/
 if(Trigger.isBefore)
   if(Trigger.isinsert){
Date d1= Date.newInstance(2021, 5, 24);
system.debug('date is'+d1);
 for(Student__c s1:Trigger.new){
                s1.Date_of_Joining__c=d1;              
            }
}
    
   
}