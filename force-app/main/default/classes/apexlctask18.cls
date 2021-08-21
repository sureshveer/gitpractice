public class apexlctask18 {

    public Product2 prod{get;set;}
    public Asset ass{get;set;}
    public List<Asset> assetlist{get;set;}
    public Boolean tableview{get;set;}
    public Id x{get;set;}
    public Asset a{get;set;}
    
    public apexlctask18(){
        prod=new Product2();
        ass= new Asset();
         tableview=false;

    }
    
    public pagereference showassets(){
        
        if(prod.name.length()>0){
             tableview=true;
            assetlist=[select id,name,status from asset where product2.name=:prod.name and status=:ass.status];
        }
      
        if(prod.name.length()==0){
             tableview=false;
             apexPages.Message myMsg1 = new ApexPages.Message(ApexPages.severity.error,'pls enter product name');
            ApexPages.addmessage(myMsg1);
        }
        
        return null;
    }
    
      public PageReference showDetails() {
        
        pageReference pr = new pagereference('/apex/vflctask8page2edit1');  
        
        pr.getparameters().put('id',x);
         pr.setRedirect(true);
         
        return pr;
    }
    
    public pagereference showasset(){
        
          a=new Asset();
       Id  assetid=apexpages.currentPage().getparameters().get('id');
        
        a=[select id,name,status from Asset where id =:assetid];
       
        return null;
    }
    
    
}