public class apexlctask21 {

    public case c{get;set;}
    public Boolean tablelist{get;set;}
    public Boolean savebutton{get;set;}
    public List<case> caselist{get;set;}
     public List<case> caselist2{get;set;}
    public string CNumber{get;set;}
    public string selectedstatus{get;set;}
    public apexlctask21(){
        c= new case();
        tablelist=false;
        savebutton=false;
        caselist= new List<case>();
        caselist2= new List<case>();
    }
    public pagereference showcases(){
        
        integer count=[select count()  from case where CaseNumber=:CNumber];
        if(CNumber.length()==0 || string.isBlank(CNumber)){
            tablelist=false;
            savebutton=false;
             apexpages.addMessage(new apexpages.Message(apexpages.Severity.ERROR,'case number should not be empty'));
        }
        else if(count==0){
             tablelist=false;
            savebutton=false;
             apexpages.addMessage(new apexpages.Message(apexpages.Severity.ERROR,'enter valid case number'));
        }
        else if(CNumber.length()!=0){
            caselist.clear();
                caselist=[select id,CaseNumber,status,ParentId from case where CaseNumber=:CNumber];
           
            set<id> caseidlist= new set<id>();
            for(case c:caselist){
                caseidlist.add(c.id);
            }
            
            caselist2=[select id,CaseNumber,status,ParentId from case where parentid in :caseidlist];
            
            for(case c1:caselist2){
                caselist.add(c1);     
            }
               if(caselist.size()>0){
                 tablelist=true;
                savebutton=true;
            }
            
             
        }
        
        
        return null;
    }
    
    
     public List<SelectOption> getcasestatuslist(){
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('None','None'));
        Schema.DescribeFieldResult fr = case.status.getDescribe();
        List<Schema.PicklistEntry> ple = fr.getPicklistValues();
        for(Schema.PicklistEntry p:ple){
            
            options.add(new SelectOption(p.getValue(),p.getValue()));
        }
        return options;
    }
    
    
     public pagereference showcases1(){
             system.debug('checking');
         caselist.clear();
         
          if(selectedstatus=='None'){
            tablelist=false;
            savebutton=false;
             apexpages.addMessage(new apexpages.Message(apexpages.Severity.ERROR,'enter valid case status'));
        }
         else{
         
            caselist=[select id,CaseNumber,status,ParentId from case where status=:selectedstatus];
        
             system.debug('list is'+caselist);
               if(caselist.size()>0){
                   system.debug('check1');
                 tablelist=true;
                savebutton=true;
            }
          
         }
         return null;
     
     }
    
    public pagereference savecase(){
        update caselist;
        tablelist=false;
         apexpages.addMessage(new apexpages.Message(apexpages.Severity.CONFIRM,'saved successfully'));
        savebutton=false;
        return null;
    }
    
    
}