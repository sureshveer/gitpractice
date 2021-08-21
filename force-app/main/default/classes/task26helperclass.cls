public class task26helperclass {
    
    public List<account> acclist{get;set;}

    public task26helperclass(){

        acclist=[select id,name,(select id, name from contacts) from account];
     
       
    }

}