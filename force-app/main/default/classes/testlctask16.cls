@istest
public class testlctask16 {

      @istest
    public static void testvflivetask16(){
        List<Account> acclist= new List<Account>();
        for(integer i=1;i<=20;i++){
            acclist.add(new Account(name='rahul'+i));
        }
        insert acclist;
        List<contact> conlist= new List<Contact>();
        for(integer i=1;i<=19;i++){
            conlist.add(new contact(lastname='veerrahul'+i,accountid=acclist.get(i).id,email='kumar@gmail.com'));
        }
        insert conlist;
    
        Test.startTest();
        apexlivecodingjune9task16 vftask16= new apexlivecodingjune9task16();
    
        vftask16.con.lastname='suresh';
        vftask16.con.email='svsuresh@gmail.com';    
        vftask16.insertcontact();
        vftask16.getconlist();
            
        system.assertEquals(10, vftask16.conlist1.size());
        Test.stopTest();
        
    
    }
}