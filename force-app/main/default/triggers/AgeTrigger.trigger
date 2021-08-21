trigger AgeTrigger on Student__c (after update) {
public Boolean selected=false;
    if(Trigger.isafter){
        if(Trigger.isupdate){
            if(!selected){
                selected=true;
            List<Student__c> s1list= new List<Student__c>();
            Date d1= Date.newInstance(1980, 5, 24);
            system.debug('Date is'+d1);
           List<Student__c>  stlist=[select Date_of_Birth__c,name from Student__c where id in :Trigger.newmap.keyset()]; 
            for(Student__c s1:stlist){
                s1.Date_of_Birth__c=d1;
                s1list.add(s1);
            }
            update s1list;
            }
        }
    }
}