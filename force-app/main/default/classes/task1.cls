public with sharing class task1 {
    public task1() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> retrieveContactData(string keySearch){       
        
        List<Contact> contactList = [Select Id, FirstName, LastName, Email, Phone, Account.Name From Contact Where Account.Name=:keySearch];
        return contactList;
    }
}