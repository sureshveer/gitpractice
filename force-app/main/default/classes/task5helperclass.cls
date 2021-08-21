public class task5helperclass {

    public  String AccountName{get;set;}
    public  decimal AccountAnnualRevenue{get;set;}
    public  String AccountSource{get;set;}
    public  List<Account>  acct{get;set;}
   

       
    
    public  pagereference task5(){
          
        system.debug('Account name is'+accountname);
        system.debug('Source is'+AccountSource);
      //  system.debug('revenue is'+AccountAnnualRevenue);
          // AccountName=apexpages.currentPage().getparameters().get('AccountName');
    //    acct=[select id,name,AnnualRevenue,AccountNumber,Industry,Description from account where AnnualRevenue>=:AccountAnnualRevenue or name=:AccountName or AccountSource=:AccountSource ];
        if(accountname!=null || AccountSource!=null ||  AccountAnnualRevenue!=null){
               acct=[select id,name,AnnualRevenue,AccountNumber,Industry,Description,AccountSource from account where name=:AccountName 
                                or AccountSource=:AccountSource or annualrevenue > :AccountAnnualRevenue ];
       
             system.debug('acct is'+acct);
             system.debug('acct size is'+acct.size());
          
        }
         return null; 
    }
}