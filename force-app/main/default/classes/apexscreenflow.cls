public class apexscreenflow {

     @AuraEnabled
    public static Contact getContacts(){
        Contact conlist = [SELECT id,lastname,email,phone FROM Contact limit 1];
		
        return conlist ;
    }

      @AuraEnabled
    public static Opportunity getopportunity(){
         Opportunity opplist = [SELECT id,amount,stagename FROM Opportunity limit 1];
		
        return opplist ;
    }
}