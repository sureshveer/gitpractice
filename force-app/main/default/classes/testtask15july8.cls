@istest
public class testtask15july8 {

    
     @istest
    public static void testvflivetask15(){
        
        List<Account> acclist= new List<Account>();
        for(integer i=1;i<=200;i++){
        account acc=new account(name='suresh'+i,Type='customer'+i);
        acclist.add(acc);
        }
        insert acclist;
    
       List<Task15June8demo> controllerlist= new List<Task15June8demo>();
        Task15June8demo vftask15=new Task15June8demo();
         Test.startTest();
        //scenario 1 
     
           vftask15.searchName='suresh1';
            vftask15.show();
            vftask15.selectedAcctId=acclist.get(0).id;
            vftask15.editRecord();
              vftask15.getAccTypeList();
            vftask15.acc.name= 'customer';
            vftask15.saveacc();
           system.assertEquals(1, vftask15.sortedAccts.size());
        
        
        //scenario 2
         vftask15.searchName='kumar';
            vftask15.show();
         system.assertEquals(0, vftask15.sortedAccts.size());
      
        //scenario 3
       vftask15.searchName='';
           
            vftask15.show();
         system.assertEquals(0, vftask15.searchName.length());
      
       
        Test.stopTest();
    
    }
}