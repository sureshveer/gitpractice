trigger trigger3 on Account (after update) {

   for(Account a:Trigger.new)
    {
        if(a.BillingAddress!=null){
            List<contact> contactlist=[select MailingAddress,lastname from contact where contact.account.name=:a.id];
            for(contact c:contactlist){
              //  c.MailingAddress=a.BillingAddress;
                c.lastname='suresh';
            }
              update contactlist;
        }
      
    }
}