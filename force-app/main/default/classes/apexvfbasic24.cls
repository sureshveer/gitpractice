public class apexvfbasic24 {

    public List<account> acclist{get;set;}
    public apexvfbasic24(){
        List<Account> acctlist=[select id from account];
        set<id> accidlist= new set<id>();
        for(Account a :acctlist){
            accidlist.add(a.id);
        }
        
        acclist=[select id,name from account where isdeleted=true or id in:accidlist  all rows];
        // acclist=[select id,name from account ];
        system.debug('acclist size is'+acclist.size());
    }
}