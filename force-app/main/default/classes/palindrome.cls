public class palindrome {

    public static void task6(integer num){
        
        integer rev=num;
        integer r,sum=0;
        
        while(num>0){
            r=math.mod(num, 10);
            sum=(sum*10)+r;
            num=num/10;
        }
        if(rev==sum){
            system.debug(sum+'is palindrome');   
        }
        else{
            system.debug(sum+'is not a palindrome');
        }

    }
}