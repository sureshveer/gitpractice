trigger CountStudentsEnrolled on Student_Activities__c (after insert,after update,after delete,after undelete) {
    
    Map<Id,List<Student_Activities__c>> mapActstdList = new Map<Id,List<Student_Activities__c>>();
    
    Map<Id,List<Student_Activities__c>> mapActstdDelList = new Map<Id,List<Student_Activities__c>>();
    
    Map<Id,List<Student_Activities__c>> mapActstdPartList = new Map<Id,List<Student_Activities__c>>();
    
    Map<Id,List<Student_Activities__c>> mapActstdPartDelList = new Map<Id,List<Student_Activities__c>>();
    

    set<Id> activId = new set<Id>();
    
    List<Activity__c> acctlist = new List<Activity__c>();
    
    if(trigger.isInsert || trigger.isUndelete){
        for(Student_Activities__c s : Trigger.new){
            
            date today = Date.today();
            
            integer numbersdue = s.Activity__r.Activity_Start_Date__c.daysBetween(today);
            
            if(numbersdue <=2){
                s.addError('Enrollment Closed');
            }
            
            if(s.Activity__r.Number_Of_Students_Enrolled__c > s.Activity__r.Enrollment_Limit__c	){
                s.addError('No of students must not exceed Enrollment Limit');
            }
            
            if(s.Activity__c != Null){
                if(!mapActstdList.containsKey(s.Activity__c)){
                    mapActstdList.put(s.Activity__c,new List<Student_Activities__c>());
                }
                else{
                    mapActstdDelList.get(s.Activity__c).add(s);
                }
             }
            if(s.Activity__c != Null && s.Participated__c == True){
                if(!mapActstdPartList.containsKey(s.Activity__c)){
                    mapActstdPartList.put(s.Activity__c,new List<Student_Activities__c>());
                }
                else{
                    mapActstdPartDelList.get(s.Activity__c).add(s);
                }
             }
            
            
     
            activId.add(s.Activity__c);
        }
    }
    
    if(trigger.isUpdate){
        for(Student_Activities__c s : Trigger.new){
            
            date today = Date.today();
            integer numbersdue = s.Activity__r.Activity_Start_Date__c.daysBetween(today);
            
            if(numbersdue <= 2){
                s.addError('Enrollment Closed');
            }
            
            if(s.Activity__r.Number_of_Students_Enrolled__c > s.Activity__r.Enrollment_Limit__c){
                s.addError('No of students must not exceed Enrollment Limit');
            }
            if(s.Activity__c != Null && s.Activity__c != Trigger.oldMap.get(s.id).Activity__c){
                if(!mapActstdList.containsKey(s.Activity__c)){
                    mapActstdList.put(s.Activity__c,new List<Student_Activities__c>());
                }
                else{
                    mapActstdDelList.get(s.Activity__c).add(s);
                }
             }
            if(s.Activity__c != Null && s.Participated__c == True && s.Activity__c != Trigger.oldMap.get(s.id).Activity__c){
                if(!mapActstdPartList.containsKey(s.Activity__c)){
                    mapActstdPartList.put(s.Activity__c,new List<Student_Activities__c>());
                }
                else{
                    mapActstdPartDelList.get(s.Activity__c).add(s);
                }
             }
     
            activId.add(s.Activity__c);
        }
        
    }
    
    if(trigger.isDelete){
			for(Student_Activities__c s : Trigger.old){
            if(s.Activity__c != Null){
                if(!mapActstdList.containsKey(s.Activity__c)){
                    mapActstdList.put(s.Activity__c,new List<Student_Activities__c>());
                }
                else{
                    mapActstdDelList.get(s.Activity__c).add(s);
                }
             }
            if(s.Activity__c != Null && s.Participated__c == True){
                if(!mapActstdPartList.containsKey(s.Activity__c)){
                    mapActstdPartList.put(s.Activity__c,new List<Student_Activities__c>());
                }
                else{
                    mapActstdPartDelList.get(s.Activity__c).add(s);
                }
             }
     
            activId.add(s.Activity__c);
        }
    }
    
    if(activId.size() > 0 ){
        
        acctlist = [SELECT Id,Number_Of_Students_Enrolled__c,Number_of_Students_participated__c FROM Activity__c WHERE Id IN :activId];
        
        for(Activity__c acc : acctlist){            
            integer enrolled = 0;
            integer participated = 0;            
            if(mapActstdList.containsKey(acc.id)){
                enrolled += mapActstdList.get(acc.id).size();
            }            
			if(mapActstdPartList.containsKey(acc.id)){
                participated += mapActstdPartList.get(acc.id).size();
            }
            if(mapActstdList.containsKey(acc.id)){
                enrolled -= mapActstdList.get(acc.id).size();
            }
			if(mapActstdPartList.containsKey(acc.id)){
                participated -= mapActstdPartList.get(acc.id).size();
            }
            acc.Number_of_Students_Enrolled__c = acc.Number_of_Students_Enrolled__c + enrolled;
            acc.Number_of_Students_participated__c = acc.Number_of_Students_participated__c + participated;         
            update acctlist;			            
        }
    }     

}