trigger Trigger8 on Account (before insert,after insert) {

    for(Account a:Trigger.new){
        if(Trigger.isBefore && Trigger.isinsert){
        if(!(a.Min_No_Of_Contacts__c >=1)){
            a.adderror('Min_No_Of_Contacts__c field should be greateer than or equal to 1');
        }
        }
        
      if(Trigger.isAfter && Trigger.isinsert){
        List<Contact> contactlist = new List<Contact>();
        for(integer i=0;i<a.Min_No_Of_Contacts__c;i++){
            contactlist.add(new Contact(Accountid=a.id,lastname='coorg'+i,phone='949400194'+i));
        }
    
    insert contactlist; 
    }
        
    }
}