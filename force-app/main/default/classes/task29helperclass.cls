public class task29helperclass {
    
    public  string selectedact{get;set;}
    public  List<selectoption> accindustryratinglist {get;set;}
    public  List<account> acctlist {get;set;}   
    public  List<contact> contlist {get;set;}
    public  List<opportunity> opplist {get;set;}
    
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
        
        acctlist=[select id, name,industry,rating from account where id=:selectedact];
        contlist=[select id, name,email from contact where accountid=:selectedact]; 
        opplist=[select id, name from opportunity where accountid=:selectedact]; 
       
        system.debug('account is '+acctlist);
        system.debug('contact is'+contlist);
        system.debug('contact is'+opplist);
        return null;
    }
}