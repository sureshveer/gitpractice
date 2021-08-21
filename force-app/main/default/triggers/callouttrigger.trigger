trigger callouttrigger on Contact (after insert) {

    if(Trigger.isafter && Trigger.isinsert){
     //   restcallout rc=new restcallout();
      set<id> accidset= new set<id>();
        for(contact con:Trigger.new){
            if(con.accountid!=null){
            accidset.add(con.accountid);
            }
           
            
        }
        restcallout.sendacc(accidset);
    }
}