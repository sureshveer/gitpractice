public class LiveCoding_June22_task25 {

    
    public static void createmap(List<Id> accid){
        
        List<account> acclist=[select id,name,(select id,status from cases) from account where id in :accid];
        map<string,Integer> m= new  map<string,Integer>();
      
        for(Account a:acclist){
                 for(case c:a.cases){
                     if(m.containskey(a.name+c.status)){
                          m.put(a.name+c.status,m.get(a.name+c.status)+1);
                     }
                     else{
                          m.put(a.name+c.status,1);
                     }
           
            }
        }
        
        
        system.debug('map is'+m);
        set<string> s=m.keySet();
        for(string s1:s){
            system.debug('key is'+s1+' '+'value is'+m.get(s1));
        }
    }
}