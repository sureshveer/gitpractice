trigger Trigger9 on Contact(after  insert) {

    for(Contact c:Trigger.new){
      List<Account> act = [select id,No_Of_Contacts__c,(select name from contacts) from account where id=:c.AccountId];
    
     // List<Account> act= [select No_Of_Contacts__c from Account where name=:c.Account.name];
        for(Account a:act){
            a.No_Of_Contacts__c=a.contacts.size();
        }
        update act;
    }
}