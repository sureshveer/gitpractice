public class calcoperations {

    public static integer input1;
    public static integer input2;
   //  public static integer result;
    
    @AuraEnabled
    public static integer add(){
        system.debug('checking');
       integer result= input1+input2;
        system.debug('result is'+result);
        return result;
    }
    
    
    @AuraEnabled
    public static string sample(string name){
        return name;
    }
    
}