public class livecoding_June23 {
    
    public static void task27_1(List<opportunity> opplist){
         for(opportunity opp:opplist){
            if(opp.accountid == null){
                 opp.adderror('opportunity cannot be created without account name');
            }
        }
    }
   
    
    public static void task27(List<opportunity> opplist){
        
        set<id> oppidlist= new set<id>();
        for(opportunity o:opplist){
            oppidlist.add(o.accountid);
        }
       
      
        
        map<Id,account> m= new map<Id,Account>([select id,name,Total_Opportunities__c,Total_Opportunities_amount__c
                               from account where id in :oppidlist]);
       List<opportunity> opplist1= [select id,name,amount,accountid from opportunity where accountid in :oppidlist];
     
        system.debug('opplist is'+opplist);
        system.debug('opplist1'+opplist1);
        
        for(opportunity opp:opplist1){
             if(m.get(opp.accountid).Total_Opportunities__c==null){
                m.get(opp.accountid).Total_Opportunities__c=0;
            }
            if(m.get(opp.accountid).Total_Opportunities__c!=null){
                m.get(opp.accountid).Total_Opportunities__c=opplist1.size();
            }
        }
        decimal totalamt=0;
        for(opportunity o:opplist1){
            if(o.Amount!=null){
               totalamt =totalamt+o.amount;
            }
        }
        
        system.debug('totalamt is'+totalamt);
        system.debug('opplist1 size is'+opplist1.size());
      
        for(opportunity opp:opplist){
             if(m.get(opp.accountid).Total_Opportunities_amount__c==null){
              m.get(opp.accountid).Total_Opportunities_amount__c=0;
        }
          if(m.get(opp.accountid).Total_Opportunities_amount__c!=null){
              m.get(opp.accountid).Total_Opportunities_amount__c=totalamt;
        }
      
        }
        // Database.SaveResult[] srList = Database.update(m.values(),false);
          update m.values();  
    }
    
    //live coding task 28 requirement
    public static void task28(List<lead> leadlist){
        decimal scorename=0;
        decimal scoreannualrevenue=0;
        decimal scorephone=0;
        
        for(lead l:leadlist){
            if(l.firstname!=null){
                scorename=10;
            }
            if(l.AnnualRevenue!=null){
               scoreannualrevenue=10;
            }
            if(l.phone!=null){
                scorephone=10;
            }
            if(l.Total_Lead_Score__c==null){
                l.Total_Lead_Score__c=scorename+scoreannualrevenue+scorephone;
            }
            
        }
        
    }
}