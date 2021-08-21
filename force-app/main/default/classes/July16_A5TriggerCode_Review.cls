public class July16_A5TriggerCode_Review {
    
    //live coding trigger tasks
    //task12 july16
    //After insert,After Update,After Delete
    public static void July16_Approach1(list<case> caslist,map<id,case> newmap,map<id,case> oldmap){
        
        set<id> caseid= new set<id>();
        for(case cs:caslist){
            caseid.add(cs.accountid);
        }
        
        map<id,account> mapacc = new map<id,account>([select name,LowPrioritycases__c,Highprioritycases__c,MediumPrioritycases__c from account where id in:caseid]); 
        for(case ca:caslist){
            
            account acc = mapacc.get(ca.accountid);
            
            if(ca.Priority=='high' ||(oldmap.get(ca.id).priority=='high' && newmap==null))
            {
                if(acc.Highprioritycases__c==null && newmap!=null)
                {
                    acc.highprioritycases__c=1;
                    if(oldmap!=null)
                    {
                        if(oldmap.get(ca.id).priority=='medium')
                        {
                            acc.mediumprioritycases__c--;
                        }
                        else if(oldmap.get(ca.id).priority=='low')
                        {
                            acc.lowprioritycases__c--; 
                        }
                    }
                }
                else if(newmap==null){
                    acc.highprioritycases__c-=1;
                    if(acc.highprioritycases__c==null){
                        acc.highprioritycases__c=0;
                        acc.highprioritycases__c--;
                    }
                }
                else
                {
                    acc.highprioritycases__c+=1;
                    
                    
                    if(oldmap!=null)
                    {
                        if(oldmap.get(ca.id).priority=='medium')
                        {
                            acc.mediumprioritycases__c--;
                        }
                        else if(oldmap.get(ca.id).priority=='low')
                        {
                            acc.lowprioritycases__c--; 
                        }
                    }
                }
            }
            else if(ca.Priority=='medium'  ||(oldmap.get(ca.id).priority=='medium' && newmap==null))
            {
                if(acc.mediumprioritycases__c==null && newmap!=null)
                {
                    acc.mediumprioritycases__c=1;
                    if(oldmap!=null)
                    {
                        if(oldmap.get(ca.id).priority=='high')
                        {
                            acc.highprioritycases__c--;
                        }
                        else if(oldmap.get(ca.id).priority=='low')
                        {
                            acc.lowprioritycases__c--; 
                        }
                    }
                    
                }
                else if(newmap==null){
                    acc.mediumprioritycases__c--;
                    if(acc.mediumprioritycases__c==null){
                        acc.mediumprioritycases__c=0;
                        acc.mediumprioritycases__c--;
                    }
                }
                else
                {
                    acc.mediumprioritycases__c+=1;
                    if(oldmap!=null)
                    {
                        if(oldmap.get(ca.id).priority=='high')
                        {
                            acc.highprioritycases__c--;
                        }
                        else if(oldmap.get(ca.id).priority=='low')
                        {
                            acc.lowprioritycases__c--; 
                        }
                    }
                }
            }
            
            
            else if(ca.Priority=='low' ||(oldmap.get(ca.id).priority=='low' && newmap==null))
                
            { 
                if(acc.lowprioritycases__c==null && newmap!=null)
                {
                    acc.lowprioritycases__c=1;
                    if(oldmap!=null)
                    {
                        if(oldmap.get(ca.id).priority=='high')
                        {
                            acc.highprioritycases__c--;
                        }
                        else if(oldmap.get(ca.id).priority=='medium')
                        {
                            acc.mediumprioritycases__c--; 
                        }
                    }
                }
                else if(newmap==null){
                    acc.lowprioritycases__c-=1;
                    if(acc.lowprioritycases__c==null){
                        acc.lowprioritycases__c=0;
                        acc.lowprioritycases__c--;
                    }
                }
                else
                {
                    acc.lowprioritycases__c+=1;
                    if(oldmap!=null){
                        {
                            if(oldmap.get(ca.id).priority=='high')
                            {
                                acc.highprioritycases__c--;
                            }
                            else if(oldmap.get(ca.id).priority=='medium')
                            {
                                acc.mediumprioritycases__c--; 
                            }
                        }
                    }
                }
                mapacc.put(acc.id,acc);
                
                
                
            }  
        }
        update mapacc.values();
        system.debug('map is'+mapacc);
        for(id aid:mapacc.keyset()){
            system.debug(mapacc.get(aid).mediumprioritycases__c);
        }
        
    }
    
    //live coding trigger tasks
    //task12 july16
    //After insert,After Update,After Delete
    public static void July16_Approach2(map<id,case> newcasemap){
        
        set<id> caseidlist= new set<id>();
        for(id cid:newcasemap.keySet()) {
            caseidlist.add(newcasemap.get(cid).accountid);
        }  
        map<id,Account> accmap=new map<id,Account>([select id,highprioritycases__c,mediumprioritycases__c,lowprioritycases__c
                                                    from Account where id in :caseidlist]);
        map<id,case> m= new map<id,case>([select id,priority,accountid from case where accountid in :caseidlist 
                                          and (priority='high' or priority='low' or priority='medium')]);
        system.debug('m size is'+m.size());
        for(id aid : accmap.keyset()){
            accmap.get(aid).highprioritycases__c=0;
            accmap.get(aid).mediumprioritycases__c=0;
            accmap.get(aid).lowprioritycases__c=0;
        }
        
        for(id cid : m.keyset()){
            
            if(m.get(cid).priority=='high'){
                accmap.get(m.get(cid).accountid).highprioritycases__c++;
            }
            else if(m.get(cid).priority=='medium'){
                accmap.get(m.get(cid).accountid).mediumprioritycases__c++;
            }
            else if(m.get(cid).priority=='low'){
                accmap.get(m.get(cid).accountid).lowprioritycases__c++;  
            }
        }
        
        update accmap.values();
        
    }
    
     //live coding trigger tasks
    //task12 july16
    //After insert,After Update,After Delete
    public static void July16_Approach3(map<id,case> newcasemap){
    
        set<id> caseidlist= new set<id>();
        for(id cid:newcasemap.keySet()) {
            caseidlist.add(newcasemap.get(cid).accountid);
        }  
    List<case> caselist=[select id,priority,account.highprioritycases__c,account.mediumprioritycases__c,account.lowprioritycases__c
                         from case where accountid in :caseidlist];

        for(case c:caselist){
           
            c.account.highprioritycases__c=0;
            c.account.mediumprioritycases__c=0;
            c.account.lowprioritycases__c=0;
        }  
        List<Account> acc=new List<Account>();
        for(case c:caselist){
            if(c.Priority=='high'){
                 c.account.highprioritycases__c++;
            }
             else if(c.Priority=='medium'){
                 c.account.mediumprioritycases__c++;
            }
            else  if(c.Priority=='low'){
                 c.account.lowprioritycases__c++;
            }
            
            if(!acc.contains(c.account)){
                acc.add(c.account);
            }
            
        }
      update acc;
    }
     //live coding trigger tasks
   //task12 july16
   //After update and After Update
    public static void July16_Approach4(map<id,Case> casemapNew){
    
     
        Set<Id> acctsIdSet = new Set<Id>();
        for(Id cId:casemapNew.keySet()){
            acctsIdSet.add(casemapNew.get(cId).AccountId);
        }
        Map<Id,Account> acctsToUpdate = new Map<Id,Account>([SELECT Name,LowPrioritycases__c,Highprioritycases__c,MediumPrioritycases__c FROM Account WHERE Id IN :acctsIdSet]);
        AggregateResult[] agList = [SELECT COUNT(Id),AccountId,Priority FROM Case WHERE AccountId IN :acctsToUpdate.keySet() GROUP BY AccountId,Priority];
        Map<Id,Map<String,Integer>> temp = new Map<Id,Map<String,Integer>>();
        for(AggregateResult ar:agList){
            if(!temp.containsKey((String)ar.get('AccountId'))){
                temp.put((String)ar.get('AccountId'),new Map<String,Integer>{'High'=>0,'Medium'=>0,'Low'=>0});
            }
            temp.get((String)ar.get('AccountId')).put((String)ar.get('Priority'),(Integer)ar.get('expr0'));
        }
        for(Id aId:acctsToUpdate.keySet()){
            acctsToUpdate.get(aId).LowPrioritycases__c=temp.get(aId).get('Low');
            acctsToUpdate.get(aId).MediumPrioritycases__c=temp.get(aId).get('Medium');
            acctsToUpdate.get(aId).Highprioritycases__c=temp.get(aId).get('High');
        }
        update acctsToUpdate.values();    
    }
    
    
    
    
}