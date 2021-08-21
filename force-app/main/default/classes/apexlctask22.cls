public class apexlctask22 {

    public Account acc{get;set;}
    public Account acc2{get;set;}
    public Boolean inputfields{get;set;}
    public Boolean tablelist{get;set;}
    public Boolean deletebutton{get;set;}
    public Boolean tablelist1{get;set;}
     public Boolean updatelist{get;set;}
     public List<Account> accountinsertedlist{get;set;}
    public Id x{get;set;}
    public List<Accountwrapper> accwraplist{get;set;}
    
    public List<Account> acclist{get;set;}
   
    public apexlctask22(){
        
        inputfields=true;
        tablelist=false;
        deletebutton=false;
        tablelist1=false;
        acc= new Account();
        acclist= new List<Account>();
        accountinsertedlist=new List<Account>();
        accwraplist= new List<Accountwrapper>();
    }
    public pagereference saveacc(){
        
        
        if(acc.name==null || String.isBlank(acc.name)){
             tablelist1=false;
             inputfields=true;
            tablelist=false;
             
            apexpages.addMessage(new apexpages.Message(apexpages.Severity.ERROR,'Account Name cannot be empty'));
        }
        else if(acc.Industry==null){
              tablelist1=false;
             inputfields=true;
            tablelist=false;
            apexpages.addMessage(new apexpages.Message(apexpages.Severity.ERROR,'mention proper account industry'));
        }
        else if(acc.rating==null){
              tablelist1=false;
             inputfields=true;
            tablelist=false;
            apexpages.addMessage(new apexpages.Message(apexpages.Severity.ERROR,'mention proper account rating'));
        }
        if(acc.name!=null  && acc.Industry!=null  && acc.Rating!=null){
           accountinsertedlist.add(acc);
        insert accountinsertedlist;
        }
        
        system.debug('created date'+acc.CreatedDate);
        if(acc.name!=null  && acc.Industry!=null  && acc.Rating!=null){
        acclist=[select id,name,phone,industry,rating,createddate from account where createddate=TODAY order by createddate DESC];
        system.debug('acclist is'+acclist);
        }
       
        if(acclist.size()>0){
        acc.Name=null;
        acc.Industry=null;
        acc.Rating=null;
        }
        
        if(acclist.size()>0){
       
           accwraplist.clear();
            integer sinumber=0;
            for(Account a:acclist){
                
                sinumber++;
           accwraplist.add(new Accountwrapper(a,sinumber)); 
            
        }
        }
        if(accwraplist.size()>0){
                inputfields=true;
            tablelist=true;
              tablelist1=true;
           
        }
      
        
       
      
        return null;
    }
    
    public pagereference showDetails(){
        tablelist1=false;
        updatelist=true;
         inputfields=false;
       acc2=[select id,name,industry,rating from Account where id=:x limit 1];
        
       
        return  null;
    }
    
    public pagereference updateacc(){
        
        update acc2;
        acclist.clear();
        accwraplist.clear();
          acclist=[select id,name,phone,industry,rating,createddate from account where createddate=TODAY order by createddate DESC];
        integer x=0;            
        for(Account a:acclist){
            x++;
           accwraplist.add(new Accountwrapper(a,x));    
        }
         tablelist1=true;
        updatelist=false;
         inputfields=true;
       
        
        return null;
        
    }
    

    
    public pagereference checkitem(){
    
         for(Accountwrapper aw:accwraplist){
            if(aw.selected==true){
                deletebutton=true;
                 
                break;
            }
         
            else  if(aw.selected==false){
                  deletebutton=false;
                
             }
         }
        
        return null;
    }
    
    public pagereference deleterecord(){
         tablelist1=true;
        
        List<Account> delacc= new List<Account>();
        List<Accountwrapper> afteraccdel= new List<Accountwrapper>();
        for(Accountwrapper aw:accwraplist){
            if(aw.selected==true){
                delacc.add(aw.acc1);
            }
            else{
                afteraccdel.add(aw);
            }
           
        }
         delete delacc;
         accwraplist=afteraccdel;
       for(integer i=1;i<=accwraplist.size();i++){
            accwraplist.get(i).serialnumber=i;
        }  
      
            deletebutton=false;
        
        return null;
    }
   
    class Accountwrapper{
        Public Boolean selected{get;set;}
        Public Account acc1{get;set;}
        Public integer serialNumber{get;set;}
        public Accountwrapper(Account a,integer sino){
            acc1=a;
            selected=false;
            serialNumber=sino;
            
        }
        
    }
}