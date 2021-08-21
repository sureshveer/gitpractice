public class livecodingmay26 {

    public static integer firstinput{get;set;}
     public static integer secondinput{get;set;}
     public static integer thirdinput{get;set;}
   
    public static integer result{get;set;}
    
     public static string operations{get;set;}
    
    public static string firststring{get;set;}
    public static string secondstring{get;set;}
     public static string concatstring{get;set;}
    
     public static string comparestring{get;set;}
     public static string capitalstring{get;set;}
     public static integer totalchars{get;set;}
    
    //addition of 3 values logic
    public static pagereference  addition(){
        
        if(operations=='addition'){
        result=firstinput+secondinput+thirdinput;
        system.debug('result is'+result);
        }
        else if(operations=='subtract'){
             result=firstinput-secondinput-thirdinput;
        system.debug('result is'+result);
        }
        else if(operations=='multiply'){
             result=firstinput*secondinput*thirdinput;
        system.debug('result is'+result);
        }
        else{
            result=firstinput/secondinput;
        system.debug('result is'+result);
        }
        return null;
    }
    
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
    
   
     
    
    
}