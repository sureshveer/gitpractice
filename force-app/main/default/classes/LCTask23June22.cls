public class LCTask23June22 {
    
    public static void createmap(List<Account> acclist){
        map<string,List<contact>> m=new map<string,List<contact>>();
        for(Account a:acclist){
            m.put(a.name, a.contacts);
        }
        
        system.debug('map is'+m);
        set<string> s=m.keySet();
        for(string s1:s){
            system.debug('key is'+s1 +' '+'value is'+m.get(s1));
        }
    }

}