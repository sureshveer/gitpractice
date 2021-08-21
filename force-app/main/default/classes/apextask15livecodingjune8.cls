public class apextask15livecodingjune8 {

    public string accname{get;set;}
    public List<account>  acclist{get;set;}
 
    public void show(){
         acclist=[select id, name ,industry,rating from account where name=:accname];
    }
    
    public void save(){
        update acclist;
    }
}