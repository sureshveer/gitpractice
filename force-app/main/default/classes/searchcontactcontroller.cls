public class searchcontactcontroller {

    public string name{get; set;}
    public List<contact> contacts{get;set;}
    public List<Opportunity> opportunities{get; set;}
     public List<Case> cases{get; set;}
   // public List<contact> contacts1{get;set;}
   // public string searchcontact;
   
    public searchcontactcontroller(){
        
    string   searchcontact=apexpages.currentPage().getparameters().get('name');
        if(searchcontact!=' '){
            
            name=searchcontact;
            searchcontact();
        }
    }
    public PageReference searchcontact(){

      //  contacts1=new List<contact>();
         contacts= [select name,phone,email  from contact where contact.Account.name=:name];
         opportunities= [select name,type,amount  from Opportunity where Opportunity.Account.name=:name];
        cases= [select CaseNumber,status,subject,type  from Case where Case.Account.name=:name];
      
        system.debug('contacts is'+contacts);
         return null;
    }
    
    
    
}