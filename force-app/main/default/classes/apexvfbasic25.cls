public class apexvfbasic25 {

    public List<user> userlist{get;set;} 
    public apexvfbasic25(){

        userlist=[SELECT Id,name FROM User WHERE Profile.Name = 'System Admin'];
    }
}