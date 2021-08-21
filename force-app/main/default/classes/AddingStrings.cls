public class AddingStrings {

    public static void  task12(String s1,String s2){

       string s3=s1+s2;
        system.debug('after concating two strings'+s3);
        for(integer i=0;i<s1.length();i++){
            s2=s2+s1.charAt(i);
            system.debug('charac'+s1.charAt(i));
        }
        system.debug('after concating using for loop'+s2);
    }
}