public class apexvfbasic30 {

    public string leadname{get;set;}
    public string leadcompany{get;set;}
       public decimal leadrevenue{get;set;}
    public string leadtitle{get;set;}
    public string leadrating{get;set;}
   
    
    public  apexvfbasic30(Apexpages.StandardController stdcontroller){
  
        
    }
    
    public void savelead(){
        
      Lead l= new Lead();
        l.LastName=leadname;
        l.Company=leadcompany;
        l.annualrevenue=leadrevenue;
        l.Title=leadtitle;
        l.Rating=leadrating;
            
        insert l;
        apexpages.Message msg=new apexpages.Message(apexpages.Severity.CONFIRM,leadname+'inserted successfully');
        apexpages.addMessage(msg);
    }
}