public class csvController {

     public List<Account> acclist{get;set;}
    
    public csvController() {
        
        
         acclist=[select id,name,industry from account where name='suresh'];
       /* myList = new List<List<myClass>>();
        List<myClass> temp = new List<myClass>();
        
        for(Integer i = 0; i < 2500; i++){
            if(temp.size() < 1000){
                myClass m = new myClass();
                m.val1 = 'val1 ' + i;
                m.val2 = 'val2 ' + i;
                temp.add(m);
            }
            else{
                myList.add(temp);
                temp = new List<myClass>();
                myClass m = new myClass();
                m.val1 = 'val1 ' + i;
                m.val2 = 'val2 ' + i;
                temp.add(m);
            }
        }
        myList.add(temp);*/
    }
    

   
}