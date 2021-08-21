public class NaturalNumbers {

    public static void task29(integer n){

        integer sum=0;
        for(integer i=1;i<=n;i++){
            sum=sum+i;
            system.debug('Natural numbers '+i);
        }
        system.debug('sum of natural numbers is'+sum);
    }
}