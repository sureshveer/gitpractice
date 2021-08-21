public class LiveCodingTask11July15{

    public static void task11(List<contact> conlist){
        
          map<String,List<Contact>> m= new map<String,List<Contact>>();
       
        for(Contact c:conlist){
            if(c.Type__c!=null){
            if(!m.containsKey(c.Type__c)){
            m.put(c.Type__c,new List<contact>());
             
            }
           
             m.get(c.Type__c).add(c);
            }
            
        }
        
        system.debug('map is'+m);
        
       
        
       // for(String dt:m.keyset()){
         //   system.debug(dt+'--->'+m.get(dt));
          //  system.debug('size is'+m.get(dt).size());
       // }
        
        
    }
}