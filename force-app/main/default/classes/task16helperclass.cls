public class task16helperclass {

      public   string  Accountname{get;set;}
     public static  list<selectoption>  Accountnamelist{get;set;}
      public static  list<contact>  conlist{get;set;}
    
   
    
     public static  list<selectoption> gettask16(){
      //  Acctlist=new list<string>();
         
      
        list<account> acc=[select id, name,industry from  account];
          Accountnamelist=new list<selectoption>();
          Accountnamelist.add(new SelectOption('None','--- None ---')); 
         
           for(account a:acc){
            Accountnamelist.add(new SelectOption(a.name,a.name));       
           }
         
         return Accountnamelist;
     }
    
     public  pagereference show(){
         if(accountname != null){
          system.debug('account name is'+accountname);
          conlist=[select id, name from contact where contact.account.name = :Accountname];
         system.debug('contact list is'+conlist);
         system.debug('contact list size is'+conlist.size());
         }
        return null;
    }
    
}