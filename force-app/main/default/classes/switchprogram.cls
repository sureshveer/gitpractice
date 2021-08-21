public class switchprogram {

    public static void task21(integer a,integer b){

        for(integer i=1;i<5;i++){
           switch on i{
               when 1{
                     system.debug('addition of a and b is'+(a+b));
               }
               when 2{
                     system.debug('subtraction of a and b is'+(a-b));
               }
               when 3{
                     system.debug('multiplication of a and b is'+(a*b));
               }
               when 4{
                     system.debug('division of a and b is'+(a/b));
               }
               when else{
                     system.debug('enter correct value');
               }       
           }
       }
    }
}