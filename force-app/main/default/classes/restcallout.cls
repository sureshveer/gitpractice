public class restcallout {

    public  static List<Account> acclist{get;set;}
     public  List<Accountwrapper> accwraplist{get;set;}
    public static Boolean checkbutton{get;set;}
     public static Boolean tablelist{get;set;}
   
        
    private final String clientId = '3MVG9n_HvETGhr3DOqM0_x36r3xxkOuDnEBKe6hZ.5MuZYvhA9t_ZptSfKHJVnZ3sosiAcYAaUns7cc0mmoDy';   
    private final String clientSecret = 'A9412A5A902C32F153A01D2C544BC54227BAA0D72EFD7960E27FABB260E88B5E';
    private final String username = 'devikaveeramalla@gmail.com@gmail.com'; 
    private final String password = 'Devika1236qvmVEDcPr2xarK59z1FQjxoy'; 
    //password should password + security token 
    
    public static Account acc;
  //  public static  String accesstoken;
   // public static  Cookie accesstoken1;
    
    
   
    public class deserializeResponse {
        public String id;
        public String access_token;
    }
    
    public restcallout(){
          acclist= new List<Account>();
        accwraplist= new List<Accountwrapper>();
        checkbutton=false;
        tablelist=false;
       GetAccounts();
     //    accesstoken1 = ApexPages.currentPage().getCookies().get('token');
      // accesstoken=getAccessToken();

    }
    
 
    
    public static  string getAccessToken() {	
        
         HttpRequest req = new HttpRequest();
        req.setEndpoint('https://logicalminds-dev-ed.my.salesforce.com/services/oauth2/token?grant_type=password&client_id=3MVG9n_HvETGhr3DOqM0_x36r3xxkOuDnEBKe6hZ.5MuZYvhA9t_ZptSfKHJVnZ3sosiAcYAaUns7cc0mmoDy&client_secret=A9412A5A902C32F153A01D2C544BC54227BAA0D72EFD7960E27FABB260E88B5E&username=devikaveeramalla@gmail.com&password=Devika1230tG6FGkGvRAjy6wJjvf7pQ9C5');
        req.setMethod('POST');
        Http h=new Http();
        HttpResponse res=new HttpResponse();
        res=h.send(req);
        system.debug('response'+res.getBody());
        deserializeResponse resp1 = (deserializeResponse) JSON.deserialize(res.getbody(), deserializeResponse.class);
        system.debug('resp1'+resp1);
        string accessToken = resp1.access_token;
        system.debug('accessToken..' + accessToken);
        system.debug('status code'+res.getStatusCode());
        system.debug('status'+res.getStatus());
        
        
               
        
           /*  if (accesstoken1 == null) {
                 system.debug('sess'+accesstoken1);
            accesstoken1 = new Cookie('token',accessToken,null,-1,true);
                  system.debug('sess'+accesstoken1);
            }
       system.debug('cookie value'+accesstoken1.getValue());*/
        return accessToken;
    }
    //new code
     public  static void createacc(){ 
       acc= new Account();
        acc.name='raju';
        acc.Industry='education';
        insert acc;
     }
    
    @future(callout=true)
    public  static void sendacc(set<id> accidlist){ 
        
       List<Account> acclist=[select id, name,industry from Account where id in :accidlist];
        
      //  Account ac=[select id, name from account limit 1];
        string str=json.serialize(acclist);
        
        HttpRequest request = new HttpRequest();
          Http h=new Http();
         HttpResponse res=new HttpResponse();
        
         request.setHeader('Content-Type', 'application/json');
            request.setHeader('accept', 'application/json');
        
         request.setEndpoint('https://logicalminds-dev-ed.my.salesforce.com/services/oauth2/token?grant_type=password&client_id=3MVG9n_HvETGhr3DOqM0_x36r3xxkOuDnEBKe6hZ.5MuZYvhA9t_ZptSfKHJVnZ3sosiAcYAaUns7cc0mmoDy&client_secret=A9412A5A902C32F153A01D2C544BC54227BAA0D72EFD7960E27FABB260E88B5E&username=devikaveeramalla@gmail.com&password=Devika1230tG6FGkGvRAjy6wJjvf7pQ9C5');
        request.setMethod('POST');
        res=h.send(request);
        
          deserializeResponse resp1 = (deserializeResponse) JSON.deserialize(res.getbody(), deserializeResponse.class);
        system.debug('resp1'+resp1);
        string accessToken = resp1.access_token;
        
        //cookies
       // getAccessToken();
      // cookie  accesstoken2 = ApexPages.currentPage().getCookies().get('token');
         //     string accessToken= accesstoken2.getValue(); 
         
        //custom setting
     //    sysorgacesstoken__c accesstoken3=sysorgacesstoken__c.getvalues('Accesstoken');
       // string accessToken=accesstoken3.Accesstoken__c;
        system.debug('access'+accessToken);
         request.setHeader('Authorization', 'Bearer ' + accessToken);
        
           
        
            request.setMethod('POST');
          request.setBody(str);
             request.setEndpoint('https://logicalminds-dev-ed.my.salesforce.com/services/apexrest/apexcall');
              res=h.send(request);
        system.debug('response body in json'+res.getBody());
        
      
        
    }
    
    //new code end
    public  pagereference GetAccounts(){ 
      
        
        HttpRequest request = new HttpRequest();
          Http h=new Http();
        String accessToken=getAccessToken();
         request.setHeader('Authorization', 'Bearer ' + accessToken);
            request.setHeader('Content-Type', 'application/json');
            request.setHeader('accept', 'application/json');
            request.setMethod('GET');
             request.setEndpoint('https://logicalminds-dev-ed.my.salesforce.com/services/apexrest/Account');
             HttpResponse res2=h.send(request);
        system.debug('response body in json'+res2.getBody());
         acclist = (List<Account>) JSON.deserialize(res2.getBody(), List<Account>.class);
        
         if(acclist.size()>0){
       
          // accwraplist.clear();
            integer sinumber=0;
            for(Account a:acclist){
                
                sinumber++;
           accwraplist.add(new Accountwrapper(a,sinumber)); 
            
        }
        }
         if(accwraplist.size()>0){
              
            tablelist=true;
             
           
        }
       
        return null;
    }
    
    public pagereference saverecord(){
        if(accwraplist.size()>0){
            accwraplist.clear();
        GetAccounts();
        }
         system.debug('accwraplist'+accwraplist);
          List<Account> saveacc= new List<Account>();
        List<Accountwrapper> afteraccdel= new List<Accountwrapper>();
        for(Accountwrapper aw:accwraplist){
            if(aw.selected==true){
                saveacc.add(aw.acc1);
            }
            else{
                afteraccdel.add(aw);
            }
           
        }
        List<String> accnamelist= new List<String>();
        for(Account a:saveacc){
            accnamelist.add(a.name);
        }
        
        List<Account> myargacctlist=[select id,name from account where name in :accnamelist];
        if(saveacc.size()>0 && myargacctlist.size()==0){
         insert  saveacc;
             apexpages.addMessage(new apexpages.Message(apexpages.Severity.INFO,'Account Records inserted successfully'));
        }
        else{
             apexpages.addMessage(new apexpages.Message(apexpages.Severity.ERROR,'Record is already in my org'));
        }
        return null;
    }
    
     public  pagereference checkitem(){
           
         system.debug('accwraplist'+accwraplist);
         for(Accountwrapper aw:accwraplist){
            if(aw.selected==true){
                 GetAccounts();
                checkbutton=true;
                 
                break;
            }
         
            else  if(aw.selected==false){
                  checkbutton=false;
                
             }
         }
        
        return null;
    }
    
    //post callout
    public static HttpResponse makePostCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
         String accessToken=getAccessToken();
        request.setEndpoint('https://logicalminds-dev-ed.my.salesforce.com/services/apexrest/Account');
        request.setMethod('POST');
         request.setHeader('Authorization', 'Bearer ' + accessToken);
            request.setHeader('Content-Type', 'application/json');
            request.setHeader('accept', 'application/json');
        request.setBody('{"name":"mighty moose"}');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
             System.debug(response.getBody());
        } else {
            System.debug(response.getBody());
        }
        return response;
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