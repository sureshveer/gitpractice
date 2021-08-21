public class livecodingtask2helper {

     public string accname{get;set;}
     public Boolean opplistvalue{get;set;}
     public Boolean updateopplist{get;set;}
    public opportunity opp{get;set;}
    public List<opportunity> opplist{get;set;}
    public id x{get;set;}
     public id y{get;set;}
    
    public string name{get;set;}
    public decimal  amount{get;set;}
    
    public livecodingtask2helper(){
         opplistvalue=false;
        updateopplist=false;
    }
    
    public pagereference SearchOpp(){
       

        opplist=[select id,name,amount from opportunity where account.name=:accname];
        if(opplist.size()>0){
            opplistvalue=true;
        }
        
        
           if(opplist.size()==0){
            opplistvalue=false;
            
            apexpages.addMessage(new apexpages.Message(apexpages.Severity.ERROR,'opportunity records list is zero with account name'+' '+accname));
        }
        return null;
    }
    
    public pagereference deleteopp(){
        
        opp=[select id,name,amount,accountid from opportunity where id=:x limit 1];
       delete opp;
          opplist=[select id,name,amount from opportunity where account.name=:accname];
         
          if(opplist.size()>0){
            opplistvalue=true;
        }
        
       
       // acclistvalue=false;
        return null;
    }
    
    public pagereference updateopp(){
        opplistvalue=false;
        updateopplist=true;
        opp=[select id,name,amount from opportunity where id=:y ];
        name=opp.name;
        amount=opp.amount;
        return null;
    }
    
    public pagereference saveopp(){
        updateopplist=false;
        opp=[select id,name,amount from opportunity where id=:y ];
        
        opp.Name=name;
        opp.amount=amount;
        update opp;
        
         opplist=[select id,name,amount from opportunity where account.name=:accname];
        
        if(opplist.size()>0){
            opplistvalue=true;
        }
        return null;
        
    }
    
}