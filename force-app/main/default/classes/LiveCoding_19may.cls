public class LiveCoding_19may {

    public static void getacctcontact_task1(List<Account> acc){

        
         Set<Id> accidlist=new Set<Id>();
         for(Account a:acc){
             accidlist.add(a.Id);
  
         }
       List<Account> acclist=[select name,createdDate,(select name from contacts) from Account where id in:accidlist];
         system.debug('list is'+acclist);
        for(Account a:acclist){
 
           Datetime d1= a.CreatedDate.addDays(-10);
            if( a.CreatedDate >= d1){
              system.debug('Related contacts are'+a.contacts+'created date is'+a.CreatedDate);
             }
        
    }
    }
        
        public static void getacctcontact_task2(){

            List<Account> acts=[select Id,name,CreatedDate from Account where Id not In (select AccountId from Contact) ORDER By Account.CreatedDate Desc limit 100];
              
            for(integer i=0;i<acts.size();i++){
                system.debug('Account name is'+acts.get(i).name+'created date is'+acts.get(i).createdDate);
            }            
    }
     public static void getacctcontact_task3(){

            //   List<opportunity> opplist=[select id from opportunity];
             Date minus90Days = Date.today().addDays(-90);
            List<Account> acts=  [select name,(select name from opportunities) from Account where account.createddate >=:minus90Days ORDER By Account.CreatedDate Desc limit 25];     
         system.debug('testing');
           system.debug('acts size is'+acts.size());
            for(integer i=0;i<acts.size();i++){
                system.debug('List of opportunities are '+acts.get(i).opportunities);
            }            
    }

}