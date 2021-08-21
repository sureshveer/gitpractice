public class LiveCodingMay_21 {
    
    //method to find number of times the contact is updated
    public static void task6(List<contact> con){
        
           Set<Id> conidlist=new Set<Id>();
         for(Contact c:con){
             conidlist.add(c.AccountId);
         }
        
        try{
        //this query  will give all the contacts which are updated
        List<account> act=[select id,name,NONoOfTimesContactUpdated__c,(select Accountid,name from contacts) from Account where id in :conidlist];
        
            for(Account a:act){
                 for(Contact c:con){
                if(a.Id==c.AccountId ){
                a.NONoOfTimesContactUpdated__c= a.NONoOfTimesContactUpdated__c+1;
                    //it will update NONoOfTimesContactUpdated__c field each time when contact is updated to particular account
                }
            }
            update act;
        }
       }
        catch(Exception e){
        System.debug('The following exception has occurred: ' + e.getMessage());

        }
        
    }
    
   //task 7
//it will retrieve given  no of contacts for particular account and update the account name with actual name concating with total no of contacts

    public static void task7(integer n){
        try{
             //it will fetch all account id's from account
            List<contact> con=[select id from contact];

              Set<Id> conidlist=new Set<Id>();
         for(Contact c:con){
             conidlist.add(c.AccountId);
         }         
          
             // it will fetch all the contacts,account name,id fro particular account based on id 
        List<Account> act=[select name,(select id,name from contacts limit :n ) from Account where id in :conidlist];
        
         system.debug(' after  updating account name in the list is'+act);
        system.debug('contats size is'+act.get(0).contacts.size());
        system.debug('n value is'+n);
        for(Account a:act){
            a.name=a.name+a.contacts.size();
             // it will concatenate the account name with total number of contacts fpr that account
        }
        update act;
        system.debug('-----------------------------------');
        system.debug(' after  updating account name in the list is'+act);
            
    }
        catch(Exception e){
        System.debug('The following exception has occurred: ' + e.getMessage());

        }
    }


}