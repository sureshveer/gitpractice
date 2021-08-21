@istest
public class testlivecodingtask12july16 {

    @istest
    public static void testtask12(){
        List<case> c= new List<case>();
        
         c.add(new case(priority='High',origin='phone',status='New'));
         c.add(new case(priority='Medium',origin='phone',status='New'));
         c.add(new case(priority='Low',origin='phone',status='New'));
      
       
       insert c;
    }
}