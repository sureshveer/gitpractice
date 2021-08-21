public class task1helperclass {

     public static integer firstinput{get;set;}
     public static integer secondinput{get;set;}
     public static integer result{get;set;}
     public static string operations{get;set;}
    
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
}