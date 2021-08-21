public class apextask1usingvf {

    //mytask
      public static integer firstinput{get;set;}
     public static integer secondinput{get;set;}
   
   
       public static integer result{get;set;}
    
    
     public static string operations{get;set;}
    
    //livetask
    public static string firststring{get;set;}
    public static string secondstring{get;set;}
     public static string concatstring{get;set;}
    
     public static string comparestring{get;set;}
     public static string capitalstring{get;set;}
     public static integer totalchars{get;set;}
    
    //task5
     public static integer subeng{get;set;}
    public static integer subtel{get;set;}
    public static integer submat{get;set;}
    public static integer subsoc{get;set;}
    public static integer subsci{get;set;}
    public static integer totalmarks{get;set;}
    public static decimal percentage{get;set;}
    
    //task6
    public static string samplestring{get;set;}
    public static string stringpalindrome{get;set;}
    
    //My task logic
    public static pagereference  operation(){
        
    
      
        if(operations=='addition'){
        result=firstinput+secondinput;
        system.debug('result is'+result);
        }
        else if(operations=='subtract'){
             result=firstinput-secondinput;
        system.debug('result is'+result);
        }
        else if(operations=='multiply'){
             result=firstinput*secondinput;
        system.debug('result is'+result);
        }
        else if(operations=='division'){
            result=firstinput/secondinput;
        system.debug('result is'+result);
        }
        else{
             result=math.mod(firstinput, secondinput);
        system.debug('result is'+result);
        }
        return null;
    }
    
    //live task logic
     public static pagereference  task2logic(){
         //concat string logic
        concatstring=firststring+secondstring;
        system.debug('after conting string is'+concatstring);
         
         //comparing string size
         if(firststring.length()==secondstring.length()){
             system.debug('strings  are equal');
             comparestring='Strings are equal';
         }
         else if(firststring.length()>=secondstring.length()){
             system.debug('first string greater in size');
             comparestring='first string greater in size';
             
         }
         else{
              system.debug('second string greater in size');
             comparestring='second string greater in size';
         }
     
         
         //display strings in capital letters
         if(firststring.isAllLowerCase() || secondstring.isAllLowerCase()){
                capitalstring=firststring.toUpperCase();
                  capitalstring=capitalstring+secondstring.toUpperCase();
         }
         
         //total no of chars in two strings
        totalchars=firststring.length()+secondstring.length();
         
         
        
        return null;
    }
    
    //task5 logic
     public static pagereference  marks(){
           totalmarks=subeng+subtel+submat+subsci+subsoc;
            percentage=(subeng+subtel+submat+subsci+subsoc)/5;
         return null;
     }
    //task6 logic
    public static pagereference  task6(){
    
        String reversestring=' ';
        for(integer i=samplestring.length()-1;i>=0;i--){
            reversestring=reversestring+samplestring.mid(i, 1);
        }
        if(reversestring.trim()==samplestring){
            system.debug('string'+' '+samplestring+' '+'is a palindrome');
            stringpalindrome='string'+' '+samplestring+' '+'is a palindrome';
        }
        else{
            system.debug('string'+' '+samplestring+'is not a palindrome');
            stringpalindrome='string'+' '+samplestring+' '+'is not a palindrome';
        }
        
        
        return null;
    
    
    }
}