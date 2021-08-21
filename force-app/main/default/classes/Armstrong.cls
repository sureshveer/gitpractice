public class Armstrong {

    public static void task17(integer num){
        
        integer x=num;
        integer y=num;
        integer r;
        double temp=0;

        
        integer count=0;
        while(num!=0){
           num=num/10;
            count++;
        }
        
        while(x>0){
            r=math.mod(x, 10);
            temp=temp+math.pow(r, count);
            x=x/10;
        }
        if(y==temp){
            system.debug(temp+'is Armstrong Number');   
        }
        else{
            system.debug(temp+'is not a Armstrong Number');
        }
        
    }
}