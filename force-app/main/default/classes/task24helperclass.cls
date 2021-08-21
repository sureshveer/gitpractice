public class task24helperclass {

    public List<account> staticacclist{get;set;}
    public string accname{get;set;}
     public string accphone{get;set;}
     public string accrating{get;set;}
     public string accindustry{get;set;}
    public   List<selectoption> accindustrylist {get;set;}
    public   List<selectoption> accratinglist {get;set;}
    public List<account> dynamicacclist{get;set;}
  
    
    public  task24helperclass(){

        staticacclist=[select name,phone,rating,industry from account];
           }
    
      public List<selectoption> getindustry(){
  
        List<account> acclist=[select id, name,industry, rating from account];
    accindustrylist= new List<selectoption>();
        accindustrylist.add(new SelectOption('None','--- None ---')); 
        
    for(Account a:acclist){
        
        if(a.industry!=null){
        accindustrylist.add(new selectOption(a.id,a.industry));
       
           }
    }
        return accindustrylist;
    }
    
    public List<selectoption> getrating(){
  
        List<account> acclist=[select id, name,industry, rating from account];
    accratinglist= new List<selectoption>();
        accratinglist.add(new SelectOption('None','--- None ---')); 
        
    for(Account a:acclist){
        
        if(a.rating!=null){
        accratinglist.add(new selectOption(a.id,a.industry));
       
           }
    }
        return accratinglist;
    }
    
    
    public pagereference getaccts(){
        staticacclist.clear();
        if(accname!=null || accphone != null || accrating!=null || accindustry!=null ){
       dynamicacclist=[select name,phone,rating,industry from account where name=:accname or phone=:accphone or rating=:accrating or industry=:accindustry];
       system.debug('aynamic acclist is'+dynamicacclist);
        }
       return null; 
    }
    
}