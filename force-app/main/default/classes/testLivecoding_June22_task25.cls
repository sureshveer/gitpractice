@istest
public class testLivecoding_June22_task25 {

     public static List<opportunity> addopprecordstestsetup(){
         // List<account>  act = [select name, Phone,AnnualRevenue,industry from Account where account.industry='energy'];
         List<Opportunity> opplist= new List<Opportunity>();
         
         
         for(integer i=0;i<10;i++){
              opplist.add(new Opportunity(name='suresh'+i,amount=2500,description='this is opportunity')); 
                          
          }
          insert opplist;
          return opplist;
      }
    
    
    @istest
    public static void testtask25(){
        List<id> idlist=new List<Id>();
          idlist.add('0012w000008FDxZAAW');
        LiveCoding_June22_task25.createmap(idlist);
    }
    
    @istest
    public static void testtask26(){
      
   List<opportunity> opplist= testLivecoding_June22_task25.addopprecordstestsetup();   
        ApexLCtask26.task26(opplist);
    }
}