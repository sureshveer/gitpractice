public class apexlctask23 {


    public List<contact> con{get;set;}
    public contact c{get;set;}
    public Boolean addcon{get;set;}
     public Boolean addcon1{get;set;}
    public apexlctask23(){
        con=new List<contact>();
        c= new contact();
        con.add(c);
      // addcon=true;
       // addcon1=false;
    }
    
    public pagereference savecontact(){
       
      
        set<string> lastnamelist = new set<string>(); 
        for(contact c5:con){
            lastnamelist.add(c5.lastname);
        }
       
        integer c4=[select count() from contact where lastname in :lastnamelist];
         for(contact c5:con){
        if(c4>0){
            apexpages.addMessage(new apexpages.Message(apexpages.Severity.error,'lastname'+c5.lastname+' '+'already exist'));
        }
       }
                                                       
       if(con.size()>0){
        insert con;
        apexpages.addMessage(new apexpages.Message(apexpages.Severity.Confirm,'Successfully saved'));
        }
       
        return null;
    }
   
    public pagereference addcontact(){
       // insert c;
      //  addcon=false;
       //  addcon1=true;
       c= new contact();
       
        if(c!=null){
        con.add(c);
        }
        return null;
    }
}