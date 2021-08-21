@istest
public class testlctask20 {

     @istest
    public static void testvflivetask20(){
      /*  List<Account> acclist= new List<Account>();
        for(integer i=1;i<=20;i++){
            acclist.add(new Account(name='rahul'+i));
        }
        insert acclist;
        system.debug('acclist'+acclist);
        List<contact> conlist= new List<Contact>();
        for(integer i=1;i<=19;i++){
            conlist.add(new contact(lastname='veerrahul'+i,accountid=acclist.get(i).id,email='kumar@gmail.com'));
        }
        insert conlist;
        
        system.debug('conlist is'+conlist);
             */
        
        Account a= new Account(name='karthik');
        insert a;
        contact con=new Contact(Accountid=a.id,Lastname='veer');
        insert con;
        test.startTest();
        
        //scenario 1
       
        SaiKiran_Task20_Class1 vftask20= new SaiKiran_Task20_Class1();
            vftask20.accname='karthik';
            vftask20.showcontacts();
         system.assertEquals(1,vftask20.conlist.size());
         vftask20.x=con.id;
      //   vftask20.showDetails();
        Test.setCurrentPage(vftask20.showDetails());
         system.assertEquals(con.id,vftask20.x);
        SaiKiran_Task20_class2 vftask20class2=new SaiKiran_Task20_class2();
       // vftask20class2.conid=con.id;
            vftask20class2.Editrecord();
            vftask20class2.updaterecord();   
              vftask20class2.previouspage();
             vftask20class2.deleterecord();
         vftask20.accname='karthik';
            vftask20.showcontacts();
         system.assertEquals(0,vftask20.conlist.size());
      
        
       
        
      //scenario 2
         vftask20.accname='dattu';
            vftask20.showcontacts();
         system.assertEquals(0, vftask20.conlist.size());
      
        //scenario 3
      vftask20.accname='';
           
          vftask20.showcontacts();
         system.assertEquals(0, vftask20.conlist.size());
          Test.stopTest();
}
}