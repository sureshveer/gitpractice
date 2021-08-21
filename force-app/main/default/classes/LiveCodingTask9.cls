public class LiveCodingTask9 {

    public static void task9(Date Startdate,Date enddate){
        List<Asset> assetlist=[select id,name,createddate,status from asset where createddate >= :Startdate and createddate <= :enddate];
        system.debug('asset list is'+assetlist);
        system.debug('size is'+assetlist.size());
        
        map<String,List<Asset>> m= new map<String,List<Asset>>();
        List<asset> a1=new List<Asset>();
         List<asset> a2=new List<Asset>();
        for(Asset a:assetlist){
            if(!m.containsKey(a.status)){
            m.put(a.status,new List<Asset>());
             
            }
           
             m.get(a.Status).add(a);
            
            
           
             
            
        }
        system.debug('list size is'+a1);
        system.debug('map is'+m);
       system.debug('map size is'+m.size());
        
        for(String dt:m.keyset()){
            system.debug(dt+'--->'+m.get(dt));
            system.debug('size is'+m.get(dt).size());
        }
        
    }
}