public class apexvfbasic19 {

  public list<Case>  Caselist {get;set;}
    public apexvfbasic19(){
        Caselist=[select Origin,ContactEmail from Case];
    }
}