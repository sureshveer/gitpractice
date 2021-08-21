public class July15_CodeReview_TeamA5_ApexMethods {

     //Sai kiran code
		public static map<string,list<contact>> live_method1(list<contact> conlist){
        set<id> conid = new set<id>();
        
        for(contact con:conlist){
            conid.add(con.Id);
        }
        
        list<contact> conlist1=[select type__c,lastname,accountid,Amount_X__c,Amount_Y__c from contact where id In:conid and type__c!=null];
        map<string,list<contact>> conmap=new map<string,list<contact>>();
        
        for(contact con1:conlist1){
            list<contact> templist = new list<contact>();
            if(!conmap.containsKey(con1.type__c)){
              templist.add(con1);
                conmap.put(con1.Type__c,templist);
            }
            else{
               templist=conmap.get(con1.Type__c);
                templist.add(con1);
                conmap.put(con1.Type__c,templist);
                
            }
        }
        System.debug(conmap);
        return conmap;
    }
    //input is correct
    //quering from the input is correct
    //map to print the output is correct
    //logic is correct and working with expected output
    
    //Negative 
    //need to write test classes
    
	    
    //Venkat code
    public static void task11(list<contact> lstcon)
    {
        set<id> ids=new set<id>();
        for(contact cont:lstcon)
        {
            ids.add(cont.accountid);
        }
        map<string,list<contact>> mp=new map<string,list<contact>>();
        list<contact> conlst=[select accountid,Amount_X__c,Amount_Y__c,type__c from contact where id in:ids]; 
        for(contact con:conlst)
        {
            if(con.Type__c=='positive')
            {
                if(!mp.containsKey(con.Type__c))
                {
                    mp.get(con.Type__c).add(con);
                }
                else
                {
                   lstcon.add(con);
                  mp.put(con.Type__c,conlst);  
                }
            }
        }
        system.debug(mp);
    }
    //Positive 
  	//input is correct
  	//Map to print output is correct
  	
    //Negatives
    //in 1st for loop need to add ids to set is contact ids but he added contact.accountid
    //in 2nd for loop he added contact directly to map where list of contact null need to declare a list of contact inside for loop 
    //and add the contact to that list and list should putin map
    //his code is checking for only positive contacts and output is getting wrong
    //need write test classes 

    
    //Venkat code review
    public static map<string,list<contact>> task11_Modified(list<contact> lstcon)
    {
        set<id> ids=new set<id>();
        for(contact cont:lstcon)
        {
            ids.add(cont.id);
        }
        map<string,list<contact>> mp=new map<string,list<contact>>();
        list<contact> conlst=[select accountid,Amount_X__c,Amount_Y__c,type__c from contact where id in:ids and type__c!=null]; 
        for(contact con:conlst)
        {
            list<contact> listcon=new list<contact>();
                if(!mp.containsKey(con.Type__c))
                {
					listcon.add(con);
                    mp.put(con.Type__c,listcon);
                }
                else
                {
                    listcon=mp.get(con.Type__c);
                   listcon.add(con);
                  mp.put(con.Type__c,listcon);  
                }
            }
        system.debug(mp);
        return mp;
    }
  	
    //Sailesh code
    public static void task11()
    {
        map<string,list<contact>> TypeAndConlist = new map<string,list<contact>>();
        list<contact> conlist = [select Type__c,lastname from contact];
        list<contact> positivelist = new list<contact>();
        list<contact> negativelist = new list<contact>();
        for(contact c:conlist)
        {
            if(c.Type__c =='Positive'){
                positivelist.add(c);
                TypeAndConlist.put(c.Type__c,positivelist);
            }
            else if(c.Type__c =='Negative'){
                negativelist.add(c);
                TypeAndConlist.put(c.Type__c,negativelist);
            }
        }
        system.debug(TypeAndConlist);
       
    }
    //comments
    //need to pass input parameters dynamically
    //expected output is verified
    //insted of taking two lists we can take one list inside  for loop and we can get output 
    //optimization is required for the output
    //test method has 100% coverage
    //need to use systemassetequals to capture exact output
    
    //Negative  
    //in query need to use where condition(Type__c!=null to get only positive and negative contacts)
}