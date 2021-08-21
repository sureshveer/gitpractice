public class Dynamicsoqlquery {

    
    public static void GenerateDynamicSOQL(String accname,String accindustry,String accrating){
        
        String BaseQuery='Select count(id),name,industry,rating from Account';
        
        map<String,String> queryParams = new Map<String, String>();
        
        if(accname!=null || !String.isBlank(accname)){
            queryParams.put('name;Equals', 'accname');
        }
         if(accindustry!=null || !String.isBlank(accindustry)){
            queryParams.put('industry;Equals', 'accindustry');
        }
         if(accrating!=null || !String.isBlank(accrating)){
            queryParams.put('rating;Equals', 'accrating');
        }

        
        String groupClause = 'GROUP BY industry,name,rating';
        BaseQuery = buildDynamicQuery(BaseQuery, queryParams)+ ' '+groupClause;
      
        system.debug('actual Query is'+BaseQuery);
        List<AggregateResult> Accountagglist  = Database.query(BaseQuery);
        system.debug('Account list is'+Accountagglist);
        
    }
    
  public static string buildDynamicQuery(String baseQuery, map<String,String> queryParams){
        system.debug('paramas'+queryParams);
        if(queryParams != null && !queryParams.isEmpty()){
              String whereClause = ' where ';
                for(String key : queryParams.keySet()){
                    String value = queryParams.get(key);
                    system.debug('key '+key +' '+key.contains(';'));
                    if(key.contains(';')){
                       String keyVal = key.split(';')[0];
                       String operator = key.split(';')[1];
                       if(operator == 'EQUALS'){
                           whereClause+= keyVal+' = :'+value +' OR '; 
                       }
                    }else{
                        
                        whereClause+= key+' in :'+value +' OR ';
                    }
                    
                }
               whereClause = whereClause.substring(0, whereClause.lastIndexOf(' OR '));
               return baseQuery+' '+whereClause;
        }
        
        return baseQuery;
       
    }
}