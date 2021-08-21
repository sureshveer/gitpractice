public class apexlivecodingjune9task17 {

   
  
   
    public string selectedaccsource{get;set;}
    public string selectedindustry{get;set;}
    
  //  public  List<Account> acclistindustry{get;set;}
  //  public  List<Account> acclistaccountsource{get;set;}
     public  List<Account> bothacclist{get;set;}
    
   public List<SelectOption> getaccindustrylist(){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption(' ',' '));
        Schema.DescribeFieldResult fr = Account.industry.getDescribe();
        List<Schema.PicklistEntry> ple = fr.getPicklistValues();
        for(Schema.PicklistEntry p:ple){
            options.add(new SelectOption(p.getValue(),p.getValue()));
        }
        return options;
    }
    
    
    public List<SelectOption> getaccsourcelist(){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption(' ',' '));
        Schema.DescribeFieldResult fr = Account.Accountsource.getDescribe();
        List<Schema.PicklistEntry> ple = fr.getPicklistValues();
        for(Schema.PicklistEntry p:ple){
            options.add(new SelectOption(p.getValue(),p.getValue()));
        }
        return options;
    }
    
    public void result(){

        system.debug('checking');
        
        if(selectedindustry!=null || selectedaccsource!=null){
        bothacclist=[select name,accountnumber,industry,rating,phone,accountsource,Billingcity,annualrevenue from account where industry=:selectedindustry 
                     or accountsource=:selectedaccsource];
        }
        
        system.debug('bothacclist is'+bothacclist);
        }
        
}