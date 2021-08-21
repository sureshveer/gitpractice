public class redirectapextask20lvcjune11 {

    
    public contact conrecord{get;set;}
    public string modestate{get;set;}
    
   // public string datamode{get;set;}
    
    public redirectapextask20lvcjune11(){
        modestate='detail';
        id  x=apexpages.currentPage().getparameters().get('id');
       system.debug('x value is'+x);
         conrecord=[select id,name,email from contact where id=:x limit 1];
    }
    
    public void editcon(){
         modestate='edit';
    }
    
     public pagereference deletecon(){
        delete conrecord;
         pagereference page= new pagereference('/apex/vftask20LVCJune11');
        page.setRedirect(true);
        return page;
    }
    public pagereference savecon(){
       
        update conrecord;
         pagereference page= new pagereference('/apex/vftask20LVCJune11');
        
        page.setRedirect(true);
        return page;
    }
    
     public pagereference cancelcon(){
       
       
         pagereference page= new pagereference('/apex/vftask20LVCJune11');
        page.setRedirect(true);
        return page;
    }
    
}