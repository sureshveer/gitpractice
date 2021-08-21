public class SaiKiran_Task20_class2 
{
    public boolean editsection{get;set;}
    public boolean edit1section{get;set;}
    public contact c{get;set;}
    public Id conid{get;set;}
    
    public SaiKiran_Task20_class2() {
        editsection=false;
        edit1section=true;
        c=new contact();
        conid=apexpages.currentPage().getparameters().get('id');
        system.debug('id'+conid);
        c=[select Account.name,lastname,phone,leadsource from contact where id =:conid limit 1];
        system.debug('query:'+c);
    }
    public pagereference Editrecord(){
         edit1section=false;
        editsection =true;
        
        return null;
    }
    public pagereference deleterecord(){
        delete c;
         pageReference vf1 = new pagereference('/apex/SaiKiran_Task20_vf1');  
         vf1.setRedirect(true);
        return vf1;
    }
    public pagereference updaterecord(){
        update c;
         edit1section=true;
        editsection =false;
        return null;
    }
     public pagereference previouspage(){
       
         pageReference vf1page = new pagereference('/apex/SaiKiran_Task20_vf1');  
         vf1page.setRedirect(true);
        return vf1page;
    }
    
}