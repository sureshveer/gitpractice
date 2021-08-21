public class AttendanceTrackingController {

     @AuraEnabled        
    public static Account fetchEmployeeDetails(String empName){
    
    Account acc= [select id,name,industry,rating from account where name=:empName limit 1];
        return acc;
    
    }
}