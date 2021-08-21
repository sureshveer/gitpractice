public class task7helperclass {

    public static List<String> country{get;set;}
     public static List<SelectOption> options{get;set;}
    public static List<SelectOption> options1{get;set;}
   
     public List<SelectOption> getCountries() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('None','--- None ---'));        
        options.add(new SelectOption('india','india'));
        options.add(new SelectOption('USA','USA'));
        return options;
    } 
    
    public static void task7(){
        options1 = new List<SelectOption>();
         if(country.contains('india'))
        {       
            options1.add(new SelectOption('Karnataka','Karnataka'));
            options1.add(new SelectOption('AndhraPradesh','AndhraPradesh'));
            options1.add(new SelectOption('Tamil Nadu','Tamil Nadu'));
        }
        if(country.contains('USA')) {       
            options1.add(new SelectOption('New York','New York'));
            options1.add(new SelectOption('New Jercey','New Jercey'));
        }
       
        system.debug('options list is '+options1);
      
    }
 
}