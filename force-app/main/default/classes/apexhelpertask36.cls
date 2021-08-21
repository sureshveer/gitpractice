public class apexhelpertask36 {

       public string selectedoppstage{get;set;}
    public List<opportunity> opplist{get;set;}
    public List<wrapperclass> wrapperlist{get;set;}
    
    
    public apexhelpertask36(){
        wrapperlist= new List<wrapperclass>();
        
    }
    
    public List<SelectOption> getoppstagelist(){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption(' ',' '));
        Schema.DescribeFieldResult fr = opportunity.StageName.getDescribe();
        List<Schema.PicklistEntry> ple = fr.getPicklistValues();
        for(Schema.PicklistEntry p:ple){
            options.add(new SelectOption(p.getValue(),p.getValue()));
        }
        return options;
    }
    
    public pagereference searchopp(){
      
        opplist=[select id,name,amount,StageName from opportunity where stagename=:selectedoppstage];
        for(opportunity o:opplist){
        wrapperlist.add(new wrapperclass(o));
        
        }
        return  null;
    }
    
    public pagereference deleteopp(){
         List<opportunity> opplisttodelete=new List<opportunity>();
       List<wrapperclass> wrapperafteroppdelete=new List<wrapperclass>();

        for(wrapperclass aw:wrapperlist){
            if(aw.isselected==true){
               opplisttodelete.add(aw.opp);
            }
            else{
                wrapperafteroppdelete.add(aw);
            }
        }
        delete opplisttodelete;
        wrapperlist=wrapperafteroppdelete;
        
        
        return null;
    }
    
    class wrapperclass{
        public Boolean isselected{get;set;}
        public opportunity opp{get;set;}
                  
        public wrapperclass(opportunity o){
            this.isselected=false;
            this.opp=o;
        }
        
        
    }
    
    
}