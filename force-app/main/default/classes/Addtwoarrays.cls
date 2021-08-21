public class Addtwoarrays {

    public static integer[] task4(integer[] a,integer[] b){
       
        integer length=a.size()<b.size()?a.size():b.size();
        system.debug('length is'+length);
        integer[] result= new Integer[length];
        for(integer i=0;i<length;i++){
        result[i]=a[i]+b[i];   
        }
        system.debug('result list is'+result);
        return result;
    }
}