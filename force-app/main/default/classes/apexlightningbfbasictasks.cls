public class apexlightningbfbasictasks {

   @AuraEnabled
    public static integer empid{get;set;}
     @AuraEnabled
    public static string empname{get;set;}
     @AuraEnabled
    public static decimal empsal{get;set;}
    
    public static Account acc{get;set;}
     public static contact con{get;set;}
     public static Opportunity opp{get;set;}
     public static case c{get;set;}
    
    
    public apexlightningbfbasictasks(){
        empid=1;
        empname='suresh';
        empsal=10000;
        
      
       
       
      
    }
    
    
    @AuraEnabled
        public  static  string getempdetails(){
       /* apexlightningbfbasictasks emp= new apexlightningbfbasictasks();
        emp.empid=1;
        emp.empname='suresh';
        emp.empsal=10000.00;*/
            
        return 'suresh';
        
    }
    
     @AuraEnabled
        public  static  Account getaccdetails(){
              acc= new Account();
         acc= new Account(name='sureshjack19',industry='chemicals',rating='hot');
            system.debug('acc'+acc);
            insert acc;
             system.debug('acc1'+acc);
          
            return acc;
        }
    
      @AuraEnabled
        public  static  Contact getcondetails(){
             con= new Contact();
              Account a=apexlightningbfbasictasks.getaccdetails();
          con=new Contact(Accountid=a.id,lastname='veer');
            system.debug('con'+con);
            insert con;
             system.debug('con1'+con);
            return con;
        }
    
      @AuraEnabled
        public  static  Opportunity getoppdetails(){
             opp=new Opportunity();
            Account a=apexlightningbfbasictasks.getaccdetails();
          opp=new Opportunity(Accountid=a.id,Name='sureshopp',StageName='Closed won',Closedate=Date.today());
             system.debug('opp'+opp);
            insert opp;
             system.debug('opp1'+opp);
            return opp;
        }
    
     @AuraEnabled
        public  static  case getcasedetails(){
              c= new Case();
             Account a=apexlightningbfbasictasks.getaccdetails();
          c=new case(Accountid=a.id,Status='New',Origin='phone');
             system.debug('c'+c);
            insert c;
             system.debug('c1'+c);
            return c;
        }
}