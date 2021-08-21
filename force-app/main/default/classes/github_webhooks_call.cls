@RestResource(urlMapping='/github/webhooks/callwebservice')
global with sharing class github_webhooks_call {
    public github_webhooks_call() {

    }

    @Httppost
    global static void githubostdetails() {
        RestRequest req= RestContext.request;
        RestResponse res=RestContext.response;
        System.debug('webhook response');
        System.debug(req.requestBody.tostring()+'payload');
        Account a=new Account(name='githubcall');
        insert a;
    }
}
