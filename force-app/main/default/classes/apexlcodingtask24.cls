public class apexlcodingtask24 {
    
    public Lead l{get;set;}
    public String lname{get;set;}
    public List<Lead> leadlist{get;set;}
    public Boolean  leadtable{get;set;}
    public id x{get;set;}
    public Lead lead1{get;set;}
  
    public apexlcodingtask24(){
        l= new Lead();
        leadlist= new List<Lead>();
        leadtable=false;
    }
    
    public pagereference showleads(){
        integer count=[select count() from lead where name=:lname];
        if(lname.length()==0 || string.isBlank(lname)){
            leadtable=false;
             apexpages.addMessage(new apexpages.Message(apexpages.Severity.error,'pls enter lead name'));
        }
        else if(count==0){
             leadtable=false;
             apexpages.addMessage(new apexpages.Message(apexpages.Severity.error,'pls enter valid lead name'));
        }
       else  if(lname.length()!=0 || !string.isBlank(lname)){
            leadlist.clear();
        leadlist=[select id,name,status,company from lead where name=:lname];
           if(leadlist.size()>0){
                leadtable=true;
           }
        }
        return null;
    }
  
    public pagereference showleads1(){
         leadlist.clear();
         leadlist=[select id,name,status,company from lead where status=:l.status];
          if(leadlist.size()>0){
                leadtable=true;
           }
        return null;
    }
    
    public pagereference convertlead(){
        lead1=[select id,name,status,company from lead where id=:x];
        if(lead1.status=='Working - Contacted'){
           lead1.status='Closed - Converted';
            Account a= new Account(name=lead1.company);
            insert a;
            contact c= new Contact(lastname=lead1.name,accountid=a.id);
            insert c;
            opportunity o= new Opportunity(name=a.name+'opp',accountid=a.id,StageName='Closed Won',CloseDate=Date.today());
            insert o;
             apexpages.addMessage(new apexpages.Message(apexpages.Severity.CONFIRM,'lead successfully converted to account,contact and opportunity.'));
        }
        else{
             apexpages.addMessage(new apexpages.Message(apexpages.Severity.error,'Dont convert lead'));
        }
        
        update lead1;
        
        
        return  null;
            
        
    }

}