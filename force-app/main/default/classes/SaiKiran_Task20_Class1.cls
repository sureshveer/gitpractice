public class SaiKiran_Task20_Class1 
{
    public id x{get;set;}
    public string accname{get;set;}
    public list<contact> conlist{get;set;}
    public map<id,contact> mapdata{get;set;}
    public Boolean contactlist{get;set;}
    public contact c{get;set;}
     public boolean editsection{get;set;}
    public boolean edit1section{get;set;}
     public boolean editbutton{get;set;}
     public boolean updatebutton{get;set;}
    
    public SaiKiran_Task20_Class1()
    {
        
        contactlist=false;
        conlist=new list<Contact>();
        mapdata= new map<id,contact>();
        editsection=false;
        edit1section=false;
        editbutton=true;
        updatebutton=false;
        
    }
    
   
    
    public PageReference showcontacts() {
        if(accname.length()==0)
        {
            contactlist=false;
         	apexPages.Message myMsg = new ApexPages.Message(ApexPages.severity.info,'Pls Enter Account Name');
            ApexPages.addmessage(myMsg);   
        }
        else if(string.isBlank(accname)){
              contactlist=false;
         	apexPages.Message myMsg1 = new ApexPages.Message(ApexPages.severity.info,'Acount name should not start with space');
            ApexPages.addmessage(myMsg1);   
        }
       else  if(accname.length()!=0 && !string.isBlank(accname))
        {
         
      //  string q = 'select id,AccountId,lastname,account.name,phone,leadsource from contact where account.name=\''+accname+'\'';
       //    conlist=database.query(q);
             mapdata=new map<id,contact>([select id,name,AccountId,lastname,account.name,phone,leadsource from contact where account.name=:accname]);
        	
        //   conlist=[select id,AccountId,lastname,account.name,phone,leadsource from contact where account.name=:accname];
            if(mapdata.size()>0)
            {
                 contactlist=true;
            }
        	else if(mapdata.size()==0)
        	{
                contactlist=false;
            apexPages.Message myMsg1 = new ApexPages.Message(ApexPages.severity.info,'no records with the account name'+' '+accname);
            ApexPages.addmessage(myMsg1);
        	}
        }
        return null;
    }
    
     public PageReference showDetails() {
        
        pageReference pr = new pagereference('/apex/SaiKiran_Task20_vf2');  
        
        pr.getparameters().put('id',x);
         pr.setRedirect(true);
         
        return pr;
    }
    
     public pagereference showcondetails() {
        editsection=false;
        edit1section=true;
        updatebutton=false;
        c=new contact();
       Id  conid=apexpages.currentPage().getparameters().get('id');
        system.debug('id'+conid);
        c=[select Account.name,lastname,phone,leadsource from contact where id =:conid limit 1];
        system.debug('query:'+c);
         return null;
    }
    
     public pagereference Editrecord(){
         edit1section=false;
        editsection =true;
          editbutton=false;
          updatebutton=true;
        
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
        updatebutton=false;
        return null;
    }
     public pagereference previouspage(){
       
         pageReference vf1page = new pagereference('/apex/SaiKiran_Task20_vf1');  
         vf1page.setRedirect(true);
        return vf1page;
    }
    
}
//no proper output(only displying account related contacts with showdetails link)
//click on show contacts button without enter account name it is showing all  contacts
//after click show details it is showing only edit button without any records