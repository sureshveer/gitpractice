public class apexvfopen {

    public account acc{get;set;}
    public apexvfopen(){
        acc= new account();
         acc=[select id,name,vfcount__c from account where name='vfopen'];
          list<Messaging.singleEmailMessage> mails=new list<Messaging.SingleEmailMessage>();
    Messaging.singleEmailMessage mail=new Messaging.SingleEmailMessage();
       
       List<string> toaddlist=new List<string>();
        system.debug('email'+userinfo.getUserName());
        toaddlist.add(userinfo.getUserName());
        mail.setToAddresses(toaddlist);
       mail.setSubject('vf page loaded count');
        if(acc.vfcount__c != null){
            mail.setPlainTextBody('Hi' +userinfo.getName()+'Your vf page is loaded count is'+(acc.vfcount__c+1));
        }
        else if(acc.vfcount__c==null){
             mail.setPlainTextBody('Hi' +userinfo.getName()+'Your vf page is loaded count is'+1);
        }
       mails.add(mail);
           messaging.sendEmail(mails);
   
      
    }
    
    public pagereference vfcount(){
       
          acc=[select id,name,vfcount__c from account where name='vfopen'];
         system.debug('acc'+acc);
       if(acc.vfcount__c==null){
            system.debug('accnull'+acc);
            acc.vfcount__c=1;
            
        }
       else if(acc.vfcount__c!=null){
            system.debug('accnotnull'+acc);
        acc.vfcount__c++;
        
       // system.debug('acc'+acc);

        }
        update acc;
        return null;
    }
}