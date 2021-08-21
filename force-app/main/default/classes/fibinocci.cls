public class fibinocci {

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
        
}