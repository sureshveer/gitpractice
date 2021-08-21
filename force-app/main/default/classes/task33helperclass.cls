public class task33helperclass {

    public string casenumber{get;set;}
    public List<case> caselist{get;set;}
    
    
    public void viewcases(){
          caselist=[select id,Subject,status,casenumber from case where casenumber=:casenumber ];
        
      //  pagereference p= new Pagereference('/apex/redirectvftask33');
      //  p.setRedirect(true);
       
    }
    
   
    
}