@istest
public class TestJuly16code {

     static testMethod void task10Testing(){
         List<Account> acclist= new List<Account>();
         for(integer i=0;i<11;i++){
        Account a = new Account(Name='July16code testing'+i);
            acclist.add(a); 
         }
        insert acclist;
        
         
         List<case> caselist= new List<case>();
          for(integer i=1;i<=10;i++){
             
              	Case c1 =new Case(Priority='High',AccountId=acclist.get(i).id,Origin='Web');
              
              caselist.add(c1);
              
          }
         system.debug('caselist is'+caselist);
          for(integer i=1;i<=10;i++){
               Case c2 =new Case(Priority='Medium',AccountId=acclist.get(i).id,Origin='Web');
               caselist.add(c2);
          }
          for(integer i=1;i<=10;i++){
               Case c3 =new Case(Priority='Low',AccountId=acclist.get(i).id,Origin='Web');
               caselist.add(c3);
          }
         insert caselist;
       
      
        Account actual=[SELECT Name,lowprioritycases__c,Highprioritycases__c,mediumprioritycases__c FROM Account WHERE Id in :acclist LIMIT 1];
        
        System.assertEquals(2, actual.lowprioritycases__c);
        System.assertEquals(2, actual.Highprioritycases__c);
        System.assertEquals(2, actual.mediumprioritycases__c);
    }
    
}