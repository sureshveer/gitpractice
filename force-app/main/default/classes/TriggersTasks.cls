public class TriggersTasks {

    
    public static Boolean setvalue=false;
    
    //Trigger Task1
    //BeforeInsert
    public static void BeforeInserttriggertask1(List<Account> accts){
        for(Account a:accts) {
        if(a.Description ==null){
            a.Description='This is'+' '+a.name;
              //  a.adderror('Description field cannot be null');
                system.debug('default value');
            }
        }
    }
    
    //triggertask1
    //Beforeupdate
     public static void BeforeUpdatetriggertask1(List<Account> accts){
       for(Account a:accts) {
        if(a.Description.length()<=10){
                a.Description='This is'+' '+a.name;
                system.debug('Default value');
                
            }
          }
    }
    
    //TriggerTask2
     public static void AfterInserttriggertask2(List<Account> accts){
      List<Contact> contactlist = new List<Contact>();
         for(Account a:accts)
          {
             for(integer i=0;i<5;i++){
               contactlist.add(new Contact(Accountid=accts[i].id,lastname='coorg'+i,phone='949400194'+i));
              }
          }
          insert contactlist; 
     
     }
    
    //TriggerTask3
     public static void AfterUpdatetriggertask3(List<Account> accts){
        Set<Id> accidlist=new Set<Id>();
         for(Account a:accts){
             accidlist.add(a.Id);
          
         }
     List<Contact> contactlist= [select Mailingcity from contact where contact.accountid in :accidlist];
         for(Account a:accts){
                if(a.BillingCity!=' ' || a.BillingCity!=null){
                    for(Contact c:contactlist){
                         c.MailingCity=a.BillingCity;
                       // contactlist.add(c);
                }
         }
     }
          update contactlist;
     }
    //TriggerTask4
     public static void BeforeInserttriggertask4(List<Account> accts){
          List<Account> accountlist= [select name,phone from account];
        
         for(Account a:accts){      
           for(Account act:accountlist){
            if(act.name==a.Name){
                a.adderror('record already exist with this name');
                system.debug('record already exist');
            }
        }
    }
     
     
     }
     //Triggertask5
     //Beforeinsert
     public static void BeforeInserttriggertask5(List<Lead> leads){
        for(Lead a:leads)
        { 
            if(a.salutation==null){
                a.salutation='Mr';
            }
        } 
     
     }
    
    //Triggertask5
     //Beforeupdate
     public static void BeforeUpdatetriggertask5(List<Lead> leads){
       for(Lead a:leads)
       {
            if(a.salutation==null ){
                a.salutation='Mr';
            }
       }
     }
    
    //Triggertask6
     public static void BeforeDeletetriggertask6(List<Contact> con){
     
     for(Contact c:con){
 //       List<contact> deletecontact=[select name,phone,contact.Account.Name,title from contact];
   //     for(Contact c1:deletecontact){
             if(c.Accountid!=null){
             c.adderror('cannot delete  contact');
            }
        }
     
     }
    
    //TriggerTask7
     public static void BeforeDeletetriggertask7(List<Account> accts){
       List<String> accnamelist=new List<String>();
         for(Account a:accts){
             accnamelist.add(a.Name);
            
         }
    integer count=[select count() from contact where contact.account.name in :accnamelist];
     for(Account a:accts){
        if(count>=3){
            a.adderror('cannot delete account');
        }
       }
     }
     
    
    //Triggertask8
    //BeforeINsert
    public static void BeforeInserttriggertask8(List<Account> accts){
     for(Account a:accts){
      
        if(!(a.Min_No_Of_Contacts__c >=1)){
            a.adderror('Min_No_Of_Contacts__c field should be greateer than or equal to 1');
        }
        
     }
    }
    
    //Triggertask8
    //after insert
    public static void AfterInserttriggertask8(List<Account> accts){
    List<Contact> contactlist = new List<Contact>();
    for(Account a:accts){
        for(integer i=0;i<a.Min_No_Of_Contacts__c;i++){
            contactlist.add(new Contact(Accountid=a.id,lastname='coorg'+i,phone='949400194'+i));
        }
    
    insert contactlist; 
    
    }
    
    
    } 
    
     //Triggertask9
     public static void AfterInserttriggertask9(List<Contact> contacts1){
        Set<Id> accidlist=new Set<Id>();
         for(contact con:contacts1){
             accidlist.add(con.AccountId);
            // accidlist(opp.StageName);
         }
      List<Account> act = [select id,No_Of_Contacts__c,(select name from contacts) from account where id in:accidlist];
    
     // List<Account> act= [select No_Of_Contacts__c from Account where name=:c.Account.name];
        for(Account a:act){
            a.No_Of_Contacts__c=a.contacts.size();
        }
        update act;
     
     }
    
    //Triggertask10
     public static void Afterupdatetriggertask10(List<Opportunity> opps){
        Set<Id> accidlist=new Set<Id>();
         for(Opportunity opp:opps){
             accidlist.add(opp.AccountId);
            // accidlist(opp.StageName);
         }
         
        List<Account> acc=[select rating,phone from Account where Account.id in :accidlist];
           system.debug('acc is'+acc);
         for(Account a:acc){
             for(Opportunity opp:opps){
               if(opp.StageName=='Closed Won'){
               //    if(opp.AccountId==a.Id){
                   a.rating='Hot';
                 // a.phone='9494001944';
                //   system.debug('account is'+a);
                 //  system.debug('opportunity is'+opp);
               }
               
           }
           update acc;
       }
     }
    //Triggertask13
    public static void Afterupdatetriggertask13(List<Case> caseslist){
    Set<Id> caseidlist=new Set<Id>();
         for(Case c:caseslist){
             caseidlist.add(c.AccountId);
         }
        
        List<Account> acct=[select id,name,(select CaseNumber,Status from cases) from account where id in :caseidlist];
        
        for(Account a:acct){
            for(Case c:caseslist){
                if(c.status=='closed'){
                    a.lastclosedcasenumber__c =  c.CaseNumber;
                }
            }
            update acct;
            
        }
        
    
    }
    
    //Triggertask14
    public static void Afterinserttriggertask14(List<Contact> con){
        system.debug('con size is'+con.size());
    Set<Id> conidlist=new Set<Id>();
         for(Contact c:con){
             conidlist.add(c.AccountId);
         }
        
        List<Account> acct=[select id, name,No_Of_Primary_Contacts__c,No_Of_Secondary_Contacts__c,No_Of_Teritary_Contacts__c,(select name,Level__c  from contacts)
                            from account where id in :conidlist];
        
        for(account a:acct){
         
                system.debug('acct contacts size is'+a.contacts.size());
            
        }
        for(Account a:acct){
             a.No_Of_Primary_Contacts__c=0;
                 a.No_Of_Secondary_Contacts__c=0;
                 a.No_Of_Teritary_Contacts__c=0;
         
            for(Contact c:a.contacts){ 
                if(c.Level__c=='primary'){
                    a.No_Of_Primary_Contacts__c=a.No_Of_Primary_Contacts__c+1;
                }
               else if(c.Level__c=='secondary'){
                    a.No_Of_Secondary_Contacts__c=a.No_Of_Secondary_Contacts__c+1;
                }
              else  if(c.Level__c=='Tertiary'){
                    a.No_Of_Teritary_Contacts__c=a.No_Of_Teritary_Contacts__c+1;
                }
                else{
                        system.debug('invalid contact type is here');
                }
                    
            }
            update acct;
        }
    
    }
    
     //Triggertask15
    public static void Afterupdatetriggertask15(List<Opportunity> opps){
        system.debug('checking');
     Set<Id> oppidlist=new Set<Id>();
         for(Opportunity opp:opps){
             oppidlist.add(opp.AccountId);
            // accidlist(opp.StageName);
         }
        
        List<opportunity> opp=[select accountid,ownerid,StageName from opportunity  where Accountid in :oppidlist];
        system.debug('opp is'+opp);
        List<task> tasklist= new List<task>();
        for(Opportunity o:opp){
            if(o.stagename=='closed won'){
               Task t= new Task(id=o.id,subject='Email',OwnerId=o.ownerid,status='Not Started'); 
                tasklist.add(t);
            
            }
            }
        insert tasklist;
        system.debug('tasklist is'+tasklist);
        
    
        
    
    }
    //Triggertask16
    public static void BeforeInserttriggertask16(List<Account> act){
       system.debug('checking');
        system.debug('act is'+act);
        
        set<id> idlist=new set<id>();
        for(account a:act){
            idlist.add(a.id);
        }
        
        List<account> actlist=[select id,name,industry,ownership from account where id in :idlist];
        system.debug('actlist is'+actlist);
        for(Account a:actlist){
            if(a.Industry=='Banking'){
                a.Ownership='private';
            }
          
        }
          update actlist;
    
    }
     //Triggertask17
    public static void BeforeInserttriggertask17(List<Contact> con){
        system.debug('checking');
        for(Contact c:con){
            if(c.AccountId == null){
                c.adderror('Account name should not be null');
            }
            
        }
        
    }
    
    
     //Triggertask18
    public static void AfterInserttriggertask18(List<Contact> con){
      system.debug('checking '+con);
       
        Set<Id> conidlist=new Set<Id>();
         for(Contact c:con){
             conidlist.add(c.AccountId);
         }
        List<Account> act=[select id,name,phone,(select accountid,OtherPhone from contacts) from Account where id in :conidlist];
        List<contact> conlist=new List<contact>();
        for(Account a:act){
            for(Contact c:a.contacts){
                if(a.id == c.AccountId){
                c.OtherPhone=a.Phone;
                    conlist.add(c);
                } 
            }
             update conlist;
        }
       
        
    
    
    }
    
    //Triggertask19
    public static void AfterDeletetriggertask19(List<Contact> con){
     system.debug('con is'+con);
         Set<Id> conidlist=new Set<Id>();
         for(Contact c:con){
             conidlist.add(c.AccountId);
         }
        
        List<Account> act=[select id,name,(select name from contacts) from Account where id in :conidlist];
        system.debug('act is'+act);
        List<account> acclist=new List<account>();
        for(Account a:act){
            
           if(a.contacts.size()==0){
               acclist.add(a);
               
            }
            
    }
        delete acclist;
        
    }
    
   //live coding trigger tasks
   //task4 july 10
   //After update
   public static Boolean selected=false;
    public static void Afterupdatelivecodingtask4july10(map<id,contact> newcon,map<id,contact> oldcon){
        
       Map<String, Schema.SObjectField> M = Schema.SObjectType.contact.fields.getMap();
        system.debug('schema is'+m);
     
        List<contact> conlist=[select id,name,lastmodifieddate,Department,Birthdate,Email,MobilePhone,HistoryData__c 
                                                    from contact where id in :newcon.keyset()];
        system.debug('before conlist is'+conlist);
        
        string hstry=' ';
        for(id conid:newcon.keyset()){
            system.debug('history is'+ newcon.get(conid).HistoryData__c);
         //   hstry=' ';
            hstry+= newcon.get(conid).lastmodifieddate;
            for(string s:m.keyset()){
                if(newcon.get(conid).get(s)!=oldcon.get(conid).get(s) && s!='HistoryData__c'  && s!='lastmodifieddate' && s!='systemmodstamp'){
                   hstry += ','+s+':'+oldcon.get(conid).get(s);
                   
                }
            }
        }
         system.debug('history is'+hstry);
        for(contact c:conlist){
            
             c.HistoryData__c=' ';
           c.HistoryData__c=hstry;
                }
        
        
        update conlist;
        system.debug('after conlist is'+conlist);
      
    }
    
    //live coding trigger tasks
   //task4 july 10
   //Before update
   
    public static void Beforeupdatelivecodingctask4july10(map<id,contact> newcon,map<id,contact> oldcon){
    
     Map<String, Schema.SObjectField> M = Schema.SObjectType.contact.fields.getMap();
        system.debug('schema is'+m);
      
     
        
        for(id conid:newcon.keyset()){
            newcon.get(conid).HistoryData__c=' ';
            newcon.get(conid).HistoryData__c+= newcon.get(conid).lastmodifieddate;
            for(string s:m.keyset()){
                if(newcon.get(conid).get(s)!=oldcon.get(conid).get(s) && s!='HistoryData__c' ){
                    newcon.get(conid).HistoryData__c+= ','+s+':'+oldcon.get(conid).get(s);
                    
                }
            }
        }
      
    }
    	
     //live coding trigger tasks
   //task7 july13
   //After insert 
    public static Boolean quantityselected=false;
    public static void AfterInsertLiveCodingTask7july13(List<Asset> assetlist){
    
      set<Id> idlist=new set<Id>();
        for(Asset a:assetlist){
            idlist.add(a.Product2Id);
        }
        
    //    List<asset> assetlist1=[select id,Quantity,status,product2.TotalQuantityPurchased__c from asset where Product2Id in :idlist];
        List<product2> prodlist=[select id,name,TotalQuantityPurchased__c,(select id,Quantity,status from assets) from product2 where id in:idlist];
        system.debug('prodlist is'+prodlist);
      
        for(Product2 p:prodlist){
             decimal sumquanity=0;
            for(Asset a:p.assets){
                if(a.status=='Purchased'){
                sumquanity=sumquanity+a.quantity;
              
            }
            }
             p.TotalQuantityPurchased__c=sumquanity;
        }
        update prodlist;
        
        system.debug('after update'+prodlist);
    
    }
    
     //live coding trigger tasks
   //task8 july14
   //Before insert 
   
    public static void BeforeInsertLiveCodingTask8(List<Asset> assetlist){
         String errmsg='';
        for(Asset a:assetlist){
            if(a.Product2Id==null){
              //  errmsg='product field is mandatory';
                a.adderror('product field is mandatory');
            }
             if(a.PurchaseDate>Date.today()){
              //  errmsg='Purchase date cannot be future date';
                a.adderror('Purchase date cannot be future date');
            }
            if(a.InstallDate<=a.PurchaseDate){
              //  errmsg='install date must be greater than purchase date';
                               a.adderror('install date must be greater than purchase date');
                           }   
            
            if(a.installdate!=null){
                            if((a.installdate).daysbetween(a.purchasedate)>10){
                a.adderror('description is mandatory');
            }
            }
        
        }        
    
    }
    //live coding trigger tasks
   //task10 july15
   //After insert 
   
    public static void Afterinsertlivecodingctask10july15(map<id,contact> triggerNewMap){
        
        map<id,account> acctsToUpdate=new map<id,account>([select id,Rollup_Amount__c,Rollup_Amount_x__c,Rollup_Amount_y__c,
                                              (select id,name,Amount_x__c,Amount_y__c,Type__c from contacts 
                                               where Type__c='positive' or Type__c='negative') from account
                                              where id in (select accountid from contact where id in :triggerNewMap.keySet())]);
        
        // Map<Id,Account> acctsToUpdate = new Map<Id,Account>([SELECT Name,Rollup_Amount__c,Rollup_Amount_X__c,Rollup_Amount_Y__c FROM Account WHERE Id IN (SELECT AccountId FROM Contact WHERE Id IN :triggerNewMap.keySet())]);
        for(Id cId:triggerNewMap.keySet()){
            if(triggerNewMap.get(cId).Type__c=='Positive'){
                if(triggerNewMap.get(cId).Amount_x__c!=NULL){
                    if(acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount_X__c==NULL){
                        acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount_X__c=0;
                        acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount_X__c+=triggerNewMap.get(cId).Amount_x__c;
                    } else {
                        acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount_X__c+=triggerNewMap.get(cId).Amount_x__c;
                    }
                    
                    if(acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount__c==NULL){
                        acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount__c=0;
                        acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount__c+=triggerNewMap.get(cId).Amount_x__c;
                        if(triggerNewMap.get(cId).Amount_Y__c!=NULL){
                            acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount__c+=triggerNewMap.get(cId).Amount_Y__c;
                        }
                    } else {
                        acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount__c+=triggerNewMap.get(cId).Amount_x__c;
                        if(triggerNewMap.get(cId).Amount_Y__c!=NULL){
                            acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount__c+=triggerNewMap.get(cId).Amount_Y__c;
                        }
                    }
                }
            } else if(triggerNewMap.get(cId).Type__c=='Negitive'){
                if(triggerNewMap.get(cId).Amount_Y__c!=NULL){
                    if(acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount_Y__c==NULL){
                        acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount_Y__c=0;
                        acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount_Y__c+=triggerNewMap.get(cId).Amount_Y__c;
                    } else {
                        acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount_Y__c+=triggerNewMap.get(cId).Amount_Y__c;
                    }
                    
                    if(acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount__c==NULL){
                        acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount__c=0;
                        acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount__c+=triggerNewMap.get(cId).Amount_Y__c;
                        if(triggerNewMap.get(cId).Amount_X__c!=NULL){
                            acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount__c+=triggerNewMap.get(cId).Amount_x__c;
                        }
                    } else {
                        acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount__c+=triggerNewMap.get(cId).Amount_Y__c;
                        if(triggerNewMap.get(cId).Amount_x__c!=NULL){
                            acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount__c+=triggerNewMap.get(cId).Amount_x__c;
                        }
                    }
                }
            } else {
                if(triggerNewMap.get(cId).Amount_X__c!=NULL){
                    if(acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount__c==NULL){
                        acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount__c=0;
                        acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount__c+=triggerNewMap.get(cId).Amount_X__c;
                    } else {
                        acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount__c+=triggerNewMap.get(cId).Amount_X__c;
                    }
                }
                
                if(triggerNewMap.get(cId).Amount_Y__c!=NULL){
                    if(acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount__c==NULL){
                        acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount__c=0;
                        acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount__c+=triggerNewMap.get(cId).Amount_Y__c;
                    } else {
                        acctsToUpdate.get(triggerNewMap.get(cId).AccountId).Rollup_Amount__c+=triggerNewMap.get(cId).Amount_Y__c;
                    }
                }
            }
        }
        update acctsToUpdate.values();
        
        
    }
    
     //live coding trigger tasks
   //task12 july16
   //After insert 
   
    public static void Afterinsertlctask12(map<id,Case> caselist){
    
    map<id,Account> m=new map<id,Account>([select id, name,Highprioritycases__c,MediumPrioritycases__c,LowPrioritycases__c from account 
                           where id in (select accountid from case where id in :caselist.keySet())]);
        
        for(id caseid:caselist.keySet()){
            
            if(caselist.get(caseid).priority=='High'){
                if(m.get(caselist.get(caseid).Accountid).Highprioritycases__c==null){
                    m.get(caselist.get(caseid).Accountid).Highprioritycases__c=0;
                    m.get(caselist.get(caseid).Accountid).Highprioritycases__c++; 
                }
                else{
                    m.get(caselist.get(caseid).Accountid).Highprioritycases__c++;
                }
                
            }
            else if(caselist.get(caseid).priority=='medium'){
                if(m.get(caselist.get(caseid).Accountid).MediumPrioritycases__c==null){
                    m.get(caselist.get(caseid).Accountid).MediumPrioritycases__c=0;
                    m.get(caselist.get(caseid).Accountid).MediumPrioritycases__c++;
                }
                else{
                    m.get(caselist.get(caseid).Accountid).MediumPrioritycases__c++;
                }
                
            }
            else if(caselist.get(caseid).priority=='medium'){
                 if(m.get(caselist.get(caseid).Accountid).LowPrioritycases__c==null){
                    m.get(caselist.get(caseid).Accountid).LowPrioritycases__c=0;
                    m.get(caselist.get(caseid).Accountid).LowPrioritycases__c++;
                }
                else{
                    m.get(caselist.get(caseid).Accountid).LowPrioritycases__c++;
                }
                
                
            }
            else{
                system.debug('no operation');
            }
            
        }
        
        update m.values();
    
    }
    
    
    
    
      //live coding trigger tasks
   //task12 july16
   //After update 
   
    public static void Afterupdatelctask12(map<id,Case> caselistNew,map<id,Case> caselistold ){
    
    map<id,Account> m=new map<id,Account>([select id, name,Highprioritycases__c,MediumPrioritycases__c,LowPrioritycases__c from account 
                           where id in (select accountid from case where id in :caselistNew.keySet())]);
        
        for(id caseid:caselistNew.keySet()){
            
            if(caselistold.get(caseid).priority=='High'){
                if(caselistNew.get(caseid).priority=='Medium'){
                    if( m.get(caselistNew.get(caseid).Accountid).Highprioritycases__c==null){
                        m.get(caselistNew.get(caseid).Accountid).Highprioritycases__c=0;
                        m.get(caselistNew.get(caseid).Accountid).Highprioritycases__c--;
                    }
                    else{
                        m.get(caselistNew.get(caseid).Accountid).Highprioritycases__c--;
                    }
                    
                    if(m.get(caselistNew.get(caseid).Accountid).MediumPrioritycases__c==null){
                        m.get(caselistNew.get(caseid).Accountid).MediumPrioritycases__c=0;
                        m.get(caselistNew.get(caseid).Accountid).MediumPrioritycases__c++;
                    }
                    else{
                        m.get(caselistNew.get(caseid).Accountid).MediumPrioritycases__c++;
                    }
                     
                    
                }
                    
                else if(caselistNew.get(caseid).priority=='Low'){
                    if(m.get(caselistNew.get(caseid).Accountid).Highprioritycases__c==null){
                        m.get(caselistNew.get(caseid).Accountid).Highprioritycases__c=0;
                        m.get(caselistNew.get(caseid).Accountid).Highprioritycases__c--;
                    }
                    else{
                        m.get(caselistNew.get(caseid).Accountid).Highprioritycases__c--;
                    }
                    if(m.get(caselistNew.get(caseid).Accountid).LowPrioritycases__c==null){
                        m.get(caselistNew.get(caseid).Accountid).LowPrioritycases__c=0;
                        m.get(caselistNew.get(caseid).Accountid).LowPrioritycases__c++;
                    }
                    else{
                        m.get(caselistNew.get(caseid).Accountid).LowPrioritycases__c++;
                    }
                    
                     
                    
                }
                  
                
            }
            else if(caselistold.get(caseid).priority=='medium'){
               if(caselistNew.get(caseid).priority=='High'){
                   if(  m.get(caselistNew.get(caseid).Accountid).Highprioritycases__c==null){
                         m.get(caselistNew.get(caseid).Accountid).Highprioritycases__c=0;
                         m.get(caselistNew.get(caseid).Accountid).Highprioritycases__c++;
                   }
                   else{
                         m.get(caselistNew.get(caseid).Accountid).Highprioritycases__c++;
                   }
                   if( m.get(caselistNew.get(caseid).Accountid).MediumPrioritycases__c==null){
                        m.get(caselistNew.get(caseid).Accountid).MediumPrioritycases__c=0;
                        m.get(caselistNew.get(caseid).Accountid).MediumPrioritycases__c--;
                   }
                   else{
                        m.get(caselistNew.get(caseid).Accountid).MediumPrioritycases__c--;
                   }
                    
                    
               }  
                else if(caselistNew.get(caseid).priority=='Low'){
                    if(m.get(caselistNew.get(caseid).Accountid).MediumPrioritycases__c==null){
                        m.get(caselistNew.get(caseid).Accountid).MediumPrioritycases__c=0;
                        m.get(caselistNew.get(caseid).Accountid).MediumPrioritycases__c--;
                    }
                    else{
                        m.get(caselistNew.get(caseid).Accountid).MediumPrioritycases__c--;
                    }
                    if(m.get(caselistNew.get(caseid).Accountid).LowPrioritycases__c==null){
                        m.get(caselistNew.get(caseid).Accountid).LowPrioritycases__c=0;  
                        m.get(caselistNew.get(caseid).Accountid).LowPrioritycases__c++;  
                    }
                    else{
                        m.get(caselistNew.get(caseid).Accountid).LowPrioritycases__c++;  
                    }
                       
                }
                   
                
            }
            else if(caselistold.get(caseid).priority=='Low'){
                 if(caselistNew.get(caseid).priority=='High'){
                     if( m.get(caselistNew.get(caseid).Accountid).Highprioritycases__c==null){
                          m.get(caselistNew.get(caseid).Accountid).Highprioritycases__c=0;
                          m.get(caselistNew.get(caseid).Accountid).Highprioritycases__c++;
                     }
                     else{
                          m.get(caselistNew.get(caseid).Accountid).Highprioritycases__c++;
                     }
                     if(  m.get(caselistNew.get(caseid).Accountid).LowPrioritycases__c==null){
                           m.get(caselistNew.get(caseid).Accountid).LowPrioritycases__c=0;
                           m.get(caselistNew.get(caseid).Accountid).LowPrioritycases__c--;
                     }
                     else{
                           m.get(caselistNew.get(caseid).Accountid).LowPrioritycases__c--;
                     }
                    
                    
                 } 
                    
                else if(caselistNew.get(caseid).priority=='Medium'){
                    if(m.get(caselistNew.get(caseid).Accountid).MediumPrioritycases__c==null){
                        m.get(caselistNew.get(caseid).Accountid).MediumPrioritycases__c=0;
                        m.get(caselistNew.get(caseid).Accountid).MediumPrioritycases__c++;
                    }
                    else{
                        m.get(caselistNew.get(caseid).Accountid).MediumPrioritycases__c++;
                    }
                    if(  m.get(caselistNew.get(caseid).Accountid).LowPrioritycases__c==null){
                          m.get(caselistNew.get(caseid).Accountid).LowPrioritycases__c=0;
                          m.get(caselistNew.get(caseid).Accountid).LowPrioritycases__c--;
                    }
                    else{
                          m.get(caselistNew.get(caseid).Accountid).LowPrioritycases__c--;
                    }
                    
                    
                }
                
                
            }
            else{
                system.debug('no operation');
            }
            
        }
        
        update m.values();
    
    }
    
    
      //live coding trigger tasks
   //task12 july16
   //After update and After Update
    public static void AfterInsertandAfterUpdatelctask12(map<id,Case> casemapNew){
    
     
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
        update acctsToUpdate.values();}    
    
    
      //live coding trigger tasks
   //task12 july16
   //After insert and After Update
    public static void AfterInsertandAfterUpdatelctask12july16(list<case> caslist,map<id,case> newmap,map<id,case> oldmap){
    
        set<id> caseid= new set<id>();
        for(case cs:caslist){
            caseid.add(cs.accountid);
        }
       
        map<id,account> mapacc = new map<id,account>([select name,LowPrioritycases__c,Highprioritycases__c,MediumPrioritycases__c from account where id in:caseid]); 
        for(case ca:caslist){
            
            account acc = mapacc.get(ca.accountid);
            
            if(ca.Priority=='high')
            {
                if(acc.Highprioritycases__c==null)
                {
                    acc.highprioritycases__c=1;
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
            else if(ca.Priority=='medium' )
            {
                if(acc.mediumprioritycases__c==null)
                {
                    acc.mediumprioritycases__c=1;
                }
                else
                {
                    acc.mediumprioritycases__c+=1;
                    if(oldmap!=null){
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
            }
            
            else if(ca.Priority=='low')
                
            { 
                if(acc.lowprioritycases__c==null)
                {
                    acc.lowprioritycases__c=1;
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
    
    
    
    
}