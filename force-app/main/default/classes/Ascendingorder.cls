public class Ascendingorder {
    
    public static void task11(integer[] a){
        integer temp;
        for(integer i=0;i<a.size();i++){
            for(integer j=i+1;j<a.size();j++){
                if(a[i]>a[j]){
                    temp=a[i];
                    a[i]=a[j];
                    a[j]=temp;
                }
            }
        }
        for(integer k=0;k<a.size();k++){
        system.debug('ascending order is'+a[k]);
        }
    }

}