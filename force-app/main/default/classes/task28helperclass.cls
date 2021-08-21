public class task28helperclass {

    public string selectedact{set; get;}
    public string accname{set;get;}
    public static List<opportunity> opplist{get;set;}
    
    public  void task28(){

     
         opplist=[select id, name, ownerid from opportunity where id =:accname];
        
          for(opportunity o:opplist){
          system.debug('before updating opportunity owner is'+o.OwnerId);
            
        }
        for(opportunity o:opplist){
            o.ownerid=selectedact;
            
        }
        update opplist;
          for(opportunity o:opplist){
          system.debug('after updating opportunity owner is'+o.OwnerId);
            
        }
        
        
    } 
        
}