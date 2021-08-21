public class task17helperclass {
    
     public  integer startamount {get;set;}
     public  integer endamount {get;set;}
     public static List<opportunity> opplist {get;set;}
    
    public  pagereference task17(){
     opplist=[select id, name,accountid,amount from opportunity where amount>=:startamount and amount<=:endamount];
    return null;
    }
}