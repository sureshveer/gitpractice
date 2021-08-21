public class apexhelpertask37 {

    public string selectedaccsource{get;set;}
    
    
    public List<SelectOption> getaccsourcelist(){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption(' ',' '));
        Schema.DescribeFieldResult fr = Account.AccountSource.getDescribe();
        List<Schema.PicklistEntry> ple = fr.getPicklistValues();
        for(Schema.PicklistEntry p:ple){
            options.add(new SelectOption(p.getValue(),p.getValue()));
        }
        return options;
    }
    
    public pagereference searchfileds(){
        List<account> acclist=[select id,name,Active__c,AccountSource,AnnualRevenue from account where accountsource=:selectedaccsource];
        
        return  null;
    }
    
    class wrapperclass{
        public string lastname{get;set;}
        public string accname{get;set;}
        public string active{get;set;}
        public string accsource{get;set;}
         public decimal annualrevenue{get;set;}
        
        public wrapperclass(string lname,string aname,string act,string asource,decimal annrevenue){
            this.lastname=lname;
            this.accname=aname;
            this.active=act;
            this.accsource=asource;
            this.annualrevenue=annrevenue;
            
        }
        
        
    }
    
}