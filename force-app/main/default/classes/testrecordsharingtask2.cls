@istest
public class testrecordsharingtask2 {

    @istest
    public static void test1(){
        Account a=new Account();
        a.Name='cloudtaruabc';
        a.sharerecords__c='suresh veeramalla';
        insert a;
        
        
        
         Test.startTest();
        integer count=[select count() from account where ownerId='0052w000002rvs4AAA'];
      system.debug('count'+count);
        System.assertEquals(1, count);
        
       
       
        integer count1=[select count() from account where ownerId='0052w000002sKQKAA2'];
      system.debug('count1'+count1);
        System.assertEquals(0, count1);
        Test.stopTest();
    }
}