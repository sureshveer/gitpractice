public class task10helperclass {

    public static String AccountName{get;set;}
    public static List<Account> acct{get;set;}
     
    public task10helperclass(){
        
    string   searchacctname=apexpages.currentPage().getparameters().get('AccountName');
        if(searchacctname!=' '){
            
            AccountName=searchacctname;
            task10();
        }
    }
    
    public static pagereference task10(){
        system.debug('acc name is'+AccountName);
     acct=[select id, name,industry,rating from Account where account.name like ':AccountName%'];
            system.debug('acct is'+acct);
        return null;
    }
}