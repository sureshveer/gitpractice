public class apexlivecodingtask4june26 {


     public string accname{get;set;}
    public List<opportunity> opplist{get;set;}
    public Boolean opplistvalue{get;set;}
    public List<accountwrapper> acctwrapperlist{get;set;}
    
    
     public apexlivecodingtask4june26(){
        opplistvalue=false;
       
        acctwrapperlist=new List<accountwrapper>();
                   
    }
    
     public pagereference Searchopp(){
         
         if(opplist!=null){
             opplist.clear();
         }
      
        opplist=[select id,name,accountid from opportunity where account.name=:accname];
        if(opplist.size()>0){
            opplistvalue=true;
        }
        string errmsg=' ';
         if(opplist.size()==0){
            opplistvalue=false;
            errmsg='opportunity records list is zero with account name'+' '+accname;
             apexpages.message msg=new  apexpages.Message(apexpages.Severity.ERROR,errmsg);
            apexpages.addMessage(msg);
        }
       
         integer serialnumber=0;
         for(opportunity c:opplist){
            serialnumber+=1;
             
            acctwrapperlist.add(new accountwrapper(c,serialnumber));
        }
         system.debug('accwraplist is'+acctwrapperlist);
        
        return null;
    }
    
    public pagereference deleteopp(){
        List<opportunity> opplisttodelete=new List<opportunity>();
       List<accountwrapper> acctwrapperafteroppdelete=new List<accountwrapper>();

        for(accountwrapper aw:acctwrapperlist){
            if(aw.selected==true){
                
               opplisttodelete.add(aw.o);
                 
            }
            else{
              
                acctwrapperafteroppdelete.add(aw);
            }
        }
        delete opplisttodelete;
        acctwrapperlist=acctwrapperafteroppdelete;
        for(integer i=0;i<acctwrapperlist.size();i++){
            acctwrapperlist.get(i).serialnumber=i;
        }
        
     system.debug('accwraplist'+acctwrapperlist);
        
        
       
        return null;
    }

    
    public class accountwrapper{
    
    public opportunity o{get;set;}
    public Boolean selected{get;set;}
        public integer serialnumber{get;set;}
    
     public accountwrapper(opportunity ca,integer snumber){
       //  system.debug('seria'+snumber);
         o=ca;
         selected=false;
         serialnumber=snumber;
        
     }
       
}
}