public class apexlvctask28 {

    public string selectedrating{get;set;}
    public string selectedindustry{get;set;}
     public List<Account> actlist{get;set;}
    public Boolean viewact{get;set;}
    
    public apexlvctask28(){
        viewact=false;
        actlist= new List<Account>();
    }
    
      public List<SelectOption> getratinglist(){
        List<SelectOption> options = new List<SelectOption>();
       options.add(new SelectOption('none','none'));
        Schema.DescribeFieldResult fr = Account.rating.getDescribe();
        List<Schema.PicklistEntry> ple = fr.getPicklistValues();
        for(Schema.PicklistEntry p:ple){
            options.add(new SelectOption(p.getValue(),p.getValue()));
        }
        return options;
    }
    
      public List<SelectOption> getindustrylist(){
        List<SelectOption> options = new List<SelectOption>();
       options.add(new SelectOption('none','none'));
        Schema.DescribeFieldResult fr = Account.industry.getDescribe();
        List<Schema.PicklistEntry> ple = fr.getPicklistValues();
        for(Schema.PicklistEntry p:ple){
            
            options.add(new SelectOption(p.getValue(),p.getValue()));
        }
        return options;
    }
    
    public pagereference accountrecords(){
          
        if(selectedrating=='none' && selectedindustry=='none'){
           
            ApexPages.addmessage(new ApexPages.Message(ApexPages.severity.ERROR,'Rating and industry should not be none'));  
        }
        else if(selectedrating=='none'){
            ApexPages.addmessage(new ApexPages.Message(ApexPages.severity.ERROR,'Rating should not be none'));  
        }
       else if(selectedindustry=='none'){
            ApexPages.addmessage(new ApexPages.Message(ApexPages.severity.ERROR,'industry should not be none'));                      
        }
        
        if(selectedindustry !='none' && selectedrating !='none'){
        actlist=[select id ,name,rating,industry from account  where rating=:selectedrating and industry=:selectedindustry];
        
        if(actlist.size()>0){
            viewact=true;
        }
        else if(actlist.size()==0){
            viewact=false;
             ApexPages.addmessage(new ApexPages.Message(ApexPages.severity.error,'Account list is zero for inputs given')); 
        }
        }
        return null;
    }
}