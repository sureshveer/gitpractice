public with sharing class sharingapex {

    public List<account> acc{get;set;}
    public sharingapex(){
        acc=new List<account>();
         acc=[select id,name,vfcount__c,ownerId from account];
    }
    
}