public class apextask10livecodingjune10 {

    public string accname{get;set;}
     public string selectedstatus{get;set;}
   //  public List<selectoption> statuslist{get;set;}
    public List<case> caselist{get;set;}
    
   
    
    public id x{get;set;}
 
    public List<SelectOption> getcasestatuslist(){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption(' ',' '));
        Schema.DescribeFieldResult fr = case.status.getDescribe();
        List<Schema.PicklistEntry> ple = fr.getPicklistValues();
        for(Schema.PicklistEntry p:ple){
            options.add(new SelectOption(p.getValue(),p.getValue()));
        }
        return options;
    }
    
    public void showrecords(){
        
        system.debug('accname is'+accname);
        system.debug('status is'+selectedstatus);
     
        try{
             if(accname!=null  && accname!=' '){
                caselist=[select id,status,type,case.account.name,accountid from case where  case.account.name=:accname and status=:selectedstatus];
             }  
      
        }
        catch(Exception e){
            system.debug('Exception is'+e);
            apexpages.addMessages(e);
        }
        
        if(caselist.size()==0){
        apexpages.addMessage(new apexpages.Message(apexpages.Severity.ERROR,'cases are not available with given accname and status'));
        }
        
       system.debug('caselist is'+caselist);
        
    }
    
     public pagereference show(){
        
        
       pagereference page= new pagereference('/apex/vfcasepage');
         page.getParameters().put('id',x);
        page.setRedirect(true);
        return page;
        
    }
}