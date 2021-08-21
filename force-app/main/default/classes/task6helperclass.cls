public class task6helperclass {
    
    
    public String country {get;set;}
    public String state {get;set;}
    public String city {get;set;}
    
    public List<SelectOption> getCountries() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('None','--- None ---'));        
        options.add(new SelectOption('India','India'));
        options.add(new SelectOption('USA','USA'));
        return options;
    } 
    
    public List<SelectOption> getStates(){
        List<SelectOption> options = new List<SelectOption>();
        if(country == 'India')
        {       
            options.add(new SelectOption('Karnataka','Karnataka'));
            options.add(new SelectOption('AndhraPradesh','AndhraPradesh'));
            options.add(new SelectOption('Tamil Nadu','Tamil Nadu'));
        }
        else if(country == 'USA') {       
            options.add(new SelectOption('New York','New York'));
            options.add(new SelectOption('New Jercey','New Jercey'));
        }
        else {
            options.add(new SelectOption('None','--- None ---'));
        }      
        return options;
    }      
    
    public List<SelectOption> getCities(){
        List<SelectOption> options = new List<SelectOption>();
        if(country == 'India')
        { 
            if(state=='Karnataka'){
                
            options.add(new SelectOption('Bangalore','Bangalore'));
            options.add(new SelectOption('x','x'));
            options.add(new SelectOption('x1','x1'));
            }
           else if(state=='AndhraPradesh'){
            options.add(new SelectOption('Vizag','Vizag'));
            options.add(new SelectOption('y','y'));
            options.add(new SelectOption('y1','y1'));
            }
            else if(state=='Tamil Nadu'){
            options.add(new SelectOption('Chennai','Chennai'));
            options.add(new SelectOption('z','z'));
            options.add(new SelectOption('z1','z1'));
            }
            else{
                options.add(new SelectOption('None','--- None ---')); 
            }
        }
        else if(country == 'USA') {    
            if(state == 'New York'){
            options.add(new SelectOption('New York1','New York1'));
            options.add(new SelectOption('New York2','New York2'));
            } 
            else  if(state == 'New Jercey'){
            options.add(new SelectOption('New Jercey1','New Jercey1'));
            options.add(new SelectOption('New Jercey2','New Jercey2'));
            } 
            else{
                options.add(new SelectOption('None','--- None ---')); 
            }
        }
        else {
            options.add(new SelectOption('None','--- None ---'));
        }      
        return options;
    }       
}