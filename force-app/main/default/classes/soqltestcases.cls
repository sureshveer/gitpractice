@isTest
public class soqltestcases {

      
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
    

       @isTest
      static void testtask1(){
       //  List<account>  act1 = [select name, Phone,industry,NumberOfEmployees from Account where Account.industry='energy'];
        
          List<Account> act=soqltestcases.addrecordstestsetup();
            List<account>  result=Dmlandsoqlprgms.task1();
     
           System.assertEquals(act.get(0).name,result.get(0).name);
      }
    
     @isTest
      static void testtask2(){
            List<Account> act=soqltestcases.addrecordstestsetup();
            List<account>  result=Dmlandsoqlprgms.task2();
      
           System.assertEquals(act.size(),result.size());
      }
    
     @isTest
      static void testtask3(){
            List<Account> act=soqltestcases.addrecordstestsetup();
            List<account>  result=Dmlandsoqlprgms.task3();
           System.assertEquals(act.size(),result.size());
      }

        @isTest
      static void testtask4(){
            List<Account> act=soqltestcases.addrecordstestsetup();
            Set<String>  result=Dmlandsoqlprgms.task4();
           System.assertEquals(1,result.size());
      }

       @isTest
      static void testtask5(){
            List<Account> act=soqltestcases.addrecordstestsetup();
            integer  result=Dmlandsoqlprgms.task5('Energy');
           System.assertEquals(10,result);
      }


      //task 6 should change code
     
          @isTest
      static void testtask6(){
            List<Account> act=soqltestcases.addrecordstestsetup();
            Map<string,integer>  result=Dmlandsoqlprgms.task6('Energy');
           System.assertEquals(10,result.get('Energy'));
      }

       @isTest
      static void testtask7(){
            List<Account> act1=soqltestcases.addrecordstestsetup();
       List<Account> act = [select name from Account where account.industry='energy' limit 4];
            List<Account>  result=Dmlandsoqlprgms.task7();
        
           
           System.assertEquals(act.size(),result.size());
      }
     
        @isTest
      static void testtask8(){
            List<Account> act1=soqltestcases.addrecordstestsetup();
      List<Account> act = [select name from Account where account.name like 'S%'];
            List<Account>  result=Dmlandsoqlprgms.task8();
           system.debug('result is '+result);
           system.debug('result size is'+result.size());
          system.debug('act is '+act);
            system.debug('act size is'+act.size());
           System.assertEquals(act.size(),result.size());
      }

      
      @isTest
      static void testtask9(){
            List<Account> act1=soqltestcases.addrecordstestsetup();
      List<Account> act = [select name from Account where account.name like '%A'];
            List<Account>  result=Dmlandsoqlprgms.task9();
           System.assertEquals(act.size(),result.size());
      }
       


      @isTest
      static void testtask10(){
           List<Account> act1=soqltestcases.addrecordstestsetup();
     List<Account> act = [select name,phone,type,industry,AnnualRevenue,NumberOfEmployees from Account where (account.NumberOfEmployees>=5000 and account.NumberOfEmployees<=150000) or account.AnnualRevenue>=500000];

            List<Account>  result=Dmlandsoqlprgms.task10();
            
          system.debug('result is '+result);
           system.debug('result size is'+result.size());
          system.debug('act is '+act);
            system.debug('act size is'+act.size());
           
System.assertEquals(act.get(0).AnnualRevenue,result.get(0).AnnualRevenue);
    
  }
      

 @isTest
      static void testtask11(){
           

            Account  result=Dmlandsoqlprgms.task11();
           System.assertEquals('suresh',result.name);
      }
      

     @isTest
      static void testtask12(){
           

            Account  result=Dmlandsoqlprgms.task12();
           System.assertEquals('sureshkumar',result.name);
      }


           @isTest
      static void testtask13(){
           

            List<Account>  result=Dmlandsoqlprgms.task13(10);
           System.assertEquals(10,result.size());
      }
        @isTest
        static void testtask14(){
           //  List<Account> act1=soqltestcases.addrecordstestsetup();
           List<Account> result= Dmlandsoqlprgms.task14(10);
              system.debug('result is '+result);
           system.debug('result size is'+result.size());
        //  system.debug('act is '+act);
        //    system.debug('act size is'+act.size());
          
           System.assertEquals('suresh0',result.get(0).name);
             System.assertEquals('suresh1',result.get(1).name);
             
      }

      @isTest
      static void testtask15(){
           List<Account> act1=soqltestcases.addrecordstestsetup();
            List<Account>  result=Dmlandsoqlprgms.task15();
           System.assertEquals(5001,result.get(0).NumberOfEmployees);
      }
 

      @isTest
      static void testtask16(){
           List<Account> act1=soqltestcases.addrecordstestsetup();
            List<Account>  result=Dmlandsoqlprgms.task16();
           System.assertEquals(5010,result.get(0).NumberOfEmployees);
           System.assertEquals(499000,result.get(0).AnnualRevenue);
      }
       
        @isTest
      static void testtask17(){
           List<Account> act1=soqltestcases.addrecordstestsetup();
            List<Account>  result=Dmlandsoqlprgms.task17();
           System.assertEquals(5010,result.get(0).NumberOfEmployees);
           
      }

         @isTest
      static void testtask18(){
            List<Account> act=soqltestcases.addrecordstestsetup();
            List<Account>  result=Dmlandsoqlprgms.task18();
           System.assertEquals(act.size(),act.size()-result.size());
           
      }

          @isTest
      static void testtask19(){
           List<Account> act=soqltestcases.addrecordstestsetup();
            List<Account>  result=Dmlandsoqlprgms.task19();
               system.debug('result is '+result);
           system.debug('result size is'+result.size());
          system.debug('act is '+act);
            system.debug('act size is'+act.size());
          
           System.assertEquals(10,result.size());
           
      }

      @isTest
      static void testtask20(){
            List<Account> act=soqltestcases.addrecordstestsetup();
            List<Account>  result=Dmlandsoqlprgms.task20(10);
           System.assertEquals('9494001944',result.get(0).phone);
           
      }
 }