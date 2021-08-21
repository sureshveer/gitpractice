public class task8helperclass {

     public static string firststring{get;set;}
    public static string secondstring{get;set;}
     public static string concatstring{get;set;}
    
     public static pagereference  task8(){
         //concat string logic
        concatstring=firststring+secondstring;
        system.debug('after conting string is'+concatstring);
     return null;
     }
}