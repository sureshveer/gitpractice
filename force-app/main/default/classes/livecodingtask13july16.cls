public class livecodingtask13july16 {
    
    
    public static void task13(List<Account> acclist){
        
        set<id> idlist= new set<id>();
        for(account a:acclist){
            idlist.add(a.id);
        }
        
        List<case> caselist=[select id,priority,account.name from case where accountid in:idlist];
        
         map<String,List<Case>> result= new map<String,List<Case>>();
        
    
        for(case c:caselist){
         list<case> lstas2 = new list<case> ();
            if(!result.containsKey(c.account.name+c.Priority))
            {
                lstas2.add(c);
                result.put((c.account.name+c.Priority),lstas2);
            }
            else 
            {
                lstas2 = result.get(c.account.name+c.Priority);
                lstas2.add(c);
                result.put((c.account.name+c.Priority),lstas2);
            }
            
        }
        
        system.debug('map is'+result);
        
        for(string s:result.keyset()){
            system.debug(s+'--->'+result.get(s));
        }
        
        
    }

}