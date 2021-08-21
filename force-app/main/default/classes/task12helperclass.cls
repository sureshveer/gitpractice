public class task12helperclass {
    public static  list<selectoption>  Accountnamelist{get;set;}
    public static  list<Account>  Acctlist{get;set;}
    public static  string  Accountname{get;set;}
    
    
      public task12helperclass(){
        
    string   searchaccname=apexpages.currentPage().getparameters().get('Accountname');
        if(searchaccname!=' '){
            
            Accountname=searchaccname;
            gettask12();
        }
    }
    
    public static  list<selectoption> gettask12(){
      //  Acctlist=new list<string>();
      
        list<account> acc=[select id, name,industry from  account];
         Acctlist=[select id, name,industry,rating from  account where name=:Accountname];
        Accountnamelist=new list<selectoption>();
        Accountnamelist.add(new SelectOption('None','--- None ---')); 
        
        for(account a:acc){
            Accountnamelist.add(new SelectOption(a.name,a.name));  
            
        }
         
        return Accountnamelist;
    }
    public static pagereference show(){
        gettask12();
        return null;
    }
    
}