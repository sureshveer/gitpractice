@istest
public class LiveCodingMay_21testcases {

      public static List<contact> addrecordstestsetup(){
         // List<account>  act = [select name, Phone,AnnualRevenue,industry from Account where account.industry='energy'];
         List<Contact> con= new List<Contact>();
         
         
 for(integer i=0;i<10;i++){
              con.add(new contact(lastname='suresh'+i,accountid='ram'+i,phone='949400194'+i));            
          }
          insert con;
          return con;
      }
    @istest
    public static void task6testcase1(){
        List<contact> con=addrecordstestsetup();
        LiveCodingMay_21.task6(con);
    }
       @istest
    public static void task7testcase2(){
        LiveCodingMay_21.task7(3);
    }
    
}