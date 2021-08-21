@istest
public class Testapexlcjuly28 {

    @istest
    public static void testtask19(){
        Account a =new Account(name='kumar');
        insert a;
        contact c= new contact(lastname='veer',accountid=a.id);
        insert c;
        product2 p= new product2(name='prod1');
        insert p;
        List<Asset> assetlist= new List<Asset>();
        for(integer i=1;i<=10;i++){
            assetlist.add(new asset(name='asset1',AccountId=a.id,ContactId=c.id,Product2Id=p.id,status='paymentpending'));
        }
        insert assetlist;
        
        Test.startTest();
        List<Asset> a1=[select id,name from asset where status='paymentpending'];
       List<Asset> a2=apexlcjuly28.task19(a1);
       
        Test.stopTest();
    }
}