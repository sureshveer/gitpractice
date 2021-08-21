public class aplexlivetask3helper {

     public string accname{get;set;}
     public string selectedleadstatus{get;set;}
    public List<case> caselist{get;set;}
    public List<accountwrapper>  acctwrapperlist{get;set;}
  
   
    public Boolean caselistvalue{get;set;}
    
    public aplexlivetask3helper(){
        caselistvalue=false;
       
        acctwrapperlist=new List<accountwrapper>();
                   
    }
    
    public List<SelectOption> getleadstatuslist(){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption(' ',' '));
        Schema.DescribeFieldResult fr = case.status.getDescribe();
        List<Schema.PicklistEntry> ple = fr.getPicklistValues();
        for(Schema.PicklistEntry p:ple){
            
            options.add(new SelectOption(p.getValue(),p.getValue()));
        }
        return options;
    }
    
    public pagereference Searchcase(){
      
        caselist=[select id,status,accountid from case where account.name=:accname and status=:selectedleadstatus];
        if(caselist.size()>0){
            caselistvalue=true;
        }
        string errmsg=' ';
        apexpages.message msg=new  apexpages.Message(apexpages.Severity.ERROR,errmsg);
         if(caselist.size()==0){
            caselistvalue=false;
            errmsg='case records list is zero with account name'+' '+accname;
              msg=new  apexpages.Message(apexpages.Severity.ERROR,errmsg);
           
        }
        if(accname==null || accname==' '){
             caselistvalue=false;
            errmsg='accname should not be null';
              msg=new  apexpages.Message(apexpages.Severity.ERROR,errmsg);
        }
         apexpages.addMessage(msg);
        
        for(case c:caselist){
            acctwrapperlist.add(new accountwrapper(c));
        }
        
         
        
        return null;
    }
    
    public pagereference deletecase(){
        List<case> caselisttodelete=new List<case>();
       List<accountwrapper> acctwrapperaftercasedelete=new List<accountwrapper>();

        for(accountwrapper aw:acctwrapperlist){
            if(aw.selected==true){
               caselisttodelete.add(aw.c);
            }
            else{
                acctwrapperaftercasedelete.add(aw);
            }
        }
        delete caselisttodelete;
        acctwrapperlist=acctwrapperaftercasedelete;
        
        
        return null;
    }


 public class accountwrapper{
    
    public case c{get;set;}
    public Boolean selected{get;set;}
    
     public accountwrapper(case ca){
         c=ca;
         selected=false;
     }
    
}
}