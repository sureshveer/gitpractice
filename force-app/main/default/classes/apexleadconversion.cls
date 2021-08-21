public class apexleadconversion {
    
    public  Id x{get;set;}
    
  

    public pagereference leadconversionfunction(){
        List<lead> leadlist= new List<lead>();
        List<account> acclist= new List<account>();
        List<contact> conlist=new List<contact>();
        list<string> accnamelist=new List<string>();
       /* for(lead l:leadlist){
            accnamelist.add(l.Company);
        }*/
        
          x=ApexPages.currentPage().getparameters().get('id');
        system.debug('inside constructor'+x);
        
        lead l1= [select id ,name,lastname,FirstName,company,email,phone from lead where id=:x];
        integer index=l1.email.indexOf('@');
        string domainname=l1.email.substring(index);
        system.debug(index +domainname);
        integer accnamecount=[select count() from account where domainname__c =:domainname];
        system.debug('accnamecount'+accnamecount);
       Account a1;
        try{
         a1=[select id ,name from account where domainname__c =:domainname];
        system.debug('a1'+a1);
        }
        catch(Exception e){
            system.debug('e'+e);
        }
        
           Account a;
       
          
            if(accnamecount==0){
                system.debug(' to  create acc');
             a =new Account();
            a.Name=l1.Company;
            a.domainname__c=domainname;    
            acclist.add(a);
            }
          
       
       
       
             system.debug('acclist23'+acclist);
        insert acclist;
        
         system.debug('acclist'+acclist);
        
    
          contact c= new contact();
            c.lastname=l1.LastName;
            c.firstname=l1.FirstName;
            c.Phone=l1.Phone;
            c.Email=l1.Email;
             if(accnamecount==0){
            c.AccountId=a.id;
             }
            else{
                 c.AccountId=a1.id;
            }
            conlist.add(c);
         system.debug('c'+c);
         
            insert conlist;   
       /* if(accnamecount==0){
                 system.debug('x');
        insert conlist;
             }
        else {
             system.debug('y');
           update conlist;
        }*/
        return null;
    }
}