public class LiveCodingMay_20 {

    public static void task1(List<opportunity> opps){
         Set<Id> oppidlist=new Set<Id>();
         for(Opportunity opp:opps){
             oppidlist.add(opp.AccountId);
         }
        
        //query to fetch the all the details of account whose record id is equal to opportunity id
        List<Account> acc= [select id,name,RevenueGenerated__c,(select amount from opportunities) from Account where id in :oppidlist];
           
        Set<Id> accidlist=new Set<Id>();
         for(Account a:acc){
             accidlist.add(a.Id);
         }   
        
        List<opportunity> opp=[select amount,Accountid from opportunity where Accountid in:accidlist];
        
            for(Account a:acc){
                for(Opportunity o:opp){
                   if(o.stagename=='closed won'  && o.AccountId==a.Id){
                       a.RevenueGenerated__c=o.amount;
            }
            }
        }
    }
    
    
    //method to get all the acccounts for each contact where lead status is web and put accname and list of opportunities in map
    public static void task2(List<contact> con){
       
        
        Set<Id> conidlist=new Set<Id>();
         for(Contact c:con){
             conidlist.add(c.AccountId);
         }
        
        List<account> acc= [select id,name from account where id in (select accountid from contact where leadsource='web')  ];
        
                Set<Id> accidlist=new Set<Id>();
         for(Account a:acc){
             accidlist.add(a.Id);
         }
       
        
        LIst<opportunity> opp=[select name from opportunity where accountid in:accidlist];
        
        map<string,List<opportunity>> m= new map<string,List<opportunity>>();
        for(Account a:acc){
            m.put(a.name,opp);
        }
        system.debug('map is'+m);
        
        
        
    }
    
    
}