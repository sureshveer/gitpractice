public class apexlcjuly29 {
public static Boolean selected=false;
    public static void task20(map<id,case> newmap,map<id,case> oldmap){
        set<id> idlist= new Set<Id>();
        for(id cid:newmap.keyset()){
           idlist.add(newmap.get(cid).parentid); 
        }
        Map<id,case> casemap=new Map<id,case>([select id,casenumber,status,openchildcases__c,TotalChildCases__c,
                                                workingchildcases__c,closedchildcases__c from case where id in :idlist or id in:newmap.keyset()]);
        system.debug('casemap is'+casemap);
        Map<id,case> casemap1=new Map<id,case>([select id,casenumber,status,parentid from case where parentid in :casemap.keyset()]);
         system.debug('casemap1 is'+casemap1);
        
         for(Id cid:casemap.keyset()){
        casemap.get(cid).openchildcases__c=0;
              casemap.get(cid).TotalChildCases__c=0;
              casemap.get(cid).workingchildcases__c=0;
              casemap.get(cid).closedchildcases__c=0;
         }
        List<case> c= new List<case>();
        system.debug('casemap2 is'+casemap);
        for(Id cid:casemap1.keyset()){
           system.debug('cid'+cid);
            casemap.get(casemap1.get(cid).parentid).TotalChildCases__c=casemap1.size();
            
            if( casemap1.get(cid).Status=='new'){
                casemap.get(casemap1.get(cid).parentid).openchildcases__c+=1;
            }
            else if(casemap1.get(cid).Status=='working'){
                casemap.get(casemap1.get(cid).parentid).workingchildcases__c+=1;
            }
            else if(casemap1.get(cid).Status=='closed'){
                casemap.get(casemap1.get(cid).parentid).closedchildcases__c+=1;
            }
             if( casemap.get(casemap1.get(cid).parentid).closedchildcases__c==casemap1.size()){
                system.debug('check');
                casemap.get(casemap1.get(cid).parentid).status='closed';
            }
            /*
            if(newmap.get(cid)!=null){
            if( newmap.get(casemap1.get(cid).parentid).status=='closed' && casemap.get(casemap1.get(cid).parentid).closedchildcases__c!=casemap1.size()){
               system.debug('check12');
                system.debug('case is'+casemap.get(casemap1.get(cid).parentid));
                system.debug('closedchildcases are'+casemap.get(casemap1.get(cid).parentid).closedchildcases__c);
                newmap.get(casemap1.get(cid).parentid).adderror('cannot be closed without closing all child cases');
            }
            }*/
                c.add(casemap.get(casemap1.get(cid).parentid));
            
        }
       	
        update casemap.values();
         system.debug('casemap2 is'+casemap);
        
    }
}