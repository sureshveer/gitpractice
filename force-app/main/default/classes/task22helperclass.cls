public class task22helperclass {

    public List<account> acclist{get;set;}
    
    public task22helperclass(){
        
        acclist=[select id,name,industry,rating from account];
    }
}