public class task18helperclass {

      public  date startdate {get;set;}
     public  date enddate {get;set;}
     public static List<case> caselist {get;set;}
    
    public  pagereference task18(){
        if(startdate!=null && enddate!=null ){
     caselist=[select id,accountid,ContactPhone,ClosedDate from case where ClosedDate>=:startdate and ClosedDate<=:enddate];
        system.debug('caselist is '+caselist);
        system.debug('caselist size is'+caselist.size());
        }
    return null;
    }
}