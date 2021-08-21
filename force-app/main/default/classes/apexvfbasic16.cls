public class apexvfbasic16 {

  public list<account>  acclist {get;set;}
    public apexvfbasic16(){
        acclist=[select id,name,phone from account];
    }
}