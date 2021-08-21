public class redirectapextask10livecodingjune10 {

     public case caserecord{get;set;}
    
     public redirectapextask10livecodingjune10(){
          id  x=apexpages.currentPage().getparameters().get('id');
       system.debug('x value is'+x);
         caserecord=[select id,status,subject,type from case where id=:x limit 1];
    }
}