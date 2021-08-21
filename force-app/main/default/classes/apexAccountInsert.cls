public class apexAccountInsert {

      @AuraEnabled        
    public static List<String> getPickListValuesIntoList(){
        List<String> pickListValuesList = new List<String>();
        Schema.DescribeFieldResult fieldResult = Account.Rating.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            pickListValuesList.add(pickListVal.getLabel());
            System.debug('Values in Rating are: '+pickListValuesList);
        }     
        return pickListValuesList;
    }
    @AuraEnabled        
    public static List<Account> insertValues(Account acc){
        insert acc; 
        List<Account> acclist=[select id,name,phone,rating from account where id=:acc.id];
        return acclist;
    }
}