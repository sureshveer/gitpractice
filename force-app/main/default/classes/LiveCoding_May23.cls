public class LiveCoding_May23 {
    
    public static void task10(List<Account> acc){
        set<id> accidlist=new Set<id>();
        for(Account a:acc){
            accidlist.add(a.id);
        }
        try{
            List<Account> acct= [select name,(select Subject from cases where status='new') from account where id in:accidlist];
            map<String,List<case>> m= new map<String,List<case>>();
            for(Account a:acct){
                m.put(a.name,a.cases);
            }
            
            Set<String> s=m.keyset();
            for(String a:s){
                system.debug('-------------------------------------');
                system.debug('Account name is+' +a +'cases are'+m.get(a)); 
                // system.debug('Account name'+a+'have '+m.get(a).size()+'cases');
                system.debug('-------------------------------------');
            }  
            
        }
        catch(Exception e){
            System.debug('The following exception has occurred: ' + e.getMessage());
            
        }
        
    }
    
    
    //Live coding task 11(After update trigger task)
    public static void AfterUpdatetask11(List<Case> caseslist){
        
        set<id> caseidlist=new Set<id>();
        for(Case c:caseslist){
            caseidlist.add(c.accountid);
        }
        try{
            List<Account> act=[select id,name,No_Of_ClosedCases__c,(select Accountid,subject,status from cases where status='closed') from Account where id in :caseidlist];
            
            // map<Account,List<case>> m= new map<Account,List<case>>();
            // for(Account a:act){
            //        m.put(a,a.cases);
            //  }
            
            
            
            for(Account a:act){
                for(case c:a.cases){
                    a.No_Of_ClosedCases__c=a.cases.size();
                    if(c.Status=='closed' && a.id == c.AccountId){
                        a.No_Of_ClosedCases__c=a.No_Of_ClosedCases__c+1;
                    }    
                }
                update act;
            }
        }
        catch(Exception e){
            System.debug('The following exception has occurred: ' + e.getMessage());
            
        }
        
    }
}