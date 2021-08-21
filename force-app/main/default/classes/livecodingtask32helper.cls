public class livecodingtask32helper {

    public string accname{get;set;}
    
    public Boolean newconvisible{get;set;}
    public Boolean acclistvalue{get;set;}
     public Boolean newconlist{get;set;}
    public List<Contact> conlist{get;set;}
 //   public List<Contact> conlist1{get;set;}
    
    public string lastname{get;set;}
    public string email{get;set;}
    public contact con{get;set;}
    public Id x{get;set;}
    


    
    public livecodingtask32helper(){
        acclistvalue=false;
          newconvisible=false;
        newconlist=false;
    }
  
    public  pagereference SearchCon(){
        
        newconlist=false;
        conlist=[select id, name,email from contact where account.name=:accname];
       
        
        
        if(conlist.size()>0){
            acclistvalue=true;
        }
        
        if(conlist.size()==0){
            acclistvalue=false;
            newconvisible=true;
            apexpages.addMessage(new apexpages.Message(apexpages.Severity.ERROR,'contact records list is zero with particular account name'));
        }
        return null;   
    }
    public  void newcon(){
        system.debug('new con');
         if(conlist.size()==0){
            newconlist=true;
         }
             lastname=null;
             email=null;
        
       
    }
   
    
    public pagereference savecon(){
        newconlist=false;
         newconvisible=false;
        account acc=[select id,name from account where name=:accname limit 1];
        system.debug('account is'+acc);
         con= new contact();
        con.accountid=acc.id;
        con.lastname=lastname;
        con.email=email;
       
        insert con;
        
        conlist=[select id,name,email from contact where accountid=:con.accountid];
        
          if(conlist.size()>0){
            acclistvalue=true;
        }
        
        system.debug('contact is '+con);

     
        return null;
        
       
    }
    
    
    public pagereference deletecon(){
        
        con=[select id,name,email,accountid from contact where id=:x limit 1];
       delete con;
          conlist=[select id,name,email from contact where account.name=:accname];
         
          if(conlist.size()>0){
            acclistvalue=true;
        }
        
        if(conlist.size()==0){
            newconvisible=true;
            acclistvalue=false;
        }
       // acclistvalue=false;
        return null;
    }
    
   
    
}