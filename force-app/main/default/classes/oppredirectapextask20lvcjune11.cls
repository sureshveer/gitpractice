public class oppredirectapextask20lvcjune11 {

    public opportunity opprecord{get;set;}
    public string modestate{get;set;}
    
   // public string datamode{get;set;}
    
    public oppredirectapextask20lvcjune11(){
        modestate='detail';
        id  y=apexpages.currentPage().getparameters().get('id');
       system.debug('y value is'+y);
        opprecord=[select id,name,amount from opportunity where id=:y limit 1];
    }
    
    public void editopp(){
         modestate='edit';
    }
    
     public pagereference deleteopp(){
        delete opprecord;
         pagereference page= new pagereference('/apex/vftask20LVCJune11');
        page.setRedirect(true);
        return page;
    }
    public pagereference saveopp(){
       
        update opprecord;
         pagereference page= new pagereference('/apex/vftask20LVCJune11');
        page.setRedirect(true);
        return page;
    }
    
     public pagereference cancelopp(){
       
       
         pagereference page= new pagereference('/apex/vftask20LVCJune11');
        page.setRedirect(true);
        return page;
    }
}