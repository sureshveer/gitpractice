public class PDFController1 {
    public List<Account> acclist {get;set;}
   
    public PDFController1() {
        //listEmployees = new List<Account>();
        acclist = [SELECT id,Name, industry FROM Account];
    }
}