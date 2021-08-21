public class vftask4helperclass {
    
    public static List<account> acct{get;set;}
    
    public vftask4helperclass(Apexpages.StandardController controller){
        task4();
    }
    public static pagereference task4(){
        acct=[select id, name,AnnualRevenue,AccountNumber,Industry,Description from account where Active__c='yes' and AnnualRevenue>10000 ];
        system.debug('acct size is'+acct.size());
        system.debug('acct is'+acct);
        return null;
    }
    
}