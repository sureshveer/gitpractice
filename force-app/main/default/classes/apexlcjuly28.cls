public class apexlcjuly28 {

    public static List<Asset>  task19(List<Asset> assetlist){
        
        for(Asset a:assetlist){
            Date d=a.PurchaseDate+2;
            if(((Date.today()).daysbetween(a.PurchaseDate))>2){
                a.status='obsolete';
            }
        }
        update assetlist;
        system.debug('asset list is'+assetlist);
        return assetlist;
    }
    
    public static void task17(map<id,asset> assetlist,Map<id,Asset> oldmap){
        set<id> idlist= new set<Id>();
        for(id aid:assetlist.keyset()){
            idlist.add(assetlist.get(aid).product2id);
        }
     map<id,product2> prodlist=new map<id,product2>([select id,StockAvailable__c,ItemsSold__c from product2 where Id in:idlist]);
        for(id i:assetlist.keyset()){
            if(assetlist.get(i).status=='purchased' && oldmap==null){
                if(prodlist.get(assetlist.get(i).product2id).StockAvailable__c==null){
                    prodlist.get(assetlist.get(i).product2id).StockAvailable__c=0;
                     prodlist.get(assetlist.get(i).product2id).StockAvailable__c-=assetlist.get(i).quantity;
                }
                else{
                    prodlist.get(assetlist.get(i).product2id).StockAvailable__c-=assetlist.get(i).quantity;
                }
                if(prodlist.get(assetlist.get(i).product2id).ItemsSold__c==null){
                    prodlist.get(assetlist.get(i).product2id).ItemsSold__c=0;
                     prodlist.get(assetlist.get(i).product2id).ItemsSold__c+=assetlist.get(i).quantity;
                }
                else{
                    prodlist.get(assetlist.get(i).product2id).ItemsSold__c+=assetlist.get(i).quantity;
                }
            }
        else if(assetlist.get(i).status=='paymentpending' && oldmap==null){
               
                if(prodlist.get(assetlist.get(i).product2id).ItemsSold__c==null){
                    prodlist.get(assetlist.get(i).product2id).ItemsSold__c=0;
                     prodlist.get(assetlist.get(i).product2id).ItemsSold__c+=assetlist.get(i).quantity;
                }
                else{
                    prodlist.get(assetlist.get(i).product2id).ItemsSold__c+=assetlist.get(i).quantity;
                } 
        }
            //update
        if(oldmap.get(i).status=='paymentpending' && assetlist.get(i).status=='purchased' && oldmap!=null){
                 if(prodlist.get(assetlist.get(i).product2id).StockAvailable__c==null){
                    prodlist.get(assetlist.get(i).product2id).StockAvailable__c=0;
                     prodlist.get(assetlist.get(i).product2id).StockAvailable__c-=assetlist.get(i).quantity;
                }
                else{
                    prodlist.get(assetlist.get(i).product2id).StockAvailable__c-=assetlist.get(i).quantity;
                }
                 
                if(prodlist.get(assetlist.get(i).product2id).ItemsSold__c==null){
                    prodlist.get(assetlist.get(i).product2id).ItemsSold__c=0;
                     prodlist.get(assetlist.get(i).product2id).ItemsSold__c+=assetlist.get(i).quantity;
                }
                else{
                    prodlist.get(assetlist.get(i).product2id).ItemsSold__c+=assetlist.get(i).quantity;
                }
       }
           else if(oldmap.get(i).status=='purchased' && assetlist.get(i).status=='returned' && oldmap!=null)
           {
                 if(prodlist.get(assetlist.get(i).product2id).StockAvailable__c==null){
                    prodlist.get(assetlist.get(i).product2id).StockAvailable__c=0;
                     prodlist.get(assetlist.get(i).product2id).StockAvailable__c+=assetlist.get(i).quantity;
                }
                else{
                    prodlist.get(assetlist.get(i).product2id).StockAvailable__c+=assetlist.get(i).quantity;
                }
             if(prodlist.get(assetlist.get(i).product2id).ItemsSold__c==null){
                    prodlist.get(assetlist.get(i).product2id).ItemsSold__c=0;
                     prodlist.get(assetlist.get(i).product2id).ItemsSold__c-=assetlist.get(i).quantity;
                }
                else{
                    prodlist.get(assetlist.get(i).product2id).ItemsSold__c-=assetlist.get(i).quantity;
                }
        }   
        }
    update prodlist.values();
    }
}