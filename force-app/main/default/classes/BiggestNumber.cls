public class BiggestNumber {

    public static void ThreeNumbers(integer num1,integer num2,integer num3){

        if(num1>num2 && num1>num3){
            system.debug('BiggestNumber is'+num1);
        }
        else if(num2>num3 && num2>num1){
            system.debug('Biggest Number is'+num2);
        }
        else{
            system.debug('Biggest number is '+num3);
        }    
    }
    
}