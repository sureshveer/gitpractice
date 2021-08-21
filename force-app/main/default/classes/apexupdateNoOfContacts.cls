public class apexupdateNoOfContacts {

    public static void task22(List<account> acclist){
        set<id> accidlist=new set<Id>();
        for(account a:acclist){
            accidlist.add(a.id);
        }
        List<contact> conlist=[select id,name from contact where accountid in :accidlist];
        system.debug('conlist is'+conlist);
        system.debug('conlist size is'+conlist.size());
        for(Account a:acclist){
           
            if(a.NumberOfContacts__c != conlist.size()){
                a.adderror('Number Of Contacts for this account are '+conlist.size()+'should not enter a value greater or less than that value');
            }
        }
    }
}