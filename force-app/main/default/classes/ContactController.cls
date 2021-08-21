public with sharing class ContactController {
@AuraEnabled(cacheable=true)
public static List<Contact> getContactList() {
//throw new AuraHandledException('Forced error');
List<contact> con= [
    SELECT FirstName, LastName, Email
    FROM Contact
    WITH SECURITY_ENFORCED
    ORDER BY Name
    ];
    System.debug(con+'con');
    System.debug(con.size()+'con size');
 return con;
}
}