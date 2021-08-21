public class apexvfbasic29 {

     public string accname{get;set;}
    public string industry{get;set;}
   
    
    public  apexvfbasic29(Apexpages.StandardController stdcontroller){
  
        
    }
    
    public pagereference saveacc(){
        
      Account acc= new Account();
        acc.name=accname;
        acc.Industry=industry;
        
        system.debug('account details are'+acc);
        insert acc;
        
        // apexpages.Message msg=new apexpages.Message(apexpages.Severity.CONFIRM,accname+'inserted successfully');
       // apexpages.addMessage(msg);
        acc.clear();
        pagereference pr= new pagereference('https://ap16.lightning.force.com/lightning/o/Account/list?filterName=Recent');
        pr.setRedirect(false);
        return pr;
    }    
    
}