public class apexvfbasic31 {

     public string accname{get;set;}
    public string industry{get;set;}
    public string rating{get;set;}
   
    
    public  apexvfbasic31(Apexpages.StandardController stdcontroller){
  
        
    }
    
    public void saveacc(){
        
      Account acc= new Account();
        acc.name=accname;
        acc.Industry=industry;
        acc.Rating=rating;
        system.debug('account details are'+acc);
        insert acc;
         apexpages.Message msg=new apexpages.Message(apexpages.Severity.CONFIRM,accname+'inserted successfully');
        apexpages.addMessage(msg);
    }    
}