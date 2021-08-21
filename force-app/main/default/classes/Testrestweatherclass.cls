@istest
public class Testrestweatherclass {

     @isTest  public static void testshowweather() {
       
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetWeatherfields');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
       
        Test.setMock(HttpCalloutMock.class, mock);
       
      //   restweatherclass rwc= new restweatherclass();
        HttpResponse result = restweatherclass.showweather();
        
         System.assertEquals(200,result.getStatusCode());
          Map<string,Object> m=(map<string,object>)JSON.deserializeUntyped(result.getBody());
          System.assertEquals('Hyderabad',String.valueOf(m.get('name')));
         
     }
    
}