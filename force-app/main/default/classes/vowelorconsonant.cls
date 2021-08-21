public class vowelorconsonant {

    public static void task28(String s){

       if(s.equalsIgnoreCase('a') || s.equalsIgnoreCase('e') || s.equalsIgnoreCase('i') || s.equalsIgnoreCase('o') || s.equalsIgnoreCase('u')) 
       {
           system.debug(s+ 'is a vowel');
       }
        else
        {
            system.debug(s+'is aconsonant');
        }
       
    }
}