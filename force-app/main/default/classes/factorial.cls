public class factorial {

    public static void task23(integer n){
         integer res = 1, i; 
        for (i=2; i<=n;i++) {
            res *= i;
        }
        system.debug('factorial of'+n +'is'+res);
    }
    
}