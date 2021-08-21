public class futureclass {

  //  @future
  public static void someFutureMethod(string ratingfield) {
    List<Account> accounts = [Select Id, Name from Account Where  rating=:ratingfield];
         system.debug('acc'+accounts);
  }
    
  //  @future
    public static void someFutureMethod1(string industryfield) {
    List<Account> accounts = [Select Id, Name from Account Where  industry=:industryfield];
         system.debug('acc12'+accounts);
  } 
    
    
}