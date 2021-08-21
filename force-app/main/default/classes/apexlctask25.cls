public class apexlctask25 {

    public string accname{get;set;}
    public List<contact> conlist{get;set;}
    public Boolean contable{get;set;}
    public Boolean selected{get;set;}
     public Boolean editbutton{get;set;}
     public Boolean delbutton{get;set;}
    public Boolean checkbox1{get;set;}
      public Boolean conview{get;set;}
        
     public Boolean savebutton{get;set;}
     public List<Contactwrapper> conwraplist{get;set;}
    
    public apexlctask25(){
        contable=false;
        conlist= new List<contact>();
       checkbox1=false;
        delbutton=false;
        editbutton=false;
        conview=false;
      
        savebutton=false;
         conwraplist= new List<Contactwrapper>();
    }
    
     public pagereference showcontacts(){
        integer count=[select count() from Account where name=:accname];
         system.debug(count);
        if(accname.length()==0 || string.isBlank(accname)){
            contable=false;
             checkbox1=false;
            delbutton=false;
        editbutton=false;
             savebutton=false;
            conview=false;
            
             apexpages.addMessage(new apexpages.Message(apexpages.Severity.error,'pls enter Account name'));
        }
        else if(count==0){
             contable=false;
             checkbox1=false;
            delbutton=false;
            conview=false;
            
        editbutton=false;
             savebutton=false;
             apexpages.addMessage(new apexpages.Message(apexpages.Severity.error,'pls enter valid Account name'));
        }
       else  if(accname.length()!=0 || !string.isBlank(accname)){
            
        Conlist=[select id,lastname,email  from Contact where account.name=:accname];
           
           if(Conlist.size()==0){
             contable=false;
            checkbox1=false;
            delbutton=false;
               conview=false;
        editbutton=false;
                savebutton=false;
              
             apexpages.addMessage(new apexpages.Message(apexpages.Severity.error,'Account name does not have any contacts'));
        }
          else if(Conlist.size()>0){
                contable=true; //displayed contact records
              checkbox1=true; //selcted checkkbox
               savebutton=false;
              conview=false; //after edit contact table
            
               for(Contact c:Conlist){
           conwraplist.add(new Contactwrapper(c)); 
           
        }
               
           }
        }
        return null;
    }
     public pagereference editcon(){
     
           savebutton=true;
         conview=true;
         contable=false;
        
         editbutton=false;
         delbutton=false;
         
         
         conlist.clear();
         for(Contactwrapper cw:conwraplist){
           if(cw.selected==true){
             conlist.add(cw.c1);
              
         }
            
     }
         for(Contactwrapper cw:conwraplist){
           if(cw.selected==true){
             break;
         }
             else if(cw.selected==false){
                      savebutton=false;
         conview=false;
         contable=true;
        
         editbutton=true;
         delbutton=true;
                 apexpages.addMessage(new apexpages.Message(apexpages.Severity.error,'pls select any checkbox'));
             }
            
     } 
        
         
         return null;
     }
    
     public pagereference deletecon(){
      savebutton=false;
          List<Contact> delcon= new List<Contact>();
        List<Contactwrapper> aftercondel= new List<Contactwrapper>();
        for(Contactwrapper cw:conwraplist){
            if(cw.selected==true){
                delcon.add(cw.c1);
            }
            else{
                aftercondel.add(cw);
            }
           
        }
         delete delcon;
         conwraplist=aftercondel;
         return null;
     }
    
      public pagereference checkitem(){
          if(selected ==true){
          delbutton=true;
        editbutton=true;
          }
          else if(selected ==false){
               delbutton=false;
        editbutton=false;
          }
         return null;
     }
    
  
         
     public pagereference savecon(){
     
         update conlist;
       
         conview=false;
         contable=true;
         savebutton=true;
          editbutton=true;
         delbutton=true;
         
          for(Contactwrapper cw:conwraplist){
               cw.selected =false;
          }
            
         
         
         return null;
     }
    
    
    
    class Contactwrapper{
        Public Boolean selected{get;set;}
        Public Contact c1{get;set;}
      
        public Contactwrapper(Contact c2){
            c1=c2;
            selected=false;
        }
        
    }
    
    
}