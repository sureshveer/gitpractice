public class task25helperclass {
    
     public string selectedindustry{get;set;}
    public List<Account> accts{get;set;}
  
    public   List<selectoption> accindustrylist {get;set;}
    
   
    public List<selectoption> getindustry(){
  
        List<account> acclist=[select id, name,industry, rating from account];
    accindustrylist= new List<selectoption>();
        accindustrylist.add(new SelectOption('None','--- None ---')); 
        system.debug('acclist is'+acclist);
    for(Account a:acclist){
        
        if(a.industry!=null){
        accindustrylist.add(new selectOption(a.id,a.industry));
            system.debug('accid '+a.id+' '+'industry is'+a.Industry);
            system.debug('---------------------------------------');
        
           }
    }
        
        system.debug('account industry list'+accindustrylist);
        
        accts=[select id, name,industry,rating from account where id =:selectedindustry];
       system.debug('selected industry is'+selectedindustry);
        system.debug('accts is '+accts);
        return accindustrylist;
    }
    
}