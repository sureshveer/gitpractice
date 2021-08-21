public with sharing class WireExaple {
    public WireExaple() {

    }
    @AuraEnabled(Cacheable = true)
    public static List<Contact> getContacts(string keySearch){
        String strKey = '%' + keySearch + '%';
    
        return [SELECT Id, FirstName,LastName, Phone, Email FROM Contact where name LIKE:strKey ];
     
    }
}