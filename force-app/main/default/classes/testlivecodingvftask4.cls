@istest
public class testlivecodingvftask4 {

    @testsetup
    public static void setup(){
        account acc=new account(name='suresh');
        insert acc;
        List<opportunity> opplist=new List<opportunity>();
        for(integer i=1;i<=2;i++){
            opplist.add(new opportunity(accountid=acc.id,name='suresh'+i,stagename='closed'+i,closedate=Date.today()+i));
        }
        insert opplist;
        
    } 
    
    @istest
    public static void testvflivetask4(){
        account acc=[select id,name from account limit 1];
        apexlivecodingtask4june26 controller=new apexlivecodingtask4june26();
        controller.accname=acc.name;
       // List<opportunity> opplist1=[select id,name from opportunity where account.name=:acc.name];
       // controller.opplist=opplist1;
      //  controller.opplistvalue=false;
        controller.Searchopp();
        controller.deleteopp();
       
         system.assertEquals(acc.Name, controller.accname);
        
        controller.accname='kalyan';
     //   List<opportunity> opplist2=[select id,name from opportunity where account.name='kalyan'];
     //   controller.opplist=opplist2;
         controller.acctwrapperlist.get(0).selected=true;
         controller.Searchopp();
        controller.deleteopp();
        system.assertEquals(acc.Name, controller.accname);
        
    }
}