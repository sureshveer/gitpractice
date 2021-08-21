public class Apexjuly27task16 {
    
    public static void tak16(List<case> caselist){
        for(case c:caselist){
            if(c.DueDate__c >Date.today()){
                case c1= new case(status='new',origin='web');
                c.ParentId=c1.Id;
            }
        }
        update caselist;
        system.debug('caselist is'+caselist);
    }

}