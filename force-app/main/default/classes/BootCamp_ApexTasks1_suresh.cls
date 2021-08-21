public class BootCamp_ApexTasks1_suresh {

    //prints hello world dynamically
      public static string task1(String s1){
        system.debug(s1);
        return s1;
      }
   
    //method to ask the user for his name and greet the user with our name
     public static string task2(String s1){
        system.debug('my name is'+s1);
        return 'my name is'+s1;
      }
  
    
    //adding two integer values
      public static Integer task3(Integer s1,Integer s2){
          Integer result=s1+s2;
          system.debug(result);
      return result;
      }
    
    //method to add two integer arrays v=based on index value and size of array
      public static integer[] task4(integer[] a,integer[] b){
       
        integer length=a.size()<b.size()?a.size():b.size();//finds length which takes only smaller length of two arrays
        system.debug('length is'+length);
        integer[] result= new Integer[length];
        for(integer i=0;i<length;i++){
        result[i]=a[i]+b[i];   //add two array values based on index
        }
        system.debug('result list is'+result);
        return result;
    }
    
    //method to add 5 subj marks and find percentage
    public static integer task5(integer mathsmarks,integer sciencemarks,integer telugumarks,integer socialmarks,integer englishmarks){

        List<Integer> li= new List<Integer>();
        li.add(mathsmarks);
        li.add(sciencemarks);
        li.add(telugumarks);
        li.add(socialmarks);
        li.add(englishmarks);
        integer sum=0;
        for(integer i=0;i<li.size();i++){
 
            sum=sum+li[i];//sum will store 5 subj total marks which are in list
        
        }
        system.debug('total marks are'+sum);
        double percentage=sum/li.size();//find percentage based on list size
        system.debug('percentage is'+percentage);
       return sum;
    }
    
    //method to check if a number is palindrome or not
    public static string task6(integer num){
        
        integer rev=num;
        integer r,sum=0;
        
        
        while(num>0){
            r=math.mod(num, 10);
            sum=(sum*10)+r;
            num=num/10;
        }
        
        if(rev==sum){
            system.debug(sum+'is palindrome'); 
           return sum+'is palindrome';  
        }
        else{
            system.debug(sum+'is not a palindrome');
        return sum+'is not palindrome';
            }

    }
    
    //method to find biggest number in 3 numbers
    public static integer task7(integer num1,integer num2,integer num3){

        if(num1>num2 && num1>num3){
            system.debug('BiggestNumber is'+num1);
            return num1;
        }
        else if(num2>num3 && num2>num1){
            system.debug('Biggest Number is'+num2);
           return num2;
        }
        else{
            system.debug('Biggest number is '+num3);
            return num3;
        }    
    }
    
    //method to find number is even or odd
     public static string task8(integer num){
      
        if(math.mod(num, 2)==0){ //check remainder is 0 or not
            system.debug(num +'is even');
           return num+'is even';
        }
        else
        {
        system.debug(num +'is odd');
         return num+'is odd';
        }
         
    }
    
    //finds length of a string including spaces in milddle of strings
    public static integer task9(String sample){
         integer count=0;
        for(integer i=0;i<sample.trim().length();i++){
            count++;
        }  
        system.debug('string length is'+count);
       return count;

    }
    
    //avg of 2 numbers
    public static double task10(Integer a,Integer b){

           double average=(a+b)/2;
          system.debug('avg of 2 numbers is'+average);
         return average;
      }
    
   //prints array values in ascending order
     public static integer[] task11(integer[] a){
        integer temp;//temp is a temperary variable used while  swaping the numbers
        for(integer i=0;i<a.size();i++){
            for(integer j=i+1;j<a.size();j++){
                if(a[i]>a[j]){//compare values based on index
                    temp=a[i];
                    a[i]=a[j];
                    a[j]=temp;
                }
            }
        }
        for(integer k=0;k<a.size();k++){
        system.debug('ascending order is'+a[k]);
        }
       return a;
    }

    //concating two strings
 public static string task12(String s1,String s2){

       string s3=s1+s2;
        system.debug('after concating two strings'+s3);
        return s3;       
 }
    
    
     //swaping two numbers
     public static List<integer> task13(integer a,integer b){
        
        system.debug('before swap'+a +','+b);
        a=a+b;
        b=a-b;
        a=a-b;
        system.debug('after swap'+a +','+b);
         List<integer> li= new List<integer>();
              li.add(a);
              li.add(b);
        return li;
        
    }
    
    //test case pending
    //prints fibinocci series based on count value
     public static void task14(integer count){
        
        integer  n1=0,n2=1,n3;
        system.debug('fibinocci series'+n1);
        system.debug('fibinocci series'+n2);
          for(integer i=2;i<count;++i)   
          {    
            n3=n1+n2;
            system.debug('fibinoci series is'+n3);
            n1=n2;    
            n2=n3;    
           }    
  
    }
    
    //pending test case
    //finds the length of any string stored in a string array dynamically
        public static void task15(String[] a){

        integer length;
        for(integer i=0;i<a.size();i++){
            length=a[i].length();//length stores length of a each string based on index
            system.debug(a[i]+'length is'+length);
        }
    }
    
    //reverse the strings in a list and add strings to new list 
    //here passing the string s dynamically
    public static list<String> task16(List<String> s1list){
         //list reverse
         System.debug('Before reversing list'+s1list);
          List<String> reverselist= new List<String>();
         String reverse=' ';
         for(String s1:s1list){//this for loop will get one by one from string list
            for(Integer i=s1.length()-1;i>=0;i--){  
                reverse=reverse+s1.mid(i,1); //reverse variable  will store each character based on index
            }
              reverselist.add(reverse.trim());//after reversing string  we will store each string in list named reverseist
             reverse=' ';
         }
          System.debug('After reversing list'+reverselist);
         
         return reverselist;
      }

    //checks armstrong or not
    public static string task17(integer num){
        
        integer x=num;
        integer y=num;
        integer r;
        double temp=0;

        //this while loop checks number of digits in a given number
        integer count=0;
        while(num!=0){
           num=num/10;
            count++;
        }
        
        while(x>0){
            r=math.mod(x, 10);//will give remainder r value
            temp=temp+math.pow(r, count);//temp will be calicualted basedon previous temp value and remainder  r value
            x=x/10;
        }
        if(y==temp){
            system.debug(temp+'is Armstrong Number'); 
            return temp+'is Armstrong Number';  
        }
        else{
            system.debug(temp+'is not a Armstrong Number');
            return temp+'is not a Armstrong Number';
        }
        
    }
    
    //compare two strings and finds which is bigger in length
     public static string task18(String a,String b){

        if(a.length()>b.length()){
            system.debug('a has more letters than b'+a +b);
           return a+'is bigger in length';
        } 
        else{

            system.debug('b has more letters than a'+a +b);
           return b+'is bigger in length';
        }
    }
    
    //testcase pending
    //perform logical operations using operators like +,_,*,/
      public static void task19(integer a,integer b){
        
         system.debug('Addition of a and b is'+(a+b));
        if(a>b){
         system.debug('subtraction of a and b is'+(a-b));
        }
         system.debug('multiplication of a and b is'+(a*b));
         system.debug('division of a and b is'+(a/b));
    }
    
    //test case pending
    //prints a string for 5 times using for loop
     public static List<string> task20(){
        List<string>  li= new List<string>();
        for(integer i=1;i<=5;i++){
             li.add(i+'welcome to my program');
            system.debug(i+'welcome to my program');
        }
         return li;
    }
    
    //test case pending
    //perform logical operations using switch case
     public static List<integer> task21(integer a,integer b){
         List<integer> li= new List<integer>();

        for(integer i=1;i<5;i++){
           switch on i{
               when 1{
                   li.add(a+b);
                     system.debug('addition of a and b is'+(a+b));
               }
               when 2{
                   li.add(a-b);
                     system.debug('subtraction of a and b is'+(a-b));
               }
               when 3{
                   li.add(a*b);
                     system.debug('multiplication of a and b is'+(a*b));
               }
               when 4{
                   li.add(a/b);
                     system.debug('division of a and b is'+(a/b));
               }
               when else{
                     system.debug('enter correct value');
               }       
           }
       }
         return li;
    }
    
    //program 22(reverse a number using do while loop)
    
    //factorial of given  number
    //for example 5 factorial is 5*4*3*2*1=120
    public static integer task23(integer n){
         integer res = 1, i; 
        for (i=2; i<=n;i++) {
            res *= i;//res will store value upto condition is false in for loop
        }
        system.debug('factorial of'+n +'is'+res);
         return res;
    }
    
    //program 24 is not there in program list
    
    //used to convert upper to lower and lower to upper cases
     public static string task25(String s){

        if(s.isAllUpperCase()){
            s=s.toLowerCase();
            system.debug('lower case of'+s+'is'+s.toLowerCase());
          return s;
        }
         else{
            s= s.toUpperCase();
            system.debug('upper  case of'+s+'is'+s.toUpperCase());
         return s;
         }
    }
    
    //pending test case
    //finds given character is a alphabet or not
     public static void task26(String s){

      for(Integer i=0;i<s.length();i++){  
        if(s.mid(i,1)>='A' || s.mid(i,1)>='Z' || s.mid(i,1)>='a' ||s.mid(i,1)>='z'){
            system.debug(s.mid(i,1)+'is a alphabet');//s.mid(i,1) takes each character depends on i value
        }
         else{
             System.debug(s.mid(i,1)+'is not a alphabet');
         }
      }
    }
    
    //finds area of equilateral triangle
      public static decimal task27(integer a){
        decimal result=(1.73/4)*a*a;
        system.debug('Area of equiateral triangle'+result);
        return result;
    }     
      
    //pending test case
    //finds each character in a string is a vowel or consonant
    public static void task28(String s){

     for(Integer i=0;i<s.length();i++){     
       if(s.mid(i,1).equalsIgnoreCase('a') || s.mid(i,1).equalsIgnoreCase('e') || s.mid(i,1).equalsIgnoreCase('i') || s.mid(i,1).equalsIgnoreCase('o') || s.mid(i,1).equalsIgnoreCase('u')) 
       {
           system.debug(s.mid(i,1)+ 'is a vowel');
       }
        else
        {
            system.debug(s.mid(i,1)+'is a consonant');
        }
     }  
    }
    
    //pending test case
    //prints natural numbers upto given number and will do sum of natural numbers
     public static void task29(integer n){

        integer sum=0;
        for(integer i=1;i<=n;i++){
            sum=sum+i;
            system.debug('Natural numbers '+i);
        }
        system.debug('sum of natural numbers is'+sum);
    }
    
    //check two string states are equal or not
    public static string task30(String s1,String s2){
        
        if(s1.equals(s2)){//compare s1 and s2 states 
            system.debug('s1 and s2 states  are equal');
             return 'equal';
        }
        else{
            system.debug('s1 and s2 states are not equal');
            return 'not equal';
        }
    }
    
    
    //retrieve the capital for the given country using list
     public static string task31(String country){
         
         //Solution 1
        List<String> ActualCountry= new List<String>();//list stores all the countries listed
        ActualCountry.add('india');                   //uses li.add() to stores the countries
        ActualCountry.add('us');
        ActualCountry.add('uk');
        ActualCountry.add('sri lanka');
        
        List<String> capital=new List<String>();   //list stores all the capitals listed
        capital.add('New Delhi');
        capital.add('New york');
        capital.add('London');                     //uses add method to store capital
        capital.add('Colombo');
       String c;
         for(integer i=0;i<ActualCountry.size();i++){
             if(country==ActualCountry.get(i)){                  //checks weather given country is listed in our list that stores countries
             System.debug(Country+'Capital is'+capital.get(i));  //print capital which belongs to country
               c=capital.get(i);
                 return c;
             }
             
         } 
         return c;
     }
         
         //Solution 2
         //retrieve the capital for the given country using map 
         public static void task32(String country){
         map<String,String> m= new map<String,String>();
         m.put('india','New Delhi');
         m.put('us','New York');
         m.put('uk','London');
         m.put('sri lanka','Colombo');
             if(m.containsKey(country)){//checks given country is in our map or not
              System.debug(country +'capital is' +m.get(country));
             }
             else{
                 System.debug(country+'is not listed in map');

             }

         
         
         }
    
    //sorts the list of dates based on year and prints in ascending order
    public static List<Date> task33(List<String> Dates){
        List<Date> date1= new List<Date>();//stores list of dates
        System.debug('Befores sorting Dates are'+Dates);
        for(integer i=0;i<Dates.size();i++){  
            date1.add(Date.parse(Dates[i])); //convert  string format date to actual date  and stores in list         
       }
    
        date1.sort(); //sort the dates based on year
        System.debug('After sorting Dates are'+date1);//print dates in ascending order
        return date1;
    }
    
    
    //converts date to string and string to again date
    public static Date task34(Date currentdate){

        String d=currentdate.format();
        system.debug('current date changed to string'+d);
        Date date1=Date.parse(d);
        system.debug('date in string format changed to date again'+date1);
         return date1;
    
    }
     
    
         //converts current datetime to date in mm-dd-yyyy format    
         public static void task35(){

          Datetime d=Datetime.now();
          system.debug(d);
          String s=d.formatGMT('MM-dd-yyyy');
         Date d1=Date.parse(s);
         System.debug('actual date is'+d1);
                         
        }
    
    //caliculate days between two dates
    public static integer task36(String stringdate1,String Stringdate2){
        
        Date date1=Date.parse(stringdate1);
        Date date2=Date.parse(stringdate2);
        integer noofdays=date1.daysBetween(date2);
         system.debug('number of days between'+date1+'and'+date2+'is'+date1.daysBetween(date2));
          return noofdays;
      
      }
    
    //checks two dates are equal or not
    public static string task37(String stringdate1,String stringdate2){
        
        Date date1=Date.parse(stringdate1);
        Date date2=Date.parse(stringdate2);
       
        if(date1.isSameDay(date2)){ //checks two dates equality
            system.debug('Both dates are equal');
         return 'Both dates are equal';
        }
        else{
            system.debug('Dates are not equal');
            return 'Both dates are not equal';
        }
        
        
    }
    
    public static void task38(){
        
       // Date d= Datetime.newInstanceGmt('April 09 2020',2:30 pm);
       System.debug('Current date and time is'+Date.today()+Datetime.now());
    }
    
    public static void task39(date date1){
        
    }
    
   public  void task40(){
        System.debug('current date and time is'+Datetime.now());
     //   System.debug(Datetime.millisecond());
       
    }
    
   
    public  void task41(){
      //  String stringdate='8/8/2020 13:45:00';
     //  Datetime d=Datetime.format(stringdate);
     //   System.debug('date'+d);
    }
    
    //checks given date is in leap year or not based on year
    public static string task42(String stringdate){
        
        Date date1=Date.parse(stringdate);
        if(Date.isLeapYear(date1.year())){ //checks given date year is a leap year or not
            System.debug('Leap year');
             return 'Leap Year'; 
        }
        else{
            System.debug('Not a Leap year');
            return 'not a leap year';
        }
    }
   
    //checks one string contains another string or not 
    public static Boolean task43(String string1,String string2){
     
          if(string1.contains(string2)){
            system.debug('true');
            return true;
          }
          else{
           System.debug('false');
           return false;
          }  
    }
    
    //removes particular word from given sentence
     public static string task44(String sentence,String particularword){
        
         System.debug('Before remoivng particular word from sentence is'+sentence);
         
         if(sentence.contains(particularword)){
            sentence= sentence.remove(particularword);
           
         }
         
         System.debug('After remoivng particular word from sentence is'+sentence);
         return sentence;
    }
    
  
    //removes the last word from rhe given sentence
     public static void task45(String s1){
         System.debug('Before removing last word from sentence'+s1);
         String s2=' ';
         for(integer i=s1.length()-1;s1.mid(i,1)!=' ';i--){//prints the last word in a reverse order
             s2=s2+s1.mid(i,1); 
         }
         System.debug('String s2 is'+s2);
         String s2reverse=' ';
         for(integer j=s2.length()-1;j>=0;j--){//prints the last word in correct order 
             s2reverse=s2reverse+s2.mid(j,1);
         }
      
         if(s1.contains(s2reverse.trim())){ //checks given word is in sentence or not
            s1=s1.remove(s2reverse.trim());  //removes the word from sentence
            System.debug('After removing last word from sentence'+s1);
         }
        
        
        
    }
    
    //split the sentence into multiple strings
     public static void task46(String s1){
        System.debug('Splitting string '+s1.split(' '));
    }
    
    //prints the character at given index
     public static string task47(String s1,Integer index){
        string c;
         if(index<=s1.length()-1){
            System.debug('character at given'+index+'is'+s1.mid(index, 1)); 
             c=s1.mid(index,1);
         return c;
         }
         return c;
    }
    
    //prints substring from actual string
     public static string task48(String s1){
        String s2=s1.substring(0, 5);//s2 stores from indexx 0 to index 4
         System.debug('substring of'+s1+'is'+s2);
         return s2;
    }
    
    //program 49  is not there in requirement list
    
    //checks given string is empty or not
     public static string task50(String s1){
        
         if(s1.equals(' ')){
             System.debug(s1+'is empty');
             return s1+'is empty';
         }
         else{
             System.debug(s1+'is not empty');
             return s1+'is not empty';
         }
    }
    
   //validating the email based on regular expression
    public static string task51(String email){
        
        String emailRegex = '^[a-zA-Z0-9_+&*-]+(?:\\.'+ 
                            '[a-zA-Z0-9_+&*-]+)*@' + 
                            '(?:[a-zA-Z0-9-]+\\.)+[a-z' + 
                            'A-Z]{2,7}$'; 
                              
        Pattern pat = Pattern.compile(emailRegex);
        Matcher matcher = pat.matcher(email);
        System.debug(matcher.matches());
        if(matcher.matches()){
            System.debug('email is validated perfectly');
             return 'email is validated';
        }
        else{
            System.debug('email is not validated');
            return 'email is not validated';
        }
        
    } 
    
    //removing multiple spaces from given  string
     public static string task52(String s1){
        System.debug('Before replacing'+s1);
         s1=s1.trim().replaceAll(' ','');
        System.debug('After replacing spaces'+s1.trim().replaceAll(' ', ''));       
         System.debug('After replacing'+s1);
         return s1;
    }
    
    
    //removes non acsii chars from string 
    public static void task53(String s1){
        
        Pattern nonAlphanumeric = Pattern.compile('[^a-zA-Z0-9]');
        Matcher matcher = nonAlphanumeric.matcher(s1);
        system.debug(matcher.replaceAll(''));
    }
    
    
    //count number of iterations are required to make 3 strings equal which have same length
    public static integer task54(Integer n,String s1,String s2,String s3){
        Integer count=0;
        for(integer i=0;i<n;i++){
            String x=s1.mid(i, 1);//x stores each char for every iteration of first string
            String y=s2.mid(i, 1);//y stores each char for every iteration of second string
            String z=s3.mid(i, 1);//z stores each char for every iteration of third string
            if(x==y && y==z){  //checks x,y,z values are equal or not based on i value
            System.debug('No operation Required');    
            }
            else if(x==y || y==z ||z==x){
                count++;
            }
            else{
                count=count+2;
            }
        }
        
        System.debug('No of iterations to make all strings equal are'+count);
         return count;
    }
    
    //add student 0 to student n values into list and n is given dynamically
     public static List<string> task55(integer n){
        List<String> li= new List<String>();
         for(integer i=0;i<=n;i++){
             li.add('student'+i);
         }
        return li;
         
    }
    
    //calicualte charges to send parcel for specific mailtype and parcel weight
     public static double task56(decimal parcelweight,String mailtype){
        
         decimal charges;
         if(parcelweight<100 && mailtype=='O'){
             charges=50;
             System.debug('charges for'+mailtype+'is'+charges+'for weight'+parcelweight+'gms');
         }
         
           if(parcelweight>=101 && parcelweight<=500  && mailtype=='O'){
             charges=(40*parcelweight)/100;
               system.debug('debug'+charges+' '+parcelweight);
             System.debug('charges for'+mailtype+'is'+charges+'for weight'+parcelweight+'gms');
         }
         
          if(parcelweight>500 && mailtype=='O'){
             charges=(35*parcelweight)/100;
             System.debug('charges for'+mailtype+'is'+charges+'for weight'+parcelweight+'gms');
         }
         
          if(parcelweight<100 && mailtype=='E'){
             charges=80;
             System.debug('charges for'+mailtype+'is'+charges+'for weight'+parcelweight+'gms');
         }
         
           if(parcelweight>=101 && parcelweight<=500  && mailtype=='E'){
             charges=(700*parcelweight)/100;
             System.debug('charges for'+mailtype+'is'+charges+'for weight'+parcelweight+'gms');
         }
         
          if(parcelweight>500 && mailtype=='E'){
             charges=(65*parcelweight)/100;
             System.debug('charges for'+mailtype+'is'+charges+'for weight'+parcelweight+'gms');
         }
       return charges;
    }
    
     public static decimal task57(String name,String address,decimal purchaseamount,String purchasetype){
         decimal discount;
         decimal netamount;
         if(purchaseamount<=25000 && purchasetype=='L'){
             discount=(0*purchaseamount)/100;
             netamount= purchaseamount-discount;
             System.debug('name is'+name+'address is'+address+'purchase amount after discount is'+netamount);
             return netamount;
         }
         
         if((purchaseamount>=25001 && purchaseamount<=57000) && purchasetype=='L'){
             discount=(5*purchaseamount)/100;
             netamount= purchaseamount-discount;
             System.debug('name is'+name+'address is'+address+'purchase amount after discount is'+netamount);
            return netamount;
         }
         
         if((purchaseamount>=57001 && purchaseamount<=100000) && purchasetype=='L'){
             discount=(7.5*purchaseamount)/100;
             netamount= purchaseamount-discount;
             System.debug('name is'+name+'address is'+address+'purchase amount after discount is'+netamount);
         return netamount;
         }
         
         if(purchaseamount>100000 && purchasetype=='L'){
             discount=(10*purchaseamount)/100;
             netamount= purchaseamount-discount;
             System.debug('name is'+name+'address is'+address+'purchase amount after discount is'+netamount);
          return netamount;
         }
           if(purchaseamount<=25000 && purchasetype=='D'){
             discount=(5*purchaseamount)/100;
             netamount= purchaseamount-discount;
             System.debug('name is'+name+'address is'+address+'purchase amount after discount is'+netamount);
          return netamount;
           }
         
         if((purchaseamount>=25001 && purchaseamount<=57000) && purchasetype=='D'){
             discount=(7.5*purchaseamount)/100;
             netamount= purchaseamount-discount;
             System.debug('name is'+name+'address is'+address+'purchase amount after discount is'+netamount);
          return netamount;
         }
         
         if((purchaseamount>=57001 && purchaseamount<=100000) && purchasetype=='D'){
             discount=(10*purchaseamount)/100;
             netamount= purchaseamount-discount;
             System.debug('name is'+name+'address is'+address+'purchase amount after discount is'+netamount);
          return netamount;
         }
         
         if(purchaseamount>100000 && purchasetype=='D'){
             discount=(15*purchaseamount)/100;
             netamount= purchaseamount-discount;
             System.debug('name is'+name+'address is'+address+'purchase amount after discount is'+netamount);
          return netamount;
         }
        return netamount;  
    }
    
    // program does not contain price so we cannot caliculate discount 



     public static decimal task59(decimal annualsalary){
        decimal tax;
        if(annualsalary<=250000){
          tax=0;
          System.debug('Tax of your salary'+annualsalary+'is'+tax);
            return tax;
        }
          if(annualsalary>250000 && annualsalary<=500000){
            tax=0.1 * (annualsalary-250000);
            System.debug('Tax of your salary'+annualsalary+'is'+tax);
             return tax;
        }
          if(annualsalary>500000 && annualsalary<=1000000){
            tax=10000+ 0.2 * (annualsalary-500000);
            System.debug('Tax of your salary'+annualsalary+'is'+tax);
              return tax;
          }
          if(annualsalary>1000000){
            tax=25000+ 0.3 * (annualsalary-1000000);
            System.debug('Tax of your salary'+annualsalary+'is'+tax);
              return tax;
        }
         return tax;
              
     }
    
     public static decimal task60(decimal dayslate){
        decimal fine;
         if(dayslate<=5){
             fine=(dayslate * 40)/ 100;
             System.debug('fine for'+dayslate +'days is'+fine+'rs');
             return fine;
         }
          if(dayslate>=6 && dayslate<=10){
             fine=(dayslate * 65)/100;
             System.debug('fine for'+dayslate +'days is'+fine+'rs');
              return fine;
         }
          if(dayslate>10){
             fine=(dayslate * 80)/ 100;
             System.debug('fine for'+dayslate +'days is'+fine+'rs');
              return fine;
         }
         return fine;
         
    }
    
    public static void task62(){
        
        map<Integer,String> m1= new map<Integer,String>();
        m1.put(1, 'a');
        m1.put(2, 'b');
        m1.put(3, 'c');
        m1.put(4, 'd');
        
        set<integer> s=m1.keyset();
        for(integer a:s){
            system.debug('key is'+a+'value is'+m1.get(a));
            
        }   
    }
        
      public static integer task63(){
        
        map<Integer,String> m1= new map<Integer,String>();
        m1.put(1, 'a');
        m1.put(2, 'b');
        m1.put(3, 'c');
        m1.put(4, 'd');
           m1.put(5, 'e');
          system.debug('number of key value pairs in map is'+m1.size());
        
             return m1.size();
        

    }
    
     public static Boolean task64( map<Integer,String> m1){
        
     
         
         if(m1.size()==0){
             system.debug('true');
             return true;
         }
         else {
             system.debug('map size is'+m1.size());
             return false;
         }
     }
    
      public static void task65(){
        
        map<Integer,String> m1= new map<Integer,String>();
        m1.put(1, 'a');
        m1.put(2, 'b');
        m1.put(3, 'c');
        m1.put(4, 'd');
        m1.put(5, 'e');
          
          map<Integer,String> m2= new map<Integer,String>();
        m2.put(1, 'x');
        m2.put(2, 'y');
        m2.put(3, 'z');
        m2.put(4, 'a');
        m2.put(5, 'b');
          
          set<integer> s=m2.keySet();
          set<integer> a=m1.keySet();
          for(integer x:s){
              for(integer y:a){
                  if(m2.get(x) == m1.get(y)){
                      system.debug('matching data in both maps are:'+m2.get(x) +' '+m1.get(y));
                    
                  }
                  else{
                     system.debug('not matching data in both maps are:'+m2.get(x) +' '+m1.get(y)); 
                      
                  }
                 
              }
          }
       
      }
    
    //method to create duplicate copy of map 
     public static map<integer,string> task66(){
        
        map<Integer,String> m1= new map<Integer,String>();
        m1.put(1, 'a');
        m1.put(2, 'b');
        m1.put(3, 'c');
        m1.put(4, 'd');
        m1.put(5, 'e');
    
        map<Integer,String> m2= new map<Integer,String>(m1);//creating map m2 duplicate copy of map m1
     
         system.debug('Duplicate copy of map m1 is map map m2'+m2);
          set<integer> s=m2.keyset();
        for(integer a:s){
            system.debug('key is'+a+'value is'+m2.get(a));//printing map m2 key and values
        } 

           return m2;  
     }
    
    
    //program 67 i did not understand
    
    
    //method to remove specified key from map
    public static string task68(integer a){
        
        map<Integer,String> m= new map<Integer,String>();
        m.put(1, 'a');
        m.put(2, 'b');
        m.put(3, 'c');
        m.put(4, 'd');
        m.put(5, 'e');
    
        System.debug('Before removing key from map'+m);
        if(m.containsKey(a)){
         m.remove(a);
            System.debug('After removing key from map'+m);
            return a+'is removed';
        }
        else{
            System.debug('entered key is not matching with any key in map');
             return 'key'+a +'is not in map';
        }
        
    
    }
    
    //method to copy all the mapping from specified map to original map
     public static map<integer,String> task69(){
        
        map<Integer,String> m= new map<Integer,String>();
        m.put(1, 'a');
        m.put(2, 'b');
        m.put(3, 'c');
        m.put(4, 'd');
        m.put(5, 'e');
         
       map<Integer,String> m1= new map<Integer,String>();
         m1.putall(m);//copy all mappings from m map to m1 map
         m1.put(6,'f');
         m1.put(7,'g');
         
         system.debug('all the mappings from map m1 are'+m1);
           set<integer> s=m1.keyset();
        for(integer a:s){
            system.debug('key is'+a+'value is'+m1.get(a)); //printing map m1 key and values
          
        } 
          return m1;      
    }
    
    //method to sort the values of map using keyset()
     public static List<integer>  task70(){
        
        map<Integer,integer> m= new map<Integer,integer>();
        m.put(1, 34);
        m.put(2, 3);
        m.put(3, 88);
        m.put(4, 45);
        m.put(5, 344);
      
         List<integer> li= new List<integer>();
         set<integer> s=m.keyset();//puttting all the key values to set
          for(integer a:s){
           li.add(m.get(a));//a putting all the values of map to list for sorting purpose 
           }    
         System.debug('map values copied to  list'+li);
         li.sort();    //will sort the list
         System.debug('After sorting the list list is'+li);
        
         return li;
     }
    
    //adding element at specified index in list
     public static string task71(integer key,integer value){
     
         List<integer> li= new List<integer>();
         li.add(23);
         li.add(35);
         li.add(55);
         li.add(75);
         li.add(95);
         
          system.debug('Before adding element at specified index'+key+'is'+li);
         if(key>=0 && key<=li.size()){
         li.add(key, value);//adding element at specified index
          system.debug('After adding element at specified index'+key+'is'+li);
         system.debug('value at index'+key+'is'+li.get(key));
          
          return value+'is added at key'+key;
         }
         else{
           system.debug(key+'is not a correct key to place a valuein list');
           return key+'is not valid key to add into list';
         }
     
     }
    
    //method to add all the elements to the specified list from original list
     public static List<integer> task72(){
     
         List<integer> li= new List<integer>();
         li.add(23);
         li.add(35);
         li.add(55);
         li.add(75);
         li.add(95);
    
         List<integer> li1= new List<integer>(li);
         system.debug('adding li list values to li1 list'+li1);
         return li1;
         
     }
    
    //removing all the elements from the list
     public static string task73(){
     
         List<integer> li= new List<integer>();
         li.add(23);
         li.add(35);
         li.add(55);
         li.add(75);
         li.add(95);
    
         integer a=li.size()-1;
         system.debug('Before removing all elements from list'+li);
         for(integer i=a;i>=0;i--){
             li.remove(i);
         }
         
       
         String result;
         if(li.size()==0){
             system.debug('All the elemts are removed from list'+li);
             result='all the elements removed';
             return result;
         }
        return result;    
     }
    
    //method to retrun element from particular index
     public static integer  task74(integer key){
     
         List<integer> li= new List<integer>();
         li.add(23);
         li.add(35);
         li.add(55);
         li.add(75);
         li.add(95);
         
         integer result;
         if(key>=0 && key<=li.size()){
         li.get(key);
             result=li.get(key);
           return result;
         }
        return result;
         
     }
    
    
    //program 75 is not there in programs list
    
    //program 76 not done
     public static void task77(){
     
       
         List<string> li= new List<string>{'apple','banana','tiger','apple','banana','tiger','apple','lion','apple'};
          
            map<String,integer> m= new map<String,integer>();
         
         for(String s:li){
             if(m.containsKey(s)){
                 m.put(s,m.get(s)+1);
             }
             else{
                 m.put(s,1);
             }
         }
         
         Set<string> s1= m.keySet();
         for(string s2:s1){
             if(m.get(s2)>1 && m.get(s2)<=3){
                 system.debug(s2 +'is counted for'+m.get(s2)+'times');
             }
             if(m.get(s2)>3){
                 m.put(s2,3);
            
                 system.debug(s2 +'is counted for'+m.get(s2)+'times'); 
             }
         }
             
     }
        
      public static void task79(){
    
          List<string> li= new List<string>{'TAC','GDO','LIMK'};
           List<string> li1= new List<string>{'ACT','CAT','GOD','MILK'};   
              for(String s:li){
                  for(String s1:li1){             
                      if(sortstring(s1)==sortstring(s)){
                          system.debug('after jumbling the string '+s+'is'+s1);
                      }
                  }
              }
      
      
      }
    
     //related to task 79
    public static string sortstring(string s){

          string[] s1=s.split('');    
            s1.sort();
     //   system.debug(s1+'string is');
            string concatarray=' ';
            for(integer i=0;i<s1.size();i++){
                concatarray=concatarray+s1[i];
            }
       // system.debug('concat string is'+concatarray);
          
        return concatarray.trim();
    }
    
    
    
     public static string task80(integer a,integer b,string option){
         
          switch on option{
               when 'add'{
                   
                     system.debug('addition of a and b is'+(a+b));
                     return 'addition of a and b is'+(a+b);
               }
               when 'sub'{
                     system.debug('subtraction of a and b is'+(a-b));
                      return 'subtraction of a and b is'+(a-b);
               }
               when 'mul'{                   
                     system.debug('multiplication of a and b is'+(a*b));
                     return 'multiplication of a and b is'+(a*b);
               }
               when 'div'{
                 
                     system.debug('division of a and b is'+(a/b));
                     return 'division of a and b is'+(a/b);
               }
               when else{
                     system.debug('enter correct value');
                     return 'enter correct value';
               }       
           }
     
     }

    public static void task81(){
    
      map<string,integer> m1= new map<string,integer>();
        m1.put('Telangana',565656);
        m1.put('Andhrapradesh',565656);
        m1.put('TamilNadu',565656);
        m1.put('Karnataka',565656);
        m1.put('Maharastra',565656);

      map<string,integer> m2= new map<string,integer>();
          m2.put('East Godavari',565656);
          m2.put('West Godavari',565656);
          m2.put('Krishna',565656);
          m2.put('vizianagaram',565656);
          m2.put('vizag',5656);
          m2.put('vizag1',null);

        set<String> s3=m2.keyset();
        for(String s2:s3){
           if(m2.get(s2)==null){
             m2.remove(s2);
          }
       }
system.debug('after removing null values from  map m2'+m2);

set<String> s1=m2.keyset();
set<String> s2=m1.keyset();
for(String district:s1){
   for(String state:s2){
      if(m2.get(state)!=m1.get(district)){
             m2.remove(district);
       }

    }
}
        
   system.debug('after district is not matching with state remove them district map looks '+m2);     
}


public static void task82(){
     
List<integer> li= new List<integer>{18,98,18,56,9,9};
for(integer i=0;i<li.size();i++){
    for(integer j=i+1;j<li.size();j++){
     if(li.get(i)==li.get(j)){
      li.remove(j);        
}    

 }
}
system.debug('after removing duplicates list is'+li);
integer temp=0;
 for(integer i=0;i<li.size();i++){
    for(integer j=i+1;j<li.size();j++){
     if(li.get(i)<li.get(j)){
       temp=li.get(i);
       li[i]=li[j];
       li[j]=temp;            
}    
}
}
system.debug('list in descending order is'+li);

}

public static void task84(string country){
 
List<string> capitalcity=new List<string>{'New Delhi','colombo','NewYork','London'};

}

public static map<string,List<string>> task85(string country){
 
List<string> cities1= new List<string>{'Hyderabad','Bangalore','chennai','mumbai'};


List<string> cities2 = new List<string>{'New York','Bangalore','chennai','mumbai'};


List<string> cities3 = new List<string>{'london','Bangalore','chennai','mumbai'};



map<string,List<string>> m1= new map<string,List<string>>();
m1.put('india',cities1);
m1.put('us',cities2);
m1.put('uk',cities3);

if(m1.containskey(country)){
system.debug('related cities in the country'+country +'is'+m1.get(country));   
}

return m1;
}

public static void task85B(string sentence){

  string[] s1=sentence.split(' ');
  map<String,integer> m= new map<String,integer>();
         
         for(String s:s1){
             if(m.containsKey(s)){
                 m.put(s,m.get(s)+1);
             }
             else{
                 m.put(s,1);
             }
         }
 
   
        Set<string> s2= m.keySet();
         for(string s3:s2){
                 system.debug(s3 +'is counted for'+m.get(s3)+'times');
             }

for(string s4:s1){
system.debug('Number of characters in '+s4+'is'+s4.length());
}
}
public static string task86(string date1){
Date d1=Date.parse(date1);
integer month=d1.month();
string season;

if(month>=3 && month <=6){
season='summer';
system.debug('season is '+season);
return 'season is'+season;
}
else if(month>=7 && month <=9){
season='Rainy';
system.debug('season is '+season);
return 'season is'+season;
}
else if(month>=10 && month <=12){
season='winter';
system.debug('season is '+season);
return 'season is'+season;
}
else{
season='spring';
system.debug('season is '+season);
return 'season is'+season;
}

}

//program 87 is not there in programs


public static map<integer,List<string>> task88(integer pagenumber,List<string> things){
 
List<string> fruits= new List<string>{'grapes','apple','orange','banana'};


List<string> animals = new List<string>{'Lion','kangaaro','giraffe','elephant'};


List<string> colors = new List<string>{'yellow','orange','black','blue'};

map<integer,List<string>> m1= new map<integer,List<string>>();
m1.put(1,fruits);
m1.put(2,animals);
m1.put(3,colors);

if(m1.containskey(pagenumber)){

system.debug('related things in the pagenumber '+pagenumber +'is'+m1.get(pagenumber));

}
else{
m1.put(pagenumber,things);
system.debug('related things in the pagenumber '+pagenumber +'is'+m1.get(pagenumber));
}
return m1;
}    
}