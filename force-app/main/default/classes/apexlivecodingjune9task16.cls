public class apexlivecodingjune9task16 {

    public contact con{get;set;}
    public List<contact> conlist1;
   
   
    public apexlivecodingjune9task16(){
        con= new contact();
        
    }
  
    public pagereference insertcontact(){
     
        insert con;
        
        pagereference page= new pagereference('/apex/rediredtlivenune9task16');
        page.setRedirect(true);
        return page;
    }
    
    public List<contact>  getconlist(){
        conlist1=[select lastname,phone,email,description,createddate from contact order by createddate desc limit 10];
        return conlist1;
        
    }
}