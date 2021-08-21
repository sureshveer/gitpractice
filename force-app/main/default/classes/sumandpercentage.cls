public class sumandpercentage {
    
    public static void task5(integer mathsmarks,integer sciencemarks,integer telugumarks,integer socialmarks,integer englishmarks){

        List<Integer> li= new List<Integer>();
        li.add(mathsmarks);
        li.add(sciencemarks);
        li.add(telugumarks);
        li.add(socialmarks);
        li.add(englishmarks);
        integer sum=0;
        for(integer i=0;i<li.size();i++){
 
            sum=sum+li[i];
        
        }
        system.debug('total marks are'+sum);
        double percentage=sum/li.size();
        system.debug('percentage is'+percentage);
    }
}