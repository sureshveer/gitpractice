public class apexvfbasic23 {

    public List<opportunity> opplist{get;set;}
    public string oppid{get;set;}
     public string oppname{get;set;}
      public Datetime oppcreateddate{get;set;}
  
    public apexvfbasic23(){
       // integer d=Date.today().year()-1;
        
       opplist=[select id,name,createddate from opportunity];
        for(opportunity o:opplist){
            if(o.createddate.year()==Date.today().year()-1){
                oppid=o.Id;
                oppname=o.Name;
                oppcreateddate=o.CreatedDate;
            }
        }
    }
}