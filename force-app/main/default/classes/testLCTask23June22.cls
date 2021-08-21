@istest
public class testLCTask23June22 {

     public static List<Account> addrecordstestsetup(){
         // List<account>  act = [select name, Phone,AnnualRevenue,industry from Account where account.industry='energy'];
         List<Account> actlist= new List<Account>();
         
         
         for(integer i=0;i<10;i++){
              actlist.add(new Account(name='suresh'+i,phone='94942015'+i,industry='energy')); 
                          
          }
          insert actlist;
          return actlist;
      }
    
     public static List<opportunity> addopprecordstestsetup(){
         // List<account>  act = [select name, Phone,AnnualRevenue,industry from Account where account.industry='energy'];
         List<Opportunity> opplist= new List<Opportunity>();
         
         
         for(integer i=0;i<10;i++){
              opplist.add(new Opportunity(name='suresh'+i,amount=2500,description='this is opportunity')); 
                          
          }
          insert opplist;
          return opplist;
      }
    
    
    
    
    
    @istest
    public static void teastlvctask23(){
        List<account> acclist1= testLCTask23June22.addrecordstestsetup();
        LCTask23June22.createmap(acclist1);
    }
    
     @istest
    public static void teastlvctask24(){
        List<Opportunity> opplist1= testLCTask23June22.addopprecordstestsetup();
        ApexLCTask24.task24(opplist1);
    }
}