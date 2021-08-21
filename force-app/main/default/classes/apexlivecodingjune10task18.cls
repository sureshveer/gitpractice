public class apexlivecodingjune10task18 {

    public Account acc{get;set;}
   
    
    public string selectedrating{get;set;}
   public string selectedownership{get;set;}
    public string selectedtype{get;set;}
     public string name{get;set;}
     public string phone{get;set;}
    
    public apexlivecodingjune10task18(Apexpages.StandardController stdcontroller){
        
    }
    
    public apexlivecodingjune10task18(){
        
    }
    
  public List<SelectOption> getratinglist(){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption(' ',' '));
        Schema.DescribeFieldResult fr = Account.rating.getDescribe();
        List<Schema.PicklistEntry> ple = fr.getPicklistValues();
        for(Schema.PicklistEntry p:ple){
            options.add(new SelectOption(p.getValue(),p.getValue()));
        }
        return options;
    }
    
    public List<SelectOption> getownershiplist(){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption(' ',' '));
        Schema.DescribeFieldResult fr = Account.ownership.getDescribe();
        List<Schema.PicklistEntry> ple = fr.getPicklistValues();
        for(Schema.PicklistEntry p:ple){
            options.add(new SelectOption(p.getValue(),p.getValue()));
        }
        return options;
    }
    
    public List<SelectOption> gettypelist(){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption(' ',' '));
        Schema.DescribeFieldResult fr = Account.type.getDescribe();
        List<Schema.PicklistEntry> ple = fr.getPicklistValues();
        for(Schema.PicklistEntry p:ple){
            options.add(new SelectOption(p.getValue(),p.getValue()));
        }
        return options;
    }
    
    
    public pagereference insertacc(){
        acc= new Account();
        acc.name=name;
        acc.phone=phone;
        acc.Rating=selectedrating;
        acc.Ownership=selectedownership;
        acc.Type=selectedtype;
        insert acc;
        
        
       pagereference page= new pagereference('/apex/rediredtlivenune10task16');
        page.setRedirect(true);
        return page;
        
    }
    
    public List<account> getaccts(){
        
     List<account> acclist=[select id, name,rating,industry from account order by createddate desc];
      
        return acclist;
    }
}