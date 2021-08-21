public class task30helperclass {

    public string selectedact{get;set;}
  
    public   List<selectoption> accindustryratinglist {get;set;}
   
    public  List<account> acct {get;set;}
   
   public  List<contact> cont {get;set;}
    
    
    public List<selectoption> getindustryandrating(){
  
        List<account> acclist=[select id, name,industry, rating from account];
    accindustryratinglist= new List<selectoption>();
        accindustryratinglist.add(new SelectOption('None','--- None ---')); 
        
    for(Account a:acclist){
        
        if(a.industry!=null && a.Rating !=null){
        accindustryratinglist.add(new selectOption(a.id,a.industry));
        accindustryratinglist.add(new selectOption(a.id,a.rating));
           }
    }
        return accindustryratinglist;
    }
    
    
    
    public pagereference accts(){
        
        acct=[select id, name,industry,rating from account where id=:selectedact];
        cont=[select id, name,email from contact where accountid=:selectedact];     
        system.debug('account is '+acct);
        system.debug('contact is'+cont);
        return null;
    }
}