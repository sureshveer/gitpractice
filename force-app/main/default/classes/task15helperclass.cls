public class task15helperclass {


    public  string Accountid{get;set;}
    public  string acctname{get;set;}
    public string Industry {get;set;}
    public integer AnnualRevenue {get;set;}
    public string contactname {get;set;}
    public string Email {get;set;}
    public string Department {get;set;}
    public List<Account> acclist{get;set;}
  
    public  void saveacct(){
        
     //   acclist=[select id,name,industry,annualrevenue,(select name,Accountid,email,department from contacts) from account];
     Account a = new Account();
        contact c= new Contact();
         a.name=acctname;
                a.industry=Industry;
                a.annualrevenue=AnnualRevenue;
      //  a.lastname=AccountName;
        
        c.lastname=contactname;
         c.accountid=Accountid;
         c.email=Email;
          c.department=Department;
        
        insert a;
        insert c;
    
}
}