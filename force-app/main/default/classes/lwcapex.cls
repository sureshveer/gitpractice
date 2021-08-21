public with sharing class lwcapex {
    public lwcapex() {

    }

    @AuraEnabled(Cacheable=true)
    public static List <Contact> getContacts(String strLastName) {
        String strLastNameLike = '%'+strLastName+'%';
        List<Contact> contList = [SELECT Id,FirstName,LastName,Account.Name,email
                                   FROM Contact
                                   Where Name like :strLastNameLike
                                   ];
        return contList;
    }   
}