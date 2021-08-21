public class apextask14livecodingjune8 {

    public string selectedleadsource{get;set;}
     public string oppname{get;set;}
    public List<selectoption> options{get;set;}
    public List<opportunity> opplist{get;set;}
    
    public List<selectoption> getLeadsourceitems(){

        List<opportunity> opplist=[select name,leadsource from opportunity];
        options= new List<selectoption>();
        options.add(new selectoption('--None--','--None--'));
        for(opportunity o:opplist){
            if(o.leadsource!=null){
         options.add(new selectoption(o.leadsource,o.leadsource));
            }
        }
        return options;
    }
    
    public pagereference  show(){
        system.debug('checking');
        if(selectedleadsource.length()==0 || oppname.length()==0){
           
            apexpages.addMessage(new apexpages.Message(apexpages.Severity.ERROR,'pls enter valid data'));
            
        //    system.debug('msg is'+apexpages.Message);
           // selectedleadsource.addError('selectedleadsource cannot be blank');
           // oppname.addError('name cannot be blank');
        }
        
        opplist=[select name,leadsource from opportunity where leadsource=:selectedleadsource or name=:oppname ];
        for(opportunity o:opplist){
            if(o.LeadSource!=selectedleadsource || o.Name!=oppname){
                apexpages.addMessage(new apexpages.Message(apexpages.Severity.ERROR,'no records with the '+oppname+'given'));
            }
        }
         return null;
    
    }
    
   
    
}