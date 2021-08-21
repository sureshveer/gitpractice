public with sharing class alirajalwcclass {
    public alirajalwcclass() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> retrieveContactData(string keySearch){     
        string str= keySearch+'%';
        List<Contact> contactList = [Select Id, FirstName, LastName, Email, Phone From 
        Contact Where LastName like:str];
        return contactList;
    }
    @AuraEnabled(cacheable=true)
    public static contact retrieveContactData1(string keySearch,string keySearch1)
    {
        //account lstacc=[select id,name,(select lastname from contacts) from account where name =: input];
        contact lstcon=[select id,lastname,accountid from contact where id=:keySearch1];
        lstcon.accountid=keySearch;
        update lstcon;
        return lstcon;
    }
}