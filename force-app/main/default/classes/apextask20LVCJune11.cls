public class apextask20LVCJune11 {

    public string accname{get;set;}
    public List<contact>  conlist{get;set;}
    public List<opportunity>  opplist{get;set;}
    public id x{get;set;}
   public id y{get;set;}
    
    public void showcontacts(){
        
        if(opplist!=null){
            opplist.clear();
        }
       
        try{
             if(accname!=null  && accname!=' '){
        conlist=[select id,name,email,contact.account.name from contact where contact.account.name=:accname];
             }  
      
        }
        catch(Exception e){
            system.debug('Exception is'+e);
            apexpages.addMessages(e);
        }
        
        if(conlist.size()==0){
        apexpages.addMessage(new apexpages.Message(apexpages.Severity.ERROR,'contact records list is zero with particular account name'));
        }
        system.debug('conlist is'+conlist);
        
        
    }
    
    public void showopps(){
        
         if(conlist!=null){
            conlist.clear();
        }
        
        
        try{
            if(accname!=null && accname!=' '){
        opplist=[select id, name,amount,description from opportunity where opportunity.account.name=:accname];
            }
        }
        catch(Exception e){
            system.debug('Exception is'+e);
            apexpages.addMessages(e);
        }
        
        if(opplist.size()==0){
        apexpages.addMessage(new apexpages.Message(apexpages.Severity.ERROR,'opportunity  records list is zero with particular account name'));
        }
        system.debug('opplist is'+opplist);
    }
   
    
   
    public pagereference showdetails(){
        system.debug('checking');
       system.debug('x is'+x);
         pagereference page= new pagereference('/apex/redirectvflvctask20');
         page.getParameters().put('id',x);
        page.setRedirect(true);
        return page;
        
    }
    
    public pagereference showdetailsopps(){
        system.debug('checking');
       system.debug('y is'+y);
         pagereference page= new pagereference('/apex/oppredirectvflvctask20');
         page.getParameters().put('id',y);
        page.setRedirect(true);
        return page;
        
    }
    
   
}