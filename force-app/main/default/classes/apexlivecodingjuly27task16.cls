public class apexlivecodingjuly27task16 {
    
    public static void task16(List<case> caselist){
        
        for(case c:caselist){
            if(c.DueDate__c > date.today()){
                case c1= new case(status='new',origin='web');
                c.parentid=c1.id;
            }
        }
        update caselist;
        system.debug('caselist is'+caselist);
    }

}