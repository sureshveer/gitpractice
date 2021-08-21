public class LiveCodingTask6July13 {

    public static void task6(Date startdate,Date enddate){
       List<Asset> assetlist=[select id,Quantity,product2.name from asset where createddate >= :startdate and createddate <= :enddate];
        system.debug('asset list is'+assetlist);
        map<string,decimal> m=new map<string,decimal>();
        for(Asset a:assetlist){
            if(m.containsKey(a.product2.name)){
                m.put(a.product2.name,m.get(a.product2.name)+a.Quantity);
            }
            else{
                m.put(a.product2.name, a.Quantity);
            }
        }
        
        system.debug('after update map is'+m);
        
    }
}