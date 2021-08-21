public class july28 {
    
    public string ipname{get;set;}
    public string ipstatus{get;set;}
    public id selectedipid{get;set;}
    public list<asset> astlist{get;set;}
    public asset asst {get;set;}
    public boolean view{get;set;}

    public july28()
    {
        view=false;
        astlist = new list<asset>();
        selectedipid=apexpages.currentPage().getparameters().get('id');
        if(selectedipid!=null)
        {
        asst =[select name,status,purchasedate from asset where id=:selectedipid];
        }
    }
    
    public list<selectoption> getippstatus()
    {
        list<selectoption> options=new list<selectoption>();
        options.add(new selectOption('select','--selectOne--'));
        Schema.DescribeFieldResult fr = asset.status.getDescribe();
        List<Schema.PicklistEntry> pl = fr.getPicklistValues();
        for(Schema.PicklistEntry p:pl){
            options.add(new SelectOption(p.getvalue(),p.getValue()));
        }
        return options;        
    }
    
    public void showassets()
    {
       
            astlist=[select name,status,purchasedate,product2id,product2.name,accountid from asset where product2.name=:ipname and status=:ipstatus];
        
        
        if(ipname.length()==0)
        {
            apexpages.Message mymsg = new apexpages.Message(apexpages.Severity.ERROR,'enter a product name to search ');
            apexpages.addMessage(mymsg);
        }
         else if(astlist.size()==0)
         {
             apexpages.Message mymsg = new apexpages.Message(apexpages.Severity.ERROR,'enter crct product name to search ');
            apexpages.addMessage(mymsg);
         }
    }
    
    public pagereference show()
    {
        pagereference pf = new pagereference('https://mantlesoft-dev-ed--c.visualforce.com/apex/vf1july28?ref?id='+selectedipid);
        pf.setRedirect(true);
        return pf;
    }
    
     
    public pagereference back()
    {
        pagereference pf = new pagereference('https://mantlesoft-dev-ed--c.visualforce.com/apex/vfjuly28?ref?id='+selectedipid);
        pf.setRedirect(true);
        return pf;
    }
    
    
}