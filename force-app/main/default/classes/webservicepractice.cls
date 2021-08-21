@RestResource(urlMapping='/Cases')
global class webservicepractice {
    
    @HttpGet
    global static List<Case> getCaseById() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        //String caseId = request.requestURI.substring(
         // request.requestURI.lastIndexOf('/')+1);
       // system.debug('case id'+caseId);
        
     //   map<String,String> params=RestContext.request.params;
    //String caseid=params.get('Id');
    
        List<Case> result =  [SELECT CaseNumber,Subject,Status,Origin,Priority
                        FROM Case
                        ];
        return result;
    }
    
    //map<String,String> params=RestContext.request.params
    //String caseid=params.get('Id');
}