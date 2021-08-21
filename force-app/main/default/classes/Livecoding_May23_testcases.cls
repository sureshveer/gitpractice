@istest
public class Livecoding_May23_testcases {
    
    public static List<Account> addrecordstestsetup(){
         // List<account>  act = [select name, Phone,AnnualRevenue,industry from Account where account.industry='energy'];
         List<Account> act= new List<Account>();
          integer NumberOfEmployees=5000;
          integer AnnualRevenue=500000;
         
            for(integer i=0;i<10;i++){
              act.add(new Account(name='suresh'+i,phone='94942015'+i,industry='energy',NumberOfEmployees=NumberOfEmployees,AnnualRevenue=AnnualRevenue)); 
              NumberOfEmployees=NumberOfEmployees+1000;
              AnnualRevenue=AnnualRevenue+100;                  
          }
          insert act;
          return act;
      }
    
    public static List<case> addcasestestsetup(){

        List<case> li= new List<case>();
        for(integer i=0;i<5;i++){
            li.add(new case(Accountid='456465'+i));
        }
        
        insert li;
        return li;
    } 

    @istest
    public static void task10testcase(){

        List<Account> act=Livecoding_May23_testcases.addrecordstestsetup();
            LiveCoding_May23.task10(act);
    
    } 
    @istest
    public static void task11testcase(){

        List<Case> cases=Livecoding_May23_testcases.addcasestestsetup();
            LiveCoding_May23.AfterUpdatetask11(cases);
    
    } 
    
    
}