@istest
public class Testapexlivecodingjuly27task16 {

    @istest
    public static void Testtask16(){
        List<case> c= new List<case>();
        for(integer i=1;i<10;i++){
            c.add(new case(status='new',priority='High',origin='phone'));
        }
        insert c;
        Test.startTest();
        apexlivecodingjuly27task16.task16(c);
        Test.stopTest();
    }
    
}