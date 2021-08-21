public class Numberlist {
    
     public static integer totalnumbers(integer[] a){

        integer sum=0;
        for(integer i=0;i<a.size();i++){
            sum=sum+a[i];
        }
        system.debug('total of numbers is'+sum); 
         return sum;
    }
}