public class pdfcontroller {

     public List<account>  accList{get;set;}
    public pagereference pdfbutton(){
        
        pagereference p= new Pagereference('/apex/redirectvftask31');
        p.setRedirect(true);
        return p;
    }
    
    public pdfcontroller(){
         accList = [select id,name,type,accountnumber,annualrevenue,Rating from account limit 10];
    }
}