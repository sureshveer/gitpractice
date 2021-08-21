@RestResource(urlMapping='/github/webhooks/callwebservice')
global with sharing class github_webhooks_call {
    public github_webhooks_call() {

    }

    @Httppost
    global static void githubostdetails() {
        RestRequest req= RestContext.request;
        RestResponse res=RestContext.response;
        string s=req.headers.get('X-GitHub-Event');
        JsonParser parser=JSON.createParser(req.requestbody.tostring());
        pusher ps;
        while(parser.nextToken()!=null){
            if(parser.getText()=='pusher'){
                System.debug('pusher');
                parser.nextToken();
                ps=(pusher)parser.readValueAs(pusher.class);
                System.debug(ps);
            }
        }
        System.debug('webhook response'+s);
        System.debug(req.requestBody.tostring()+'payload');
        Account a=new Account();
        a.name=ps.name;
        a.description=ps.email;
        insert a;
    }

    public class pusher{
        public string name;
        public string email;

        public pusher(string name,string email){
            name=name;
            email=email;
        }

    }
}
