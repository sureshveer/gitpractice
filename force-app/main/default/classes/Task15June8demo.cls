public class Task15June8demo {
    public String searchName{get;set;}
    public Id selectedAcctId{get;set;}
    public List<Account> sortedAccts{get;set;}
    public String selectedType{get;set;}
    public account acc{get;set;}
    
    public Boolean acclist{get;set;}
    public Boolean  editrecordobj{get;set;}
    public Task15June8demo(){
        acclist=false;
        editrecordobj=false;
        
    }
    public list<selectoption> getAccTypeList(){
        list<selectoption> options = new list<selectoption>();
        schema.DescribeFieldResult data = Account.Type.getdescribe();
        list<schema.PicklistEntry> picklistdata = data.getpicklistvalues();
        options.add(new selectoption('none','None'));
        for(schema.PicklistEntry value: picklistdata){
            options.add(new selectoption(value.getlabel(),value.getvalue()));
        }
        return options;
    }
    public void show(){
        if(searchName!=NULL){
            sortedAccts=[select id,name,type from account where name=:searchName];
           
        }
        system.debug('sortedaccts'+sortedAccts);
        if(sortedAccts.size()>0){
            acclist=true;
        }
        
        if(searchName.length()==0){
            ApexPages.Message Mymsg=new ApexPages.Message(ApexPages.severity.ERROR,'enter details to search');
            ApexPages.addmessage(MyMsg);
        }
        else if (sortedAccts.size()==0){
            ApexPages.Message Mymsg=new ApexPages.Message(ApexPages.severity.ERROR,'no records with the given details');
            ApexPages.addmessage(MyMsg);
        }
    }
    
   
    public PageReference editRecord(){
        //PageReference ref = new PageReference('/apex/task15june8_demovfmain');
        //ref.setRedirect(True);
        // ref.getParameters().put('id',selectedAcctId);
        acclist=false;
        editrecordobj=true;
        
        system.debug(selectedacctid);
        acc=[select id,name,type from account where id =:selectedAcctId limit 1];
        selectedType=acc.Type;
        system.debug(acc);
        return null;
    }
    public pagereference saveacc()
    {
        acc.type=selectedType;
        update acc;
        acclist=false;
        editrecordobj=false;
         ApexPages.Message Mymsg=new ApexPages.Message(ApexPages.severity.CONFIRM,'Record Updated successfully');
            ApexPages.addmessage(MyMsg);
        return null;
    }
}