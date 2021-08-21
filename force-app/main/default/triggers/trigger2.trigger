trigger trigger2 on Account (after insert) {

    List<Contact> contactlist = new List<Contact>();
     for(Account a:Trigger.new)
    {
        for(integer i=0;i<4;i++){
            contactlist.add(new Contact(Accountid=a.id,lastname='coorg'+i,phone='949400194'+i));
        }
    }
    insert contactlist; 
}