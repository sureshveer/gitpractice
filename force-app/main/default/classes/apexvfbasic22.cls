public class apexvfbasic22 {

    public List<opportunity> opplist{get;set;}
    public string oppid{get;set;}
     public string oppname{get;set;}
      public Datetime oppclosedate{get;set;}
  
    public apexvfbasic22(){
       // integer d=Date.today().year()-1;
        
       opplist=[select id,name,closedate from opportunity where closedate= this_month];
        for(opportunity o:opplist){
            if(o.closedate.month()==12){
                oppid=o.Id;
                oppname=o.Name;
                oppclosedate=o.Closedate;
            }
        }
    }
}