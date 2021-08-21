public class apexvfbasic32 {

    public string oppname{get;set;}
    public decimal oppamount{get;set;}
    public date oppclosedate{get;set;}
    public string oppstagename{get;set;}
    
    public  apexvfbasic32(Apexpages.StandardController stdcontroller){
   //  saveopp();
    }
    
    public void saveopp(){
        system.debug('Before insert opplist');
        opportunity opp=new opportunity();
        opp.name=oppname;
        opp.Amount=oppamount;
        opp.CloseDate=oppclosedate;
        opp.StageName=oppstagename;
      system.debug('opplist'+opp);
        insert opp;
    }    
}