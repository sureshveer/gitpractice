public class AccountSearchPage {
    public list<account> acc{set;get;}
    public list<account> acc1{set;get;}
    public string mode{set;get;}
    public account ac{set;get;}
    public string AccountName{set;get;}
    public id accid{set;get;}
    public boolean detailmode{set;get;}
    public boolean editmode{set;get;}
    public boolean Searchmode{set;get;}
    public AccountSearchPage(){
        mode=ApexPages.currentPage().getParameters().get('mode');
        accid=ApexPages.currentPage().getParameters().get('id');
        If(mode=='Detail' || mode=='Edit'){                                    
            editmode=mode=='edit'?true:false;
            detailmode=mode=='detail'?true:false;
            Searchmode=false;
            ac=[select id,name,phone,AccountSource,AnnualRevenue,BillingAddress,Rating from account where id=:accid];          
        }else{
            ac=new account();
            editmode=true;
            detailmode=false;
            //acc=[select name from account];
        }
    }
    Public pagereference search(){
        
        try{
            if(AccountName==''){
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please Enter AccountName'));
                return null;
            }else{
                acc1=[select id,name,phone,AccountSource,AnnualRevenue,Rating from account where name=:AccountName];
                Searchmode=true;
            }if(acc1.size()==0){
                Searchmode=false;
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'No records found'));
                    return null;
            }
        }catch(Exception e){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please Enter AccountName'));
        }
        return null;
    }
    public pagereference save(){
        try{
        upsert ac;
        mode='Detail';               
        pagereference p=new pagereference('https://yashu1604-dev-ed--c.visualforce.com/apex/AccountNewAndEdit?id='+ac.Id+'&mode='+mode);
        return p;
        }catch(DMLException e){
            Apexpages.addMessages(e);
            return null;
        }
     }
     public pagereference cancel(){
        pagereference p=new pagereference('/apex/AccountSearchPage');
        return p;
    }
    public PageReference forwardId() {
        mode='Detail'; 
        pagereference pr=new pagereference('https://yashu1604-dev-ed--c.visualforce.com/apex/AccountNewAndEdit?id='+accid+'&mode='+mode);
        return pr; 
    } 
    public PageReference Accountedit() {        
         mode='edit';
        pagereference p=new pagereference('https://yashu1604-dev-ed--c.visualforce.com/apex/AccountNewAndEdit?id='+accid+'&mode='+mode);
        return p; 
    } 
    public pagereference delete1(){
        delete ac;
        pagereference p=new pagereference('/apex/AccountSearchPage');
        return p;
    } 
    public Pagereference returnpage(){
        Pagereference p=new Pagereference('/apex/AccountSearchPage');
        return p;
    }

}