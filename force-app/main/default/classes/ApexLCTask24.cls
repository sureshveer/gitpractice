public class ApexLCTask24 {

    
    public static void task24(List<Opportunity> opplist){
        set<Id> oppaccidlist= new set<ID>();
        for(Opportunity opp:opplist){
            oppaccidlist.add(opp.accountid);
        }
        map<Id,Account> m= new  map<Id,Account>
        ([select id,name,AccountNumber,(select id,name,OrderNumber__c from opportunities) from account where id in :oppaccidlist]);
       
        List<opportunity> opplist1=[select id,name,OrderNumber__c,accountid from opportunity where accountid in :oppaccidlist];
        
        for(opportunity opp:opplist1){
            if(opp.OrderNumber__c==null){
                opp.OrderNumber__c=m.get(opp.accountid).AccountNumber+opplist1.size();
            }
        }
       

    }
}