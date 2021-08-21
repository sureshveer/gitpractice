public class Triggercodes {

     public static Boolean selected=false;
    public static void afterinserttask14(List<case> caselist,map<id,case> oldmap){
        
       
        set<Id> idlist= new set<Id>();
        for(Case c:caselist){
           idlist.add(c.id);
        }
        
        List<case> c2=[select id,DueDate__c,priority,createddate,status,closeddate from case where id in:idlist and (priority='high' or priority='low' or priority='medium' or status='closed')];
        for(case c1:c2){
            if(c1.priority=='High'){
               
                   Date d= Date.newInstance(c1.createddate.year(),c1.createddate.month(), c1.createddate.day());
                    c1.DueDate__c=d+2; 
            }
           
           else if(c1.priority=='medium'){
                
                   Date d= Date.newInstance(c1.createddate.year(),c1.createddate.month(), c1.createddate.day());
                    c1.DueDate__c=d+5;
               
            }
            else if(c1.priority=='low'){
                
                   Date d= Date.newInstance(c1.createddate.year(),c1.createddate.month(), c1.createddate.day());
                    c1.DueDate__c=d+10;
            }
        }
        
        update c2;
        
        if(oldmap!=null){
            for(case c1:c2){
                if(c1.Status=='closed'){
                    if(c1.ClosedDate>c1.DueDate__c){
                        c1.DueDateStatus__c='overdue';
                    }
                    else if(c1.ClosedDate<c1.DueDate__c){
                        c1.DueDateStatus__c='underdue';
                    }
                     else if(c1.ClosedDate==c1.DueDate__c){
                        c1.DueDateStatus__c='sameday';
                    }
                    else if(c1.Comments==null){
                        if(c1.DueDateStatus__c=='overdue'){
                            c1.adderror('comments filed is required');
                        }
                    }
                }
            }
            
        }
        update c2;
    }
}