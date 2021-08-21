public class sample1 {

    @AuraEnabled
    public static List<Contact> getconlist(){
        List<contact> con=[select id,name,email from contact where email!=null];
        return con;
    }
    
      @AuraEnabled
    public static List<Contact> getconlistname(string name){
        system.debug('name'+name);
        string a='%'+name;
        List<contact> con= new List<contact>();
        con=[select id,name,email from contact where name like :a];
        return con;
    }
}