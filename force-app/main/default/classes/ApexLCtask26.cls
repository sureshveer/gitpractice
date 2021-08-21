public class ApexLCtask26 {

    public static void task26(List<opportunity> opplist){
        set<Id> oppidlist= new Set<Id>();
        for(opportunity opp:opplist){
            oppidlist.add(opp.accountid);
        }
        
       
        map<Id,Account> m= new  map<Id,Account>
            ([select id,name,NumberofClosedWonOpportunities__c,NumberofClosedLostOpportunities__c,
                               (select id,name,StageName from opportunities) from account where id in :oppidlist]);                                   
        
        List<opportunity> opplist1=[select id, name,stagename,accountid from opportunity where accountid in :oppidlist];
        
        integer countClosedwon=0;
        for(opportunity o:opplist1){
            if(o.StageName=='closed won'){
                countClosedwon=countClosedwon+1;
            }
        }
        integer countClosedLost=0;
        for(opportunity o:opplist1){
            if(o.StageName=='closed lost'){
                countClosedLost=countClosedLost+1;
            }
        }
        for(opportunity opp:opplist1){
            if(opp.StageName=='closed won'){
            if(m.get(opp.AccountId).NumberofClosedWonOpportunities__c==null || m.get(opp.AccountId).NumberofClosedWonOpportunities__c!=null ){
                m.get(opp.AccountId).NumberofClosedWonOpportunities__c=countClosedwon;
            }
               
            }
            else if(opp.StageName=='closed lost'){
                 if(m.get(opp.AccountId).NumberofClosedLostOpportunities__c==null || m.get(opp.AccountId).NumberofClosedLostOpportunities__c!=null ){
                m.get(opp.AccountId).NumberofClosedLostOpportunities__c=countClosedLost;
            }
            }
        }
        
        update m.values();
        
        
    }
}