public class apexlivecodingjuly27 {
    
    public Case c{get;set;}
    public List<Case> caselist{get;set;}
    public Boolean tableview{get;set;}
    public apexlivecodingjuly27(){
        c= new Case();
        tableview=false;
    }
    
    public pagereference showcases(){
        if(c.DueDate__c!=null && c.Priority!='--None--' && c.Status!='--None--'){
            caselist=[select id,DueDate__c,priority,status from case where DueDate__c=:c.DueDate__c or(priority=:c.Priority and status=:c.Status)];
            system.debug('caselist is'+caselist);
            if(caselist.size()>0){
                tableview=true;
            }
        }
      if(c.DueDate__c==null){
            tableview=false;
             apexPages.Message myMsg1 = new ApexPages.Message(ApexPages.severity.error,'pls enter Duedate');
            ApexPages.addmessage(myMsg1);
        }
            if(c.priority==null){
               tableview=false;
             apexPages.Message myMsg2 = new ApexPages.Message(ApexPages.severity.error,'pls change priority');
            ApexPages.addmessage(myMsg2);
        }
            if(c.status==null){
               tableview=false;
             apexPages.Message myMsg3 = new ApexPages.Message(ApexPages.severity.error,'pls change status');
            ApexPages.addmessage(myMsg3);
        }
        
        return null;
    }

}