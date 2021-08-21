public class apexvfbasic17 {

  public list<contact>  ctlist {get;set;}
    public apexvfbasic17(){
        ctlist=[select name,phone,Department from contact];
    }
}