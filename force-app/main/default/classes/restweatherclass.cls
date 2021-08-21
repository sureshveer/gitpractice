public class restweatherclass {

    public static string city{get;set;}
    public static string temp{get;set;}
    public static string pressure{get;set;}
    public static string humidity{get;set;}
    public static string temp_min{get;set;}
    public static string temp_max{get;set;}
    
    public static Pagereference showweather(){

        string apikey='5a7ee88dd941b70bf5f2b5ea2a246f4f';
        
            string restendpoint='http://api.openweathermap.org/data/2.5/weather?q='+city+'&units=metric&APPID='+apikey;
        Http h= new Http();
        HttpRequest req=new HttpRequest();
        req.setEndpoint(restendpoint);
        req.setMethod('GET');
        HttpResponse res=h.send(req);
        system.debug('response body in json'+res.getBody());
        
        if(res.getStatusCode()==200){
            
            Map<string,Object> m=(map<string,object>)JSON.deserializeUntyped(res.getBody());
            system.debug('map is'+m);
            city=String.valueOf(m.get('name'));
            Map<string,object> mainresults=(Map<string,object>)m.get('main');
            system.debug('main results map is'+mainresults);
           
            temp=String.valueOf(mainresults.get('temp'));
             pressure=String.valueOf(mainresults.get('pressure'));
             humidity=String.valueOf(mainresults.get('humidity'));
             temp_min=String.valueOf(mainresults.get('temp_min'));
             temp_max=String.valueOf(mainresults.get('temp_max'));
            
        }
        else{
            system.debug('error');
            apexpages.addMessage(new ApexPages.Message(apexpages.Severity.ERROR,'something error'));
        }
     return null;
    }
}