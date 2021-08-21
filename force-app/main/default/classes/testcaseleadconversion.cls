@istest
public class testcaseleadconversion {
    
     @testsetup
    public static void setup(){
    
         //scenario1
        lead l= new lead();
        l.LastName='task1';
        l.Company='cloud123';
        l.Phone='9856231456';
        l.Email='svsuresh8@cloud123.com';
        insert l;
        
         //scenario2
        lead l1= new lead();
        l1.LastName='task2';
        l1.Company='cloudtaruabc';
        l1.Phone='985533535';
        l1.Email='svsuresh2332@cloud123.com';
        insert l1;
     
    }
    
    @istest
    public static void testleadconversion(){
        try{
       lead l=[select id,name,lastname from lead where lastname='task1'];
        system.debug('l'+l.Id);
        Test.startTest();
        apexleadconversion con= new apexleadconversion();
        con.x=l.Id;
    
        con.leadconversionfunction();
        integer count=[select count() from account where domainname__c='@cloud123.com'];
        integer concount=[select count() from contact ];
        System.assertEquals(1, count);
        system.assertEquals(1, concount);
        
       
        lead l1=[select id,name,lastname from lead where lastname='task2'];
         apexleadconversion con1= new apexleadconversion();
        con1.x=l.Id;
        con1.leadconversionfunction();
         integer count1=[select count() from account where domainname__c='@cloud123.com'];
         integer concount1=[select count() from contact ];
        System.assertEquals(1, count1);
        system.assertEquals(2, concount1);
        
        
         Test.stopTest();
        }
        catch(Exception e){
             system.debug('e'+e);
        }
        
        
    
    }
      
   

}