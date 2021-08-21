public class task23helperclass {

    public   task23helperclass(){
     
        actlist = new list <task23helperclass.accountwrapper>();
     task23helperclass.accountwrapper aw = new task23helperclass.accountwrapper();
 }
   
    public list<task23helperclass.accountwrapper> actlist {get;set;}
    public  task23helperclass.accountwrapper aw {get;set;}
   
  
   
    public void rows(){
        account a = new account();
        actlist = new list <task23helperclass.accountwrapper>();
        task23helperclass.accountwrapper aw = new task23helperclass.accountwrapper();
        aw.act =a;
        actlist.add(aw);
        
        a = new account();
         aw = new task23helperclass.accountwrapper();
        aw.act =a;
        actlist.add(aw);
         }
    public void addrows(){
        account a = new account();
        task23helperclass.accountwrapper aw = new task23helperclass.accountwrapper();
        aw.act=a;
        actlist.add(aw);
    }
    
    public void deleterows(){
        system.debug('actlist  '+actlist);
      list<task23helperclass.accountwrapper> templist = new list <task23helperclass.accountwrapper>();
        for(accountwrapper aw :actlist){
            if(aw.isselected==false){templist.add(aw);}
        }
            actlist =templist;
    }
    class accountwrapper{
         
        public  account act {get;set;}
            
        public boolean isselected{get;set;}
         
       public  accountwrapper(){
           act = new account();
       }
        public  accountwrapper(account pa){
            this.act =pa;
        }
       public   accountwrapper(account pa, boolean pisselected ){
             this.act=pa;
             this.isselected= pisselected;
         }
         
         
    }
}