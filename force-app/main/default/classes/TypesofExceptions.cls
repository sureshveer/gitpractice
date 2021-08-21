public class TypesofExceptions {
    
    //NullPointerException
    public static void FirstException(){
        
        try {
            String s;
            Boolean b = s.contains('abc'); // Causes a NullPointerException
            
        } catch(NullPointerException npe) {
            System.debug('The following exception has occurred:' + npe.getMessage());
        }
        integer c=10+20;
            system.debug('sum'+c);
    }
    
    //List Exception
    public static void SecondException(){
        
        try {
            List<Integer> li = new List<Integer>();
            li.add(15);
           
            Integer i1 = li[0]; 
            Integer i2 = li[1]; // Causes a ListException
        } catch(ListException le) {
            System.debug('The following exception has occurred: ' + le.getMessage());
        }
    }
    
    
    //Query Exception
    public static void ThirdException(){
        
        try {
            
            Account a = [SELECT Name FROM Account WHERE Name = 'lmn' LIMIT 1];//
        } catch(QueryException qe) {
            System.debug('The following exception has occurred: ' + qe.getMessage());    
        }
        
    }
    
    
    //SobjectException
    public static void FourthException(){
        
        try {
            Account acc= new Account(
                name='NewAcc');
            insert acc;
            
           
            Account a = [SELECT Name FROM Account WHERE Id = :acc.Id];
          
            String s = a.Description;
        } catch(SObjectException se) {
            System.debug('The following exception has occurred: ' + se.getMessage());
        }
    }
    
    //ListException:Too Many DML Statements 151
    public static void FifthException(){
        try{
        Account a = new Account(name='suresh');
        insert a;
        contact c= new contact(lastname='veer',Accountid=a.id);
        insert c;
        
            //List<contact> conlist= new List<contact>();
        
         for(integer i=1;i<=150;i++){
                 contact c1= new contact(lastname='veer'+i,Accountid=a.id);
            // conlist.add(c1);
            insert c1;
         } 
          //  insert conlist;
        }
        catch(Exception se){
               System.debug('The following exception has occurred: ' + se.getMessage());
        }
    }
    
   //Limit Exception:Too many soql Queries 101
    public static void SixthException(){
        try{
           List<Account>  a=[select id,name from Account where name='suresh'];
            List<Contact> c=[select id,name from contact];
            for(integer i=1;i<100;i++){
                List<Account> acclist=[select id,name from Account];
            }
        }
        catch(Exception se){
             System.debug('The following exception has occurred: ' + se.getMessage());
        }
        
    }
    
    //Limit Exception:Too many DML rows 10001
    public static void SeventhException(){
        
        Account a= new Account(name='kumar');
        insert a;
        List<contact> conlist= new List<contact>();
        contact c1= new contact(lastname='aaa',accountid=a.id);
          contact c2= new contact(lastname='bbb',accountid=a.id);
        conlist.add(c1);
        conlist.add(c2); 	
        insert conlist;
        delete conlist;
        List<account> acclist= new List<account>();
        for(integer i=1;i<=10000;i++){
            Account ac=new Account(name='sss'+i);
            acclist.add(ac);
        }
        insert acclist;
    }
    
    
}