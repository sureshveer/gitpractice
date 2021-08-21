@RestResource(urlMapping='/github/webhooks/callwebservice')
global with sharing class github_webhooks_call {
    public github_webhooks_call() {

    }

    @Httppost
    global static void githubostdetails() {
        RestRequest req= RestContext.request;
        RestResponse res=RestContext.response;
        string s=req.headers.get('X-GitHub-Event');
        System.debug('webhook response'+s);
        System.debug(req.requestBody.tostring()+'payload');
        Account a=new Account();
        a.name=s;
        a.description=s;
        insert a;
    }
}
