public class apexvfbasic18 {

  public list<opportunity>  opplist {get;set;}
    public apexvfbasic18(){
        opplist=[select Amount,CloseDate from opportunity];
    }
}