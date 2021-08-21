public class task13helperclass {

      public String department {get;set;}
      public String course {get;set;}
    
    
    public List<SelectOption> getdepartments() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('None','--- None ---'));        
        options.add(new SelectOption('ece','ece'));
        options.add(new SelectOption('cse','cse'));
        options.add(new SelectOption('mech','mech'));
        return options;
    } 
    
    public List<SelectOption> getcourses(){
        List<SelectOption> options = new List<SelectOption>();
        if(department == 'ece')
        {       
            options.add(new SelectOption('signalsystems','signalsystems'));
            options.add(new SelectOption('EDC','EDC'));
            options.add(new SelectOption('m1','m1'));
        }
        else if(department == 'cse') {       
            options.add(new SelectOption('m2','m2'));
            options.add(new SelectOption('java','java'));
            options.add(new SelectOption('python','python'));
        }
        else if(department == 'mech') {       
            options.add(new SelectOption('m3','m3'));
            options.add(new SelectOption('Machine Design','Machine Design'));
            options.add(new SelectOption('Drawing','Drawing'));
        }
        else {
            options.add(new SelectOption('None','--- None ---'));
        }      
        return options;
    }      
}