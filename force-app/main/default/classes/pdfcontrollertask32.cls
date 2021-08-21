public class pdfcontrollertask32 {

      public List<opportunity>  oppList{get;set;}
     public List<Account>  accList{get;set;}
    public pagereference pdfbutton(){
        
        pagereference p= new Pagereference('/apex/redirectvftask32');
        p.setRedirect(true);
        return p;
    }
    
    public pdfcontrollertask32(){
       opplist=[select id,name,stagename,opportunity.account.name from opportunity];
        set<id> idlist=new set<id>();
        for(opportunity opp:opplist){
             idlist.add(opp.accountid);
        }
        acclist=[select id, name from account where id in :idlist];
    }
}