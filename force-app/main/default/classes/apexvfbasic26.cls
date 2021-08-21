public class apexvfbasic26 {

    public List<Account> acclist{get;set;}
    
    public apexvfbasic26(){
    acclist=[SELECT Id, Name,LastViewedDate FROM account WHERE LastViewedDate !=null ORDER BY LastViewedDate DESC limit 10];
    }
}