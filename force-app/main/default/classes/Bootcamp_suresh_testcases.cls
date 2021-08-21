@isTest
public class Bootcamp_suresh_testcases {

      @isTest
      static void testcase1(){
           String result=BootCamp_ApexTasks1_suresh.task1('hello world');
           System.assertEquals('hello world',result);
      }
    
     @isTest
      static void testtask2(){
           String result=BootCamp_ApexTasks1_suresh.task2('suresh');
           System.assertEquals('my name issuresh',result);
      }
      
     @isTest 
     static void testcase3(){
           integer result=BootCamp_ApexTasks1_suresh.task3(20,30);
           System.assertEquals(50,result);
      }
     

        @isTest 
     static void testtask4(){
         List<integer> a1=new List<integer>{20,30,54,78,85};
         List<integer> a2=new List<integer>{22,44,4,58,65};
           BootCamp_ApexTasks1_suresh.task4(a1,a2);
          // System.assertEquals(50,result);
      }
       
      
         @isTest 
          static void testcase5(){ 
           
            integer result=BootCamp_ApexTasks1_suresh.task5(89,78,58,84,86);
           System.assertEquals(395,result);
      }
     
            @isTest static void testcase6(){  
           string result=BootCamp_ApexTasks1_suresh.task6(121);
           string result1=BootCamp_ApexTasks1_suresh.task6(124);     
           System.assertEquals('121is palindrome',result);
           System.assertEquals('421is not palindrome',result1);      
      }
        @isTest static void testcase7(){  
           integer result=BootCamp_ApexTasks1_suresh.task7(89,8,69);
           integer result1=BootCamp_ApexTasks1_suresh.task7(8,89,69);
           integer result2=BootCamp_ApexTasks1_suresh.task7(8,6,89);
             System.assertEquals(89,result);
             System.assertEquals(89,result1);
             System.assertEquals(89,result2);
      }
        @isTest static void testcase8(){  
            string result=BootCamp_ApexTasks1_suresh.task8(89);
            string result1=BootCamp_ApexTasks1_suresh.task8(22);
            System.assertEquals('89is odd',result);
            System.assertEquals('22is even',result1);
      }
    
        @isTest static void testcase9(){  
           integer result=BootCamp_ApexTasks1_suresh.task9('suresh');
           System.assertEquals(6,result);
      }
      @isTest static void testcase10(){  
           double result=BootCamp_ApexTasks1_suresh.task10(10,20);
           System.assertEquals(15.0,result);
      }

      @isTest 
      static void testcase11(){  
           List<integer> li=new List<integer>();
               li.add(20);
               li.add(50);
               li.add(78);
        	   li.add(87);
         	   li.add(45);
           integer[] result=BootCamp_ApexTasks1_suresh.task11(li);
             List<integer> li1=new List<integer>();
               li1.add(20);
               li1.add(45);
               li1.add(50);
        	   li1.add(78);
         	   li1.add(87);
           System.assertEquals(li1,result);
      }
    
       @isTest static void testcase12(){  
           string result=BootCamp_ApexTasks1_suresh.task12('suresh','vikram');
           System.assertEquals('sureshvikram',result);
      }
       @isTest static void testcase13(){  
           List<integer> result=BootCamp_ApexTasks1_suresh.task13(30,20);
           System.assertEquals(20,result.get(0));
           System.assertEquals(30,result.get(1));
      }

   @isTest static void testtask14(){  
           BootCamp_ApexTasks1_suresh.task14(10);
      }
   @isTest static void testtask15(){  
       List<string> li=new List<string>{'suresh','ramesh','dattu','kirtesh'};
           BootCamp_ApexTasks1_suresh.task15(li);
      }
   
         @isTest static void testcase16(){  
             List<string> li=new List<string>();
               li.add('suresh');
               li.add('is');
               li.add('good');
               li.add('boy');
         	   
           List<string> result=BootCamp_ApexTasks1_suresh.task16(li);
           System.assertEquals('hserus',result.get(0));
           System.assertEquals('si',result.get(1));
           System.assertEquals('doog',result.get(2));
           System.assertEquals('yob',result.get(3));
      }

          @isTest static void testcase17(){  
           string result=BootCamp_ApexTasks1_suresh.task17(153);
            string result1=BootCamp_ApexTasks1_suresh.task17(151);
           System.assertEquals('153.0is Armstrong Number',result);
               System.assertEquals('127.0is not a Armstrong Number',result1);
          
      }  
         @isTest static void testcase18(){  
           string result=BootCamp_ApexTasks1_suresh.task18('abab','ab');
             string result1=BootCamp_ApexTasks1_suresh.task18('ab','abab');
           System.assertEquals('ababis bigger in length',result);
              System.assertEquals('ababis bigger in length',result1);
          
      }   
     @isTest static void testtask19(){  
           BootCamp_ApexTasks1_suresh.task19(20,10);
      }
    
      @isTest static void testtask20(){  
        List<string> result = BootCamp_ApexTasks1_suresh.task20();
          System.assertEquals('1welcome to my program',result.get(0));
      }
    
     @isTest static void testtask21(){  
        List<integer> result = BootCamp_ApexTasks1_suresh.task21(10,30);
          System.assertEquals(40,result.get(0));
      }
    
    
      

//not done task 22

  @isTest static void testcase23(){  
           integer result=BootCamp_ApexTasks1_suresh.task23(5);
           System.assertEquals(120,result);
          
      }  
//program 24 is not there in program list
   
    @isTest static void testcase25(){  
           string result=BootCamp_ApexTasks1_suresh.task25('SURESH');
           string result1=BootCamp_ApexTasks1_suresh.task25('suresh');
           System.assertEquals('suresh',result);
            System.assertEquals('SURESH',result1);
          
      }  

    @isTest static void testcase26(){  
           BootCamp_ApexTasks1_suresh.task26('suresh78$%');
  
      }
    

    @isTest static void testcase27(){  
           decimal result=BootCamp_ApexTasks1_suresh.task27(4);
           System.assertEquals(6.92,result);
          
      }
    
      @isTest static void testcase28(){  
           BootCamp_ApexTasks1_suresh.task28('suresh');
  
      }
     @isTest static void testcase29(){  
           BootCamp_ApexTasks1_suresh.task29(10);
      }
    

 @isTest static void testcase30(){  
           string result=BootCamp_ApexTasks1_suresh.task30('aba','aba');
           string result1=BootCamp_ApexTasks1_suresh.task30('aba','abacv');
           System.assertEquals('equal',result);
          System.assertEquals('not equal',result1);
          
      }
    
     @isTest static void Testtask31(){  
           string result=BootCamp_ApexTasks1_suresh.task31('india');
           System.assertEquals('New Delhi',result);
      }
    
     @isTest static void Testtask32(){  
           BootCamp_ApexTasks1_suresh.task32('india');
          // System.assertEquals('New Delhi',result);
      }
    
       @isTest static void Testtask33(){  
         List<String> dates= new List<String>();
			dates.add('10/4/2020');
			dates.add('8/4/2019');
			dates.add('6/8/2018');
			dates.add('5/6/2017');
          List<Date> result =BootCamp_ApexTasks1_suresh.task33(dates);	
           string s='5/6/2017';
           Date d1=Date.parse(s);
          System.assertEquals(d1,result.get(0));
         
      }

       @isTest static void Testtask34(){  
           string s='5/6/2017';
           Date d1=Date.parse(s);
          Date result= BootCamp_ApexTasks1_suresh.task34(d1);
           System.assertEquals(d1,result);
         //  System.assertEquals('dates',result);//-ve
           
      }


          //pending    
        @isTest static void Testtask35(){  
       
      }



    
     @isTest static void Testtask36(){  
          integer result= BootCamp_ApexTasks1_suresh.task36('8/4/2019','10/4/2020');
             System.assertEquals(427,result);
           //  System.assertEquals(126,result);
      }

        @isTest static void Testtask37(){  
          string result= BootCamp_ApexTasks1_suresh.task37('8/4/2019','10/4/2020');
            string result1= BootCamp_ApexTasks1_suresh.task37('8/4/2019','8/4/2019');
             System.assertEquals('Both dates are equal',result1); 
             System.assertEquals('Both dates are not equal',result);
      }

         @isTest static void Testtask42(){  
          string result= BootCamp_ApexTasks1_suresh.task42('8/4/2019');
          string result1= BootCamp_ApexTasks1_suresh.task42('8/4/2020');
             System.assertEquals('Leap Year',result1);  
             System.assertEquals('not a leap year',result);
      }

       
         @isTest static void Testtask43(){  
          Boolean  result= BootCamp_ApexTasks1_suresh.task43('salesforce','sale');
              Boolean  result1= BootCamp_ApexTasks1_suresh.task43('abc','xyz');
             System.assertEquals(true,result);
             System.assertEquals(false,result1);
      }

         @isTest static void Testtask44(){  
          string  result= BootCamp_ApexTasks1_suresh.task44('my name is suresh',' suresh');
             System.assertEquals('my name is',result);
          //   System.assertEquals('my name is ',result);
      }


          @isTest static void Testtask45(){  
              BootCamp_ApexTasks1_suresh.task45('my name is suresh');
 
      }
          @isTest static void Testtask46(){  
              BootCamp_ApexTasks1_suresh.task46('my name is suresh');
       
      }

         @isTest static void Testtask47(){  
          string  result= BootCamp_ApexTasks1_suresh.task47('suresh',2);
             System.assertEquals('r',result);
          //   System.assertEquals('e',result);
      }
     
           @isTest static void Testtask48(){  
          string  result= BootCamp_ApexTasks1_suresh.task48('suresh');
             System.assertEquals('sures',result);
           //  System.assertEquals('suresh',result);
      }

//program 49 is not there in programs list

            @isTest static void Testtask50(){  
          string  result= BootCamp_ApexTasks1_suresh.task50('suresh');
                string  result1= BootCamp_ApexTasks1_suresh.task50(' ');
             System.assertEquals(' is empty',result1);
             System.assertEquals('sureshis not empty',result);
      }

              @isTest static void Testtask51(){  
          string  result= BootCamp_ApexTasks1_suresh.task51('svsuresh8@gmail.com');
          string  result1= BootCamp_ApexTasks1_suresh.task51('svsuresh8gmail.com');
             System.assertEquals('email is validated',result);
             System.assertEquals('email is not validated',result1);
      }

        @isTest static void Testtask52(){  
          string  result= BootCamp_ApexTasks1_suresh.task52('this is suresh');
             System.assertEquals('thisissuresh',result);
            // System.assertEquals('this is suresh',result);
      }

           @isTest static void Testtask53(){  
           BootCamp_ApexTasks1_suresh.task53('suresh%^%8#');
            
      }

         @isTest static void Testtask54(){  
          integer  result= BootCamp_ApexTasks1_suresh.task54(6,'suresh','ramesh','rajesh');
             System.assertEquals(4,result);
            // System.assertEquals(pending1,result);
      }


       @isTest static void Testtask55(){  
          List<string>  result= BootCamp_ApexTasks1_suresh.task55(5);
             System.assertEquals('student0',result.get(0));
           //  System.assertEquals('suresh',result.get(1));
      }

        @isTest static void Testtask56(){  
            decimal   result= BootCamp_ApexTasks1_suresh.task56(50,'O');
            decimal   result1= BootCamp_ApexTasks1_suresh.task56(200,'O');
            decimal   result2= BootCamp_ApexTasks1_suresh.task56(600,'O');
            decimal   result3= BootCamp_ApexTasks1_suresh.task56(70,'E');
            decimal   result4= BootCamp_ApexTasks1_suresh.task56(300,'E');
            decimal   result5= BootCamp_ApexTasks1_suresh.task56(800,'E');
             System.assertEquals(50,result);
            System.assertEquals(80,result1);
            System.assertEquals(210,result2);
            System.assertEquals(80,result3);
            System.assertEquals(2100.0,result4);
            System.assertEquals(520.0,result5);
            
         
      }
    
    @isTest static void Testtask57(){  
         decimal  result= BootCamp_ApexTasks1_suresh.task57('suresh','kakinada',22000,'L');
        decimal  result1= BootCamp_ApexTasks1_suresh.task57('suresh','kakinada',55000,'L');
        decimal  result2= BootCamp_ApexTasks1_suresh.task57('suresh','kakinada',75000,'L');
        decimal  result3= BootCamp_ApexTasks1_suresh.task57('suresh','kakinada',150000,'L');
        decimal  result4= BootCamp_ApexTasks1_suresh.task57('suresh','kakinada',22000,'D');
        decimal  result5= BootCamp_ApexTasks1_suresh.task57('suresh','kakinada',45000,'D');
        decimal  result6= BootCamp_ApexTasks1_suresh.task57('suresh','kakinada',68000,'D');
        decimal  result7= BootCamp_ApexTasks1_suresh.task57('suresh','kakinada',125000,'D');
               System.assertEquals(22000,result);
               System.assertEquals(52250,result1);
               System.assertEquals(69375.0,result2);
               System.assertEquals(135000,result3);
               System.assertEquals(20900,result4);
               System.assertEquals(41625.0,result5);
               System.assertEquals(61200,result6);
               System.assertEquals(106250,result7);
          
      }
      @isTest static void Testtask59(){  
          decimal  result= BootCamp_ApexTasks1_suresh.task59(200000);
          decimal  result1= BootCamp_ApexTasks1_suresh.task59(350000);
          decimal  result2= BootCamp_ApexTasks1_suresh.task59(800000);
          decimal  result3= BootCamp_ApexTasks1_suresh.task59(1200000);
             System.assertEquals(0,result);
             System.assertEquals(10000.0,result1);
             System.assertEquals(70000.0,result2);
             System.assertEquals(85000.0,result3);
          
      }
    
    
    @isTest static void Testtask60(){  
        
          decimal  result= BootCamp_ApexTasks1_suresh.task60(3);
          decimal  result1= BootCamp_ApexTasks1_suresh.task60(9);
          decimal  result2= BootCamp_ApexTasks1_suresh.task60(12);
             System.assertEquals(1.2,result);
             System.assertEquals(5.85,result1);
             System.assertEquals(9.6,result2);
       
          
      }


          @isTest static void Testtask62(){  
        
           BootCamp_ApexTasks1_suresh.task62();
          
             }

            @isTest static void Testtask63(){  
        
          integer result= BootCamp_ApexTasks1_suresh.task63();
            System.assertEquals(5,result);
          
             } 
            
      @isTest static void Testtask64(){  

        map<Integer,String> m1= new map<Integer,String>();
        m1.put(1, 'a');
        m1.put(2, 'b');
        m1.put(3, 'c');
        m1.put(4, 'd');
        m1.put(5, 'e');
        
       map<Integer,String> m2= new map<Integer,String>();
           Boolean expectedresult1=false;
           Boolean expectedresult2=true;
        
          Boolean result1= BootCamp_ApexTasks1_suresh.task64(m1);
          Boolean result2= BootCamp_ApexTasks1_suresh.task64(m2);
         
          System.assertEquals(expectedresult1,result1);
          System.assertEquals(expectedresult2,result2);
             }


 @isTest static void Testtask65(){  

           BootCamp_ApexTasks1_suresh.task65();
          
         
             }


 @isTest static void Testtask66(){  

           map<integer,string> result= BootCamp_ApexTasks1_suresh.task66();
          System.assertEquals('a',result.get(1));
         System.assertEquals('e',result.get(5));
             
}

@isTest static void Testtask68(){  

           string result= BootCamp_ApexTasks1_suresh.task68(3);
           string result1= BootCamp_ApexTasks1_suresh.task68(8);
          System.assertEquals('3is removed',result);
         System.assertEquals('key8is not in map',result1);
             
}

@isTest static void Testtask69(){  

           map<integer,string> result= BootCamp_ApexTasks1_suresh.task69();
          
          System.assertEquals('c',result.get(3));
        
             
}

@isTest static void Testtask70(){  

           list<integer> result= BootCamp_ApexTasks1_suresh.task70();
          
          System.assertEquals(88,result.get(3));
                    
}

@isTest static void Testtask71(){  

           string result= BootCamp_ApexTasks1_suresh.task71(2,67);
            string result1= BootCamp_ApexTasks1_suresh.task71(8,67);
          
          System.assertEquals('67is added at key2',result);
           System.assertEquals('8is not valid key to add into list',result1);
                    
}

@isTest static void Testtask72(){  

           list<integer> result= BootCamp_ApexTasks1_suresh.task72();
          
          System.assertEquals(75,result.get(3));
                    
}

@isTest static void Testtask73(){  

           string result= BootCamp_ApexTasks1_suresh.task73();
          
          System.assertEquals('all the elements removed',result);
                    
}


@isTest static void Testtask74(){  

           integer result= BootCamp_ApexTasks1_suresh.task74(3);
          
          System.assertEquals(75,result);
                    
}

//pending
@isTest static void Testtask77(){  

           BootCamp_ApexTasks1_suresh.task77();
          //System.assertEquals('suresh',result);
                    
}
    
    @isTest static void Testtask79(){  

           BootCamp_ApexTasks1_suresh.task79();
          //System.assertEquals('suresh',result);
                    
}

@isTest static void Testtask80(){  

             string result1= BootCamp_ApexTasks1_suresh.task80(10,20,'add');
             string result2= BootCamp_ApexTasks1_suresh.task80(10,20,'sub');
             string result3= BootCamp_ApexTasks1_suresh.task80(10,20,'mul');
             string result4= BootCamp_ApexTasks1_suresh.task80(10,20,'div');
             string result5= BootCamp_ApexTasks1_suresh.task80(10,20,'abc');
          System.assertEquals('addition of a and b is30',result1);
          System.assertEquals('subtraction of a and b is-10',result2);
          System.assertEquals('multiplication of a and b is200',result3);
          System.assertEquals('division of a and b is0',result4);
          System.assertEquals('enter correct value',result5);
                    
}

@isTest static void Testtask81(){  

           BootCamp_ApexTasks1_suresh.task81();
          
        //  System.assertEquals(,result);
                    
}

@isTest static void Testtask82(){  

           BootCamp_ApexTasks1_suresh.task82();
          
        //  System.assertEquals(,result);
                    
}
    
    @isTest static void Testtask85(){  
          List<string> cities= new List<string>{'Hyderabad','Bangalore','chennai','mumbai'};
          map<string,List<string>> result= BootCamp_ApexTasks1_suresh.task85('india');
            System.assertEquals(cities,result.get('india'));
                    
}
    @isTest static void Testtask85B(){  

           BootCamp_ApexTasks1_suresh.task85B('Hyderabad is a beautiful city');
          
        //  System.assertEquals(,result);
                    
}
  @isTest static void Testtask86(){  

           string result= BootCamp_ApexTasks1_suresh.task86('3/9/2019');
           string result1= BootCamp_ApexTasks1_suresh.task86('7/9/2019');
           string result2= BootCamp_ApexTasks1_suresh.task86('12/9/2019');
          string result3= BootCamp_ApexTasks1_suresh.task86('2/9/2019');
          
            System.assertEquals('season issummer',result);
            System.assertEquals('season isRainy',result1);
            System.assertEquals('season iswinter',result2);
            System.assertEquals('season isspring',result3);
                    
}
        @isTest static void Testtask88(){  
          List<string> cities= new List<string>{'Hyderabad','Bangalore','chennai','mumbai'};
              List<string> colors = new List<string>{'yellow','orange','black','blue'};
          map<integer,List<string>> result= BootCamp_ApexTasks1_suresh.task88(3,cities);
            System.assertEquals(colors,result.get(3));
                    
}
     @isTest
      static void testtask89(){
         // List<account>  act = [select name, Phone,AnnualRevenue,industry from Account where account.industry='energy'];
            List<Account> result=Dmlandsoqlprgms.task1();
          system.debug('method data is'+Dmlandsoqlprgms.task1());
          system.debug('result is'+result);
       //   system.debug('act is'+act);
         //  System.assertEquals(act.get(1).name,result.get(1).name);
      }
    
}