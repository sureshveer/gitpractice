public class apexlvctask26 {

    public  static void task26(List<Student_Activities__c>  newlist){
     //   system.debug('newdata is'+newdata);
        system.debug('newlist'+newlist);
        
        Map<id,Student_Activities__c> newdata= new Map<id,Student_Activities__c>();
        for(Student_Activities__c st:newlist){
            newdata.put(st.id,st);
        }
        
        set<id> stuidlist= new set<id>();
         set<id> actidlist= new set<id>();
        
        for(id sid:newdata.keySet()){
            stuidlist.add(newdata.get(sid).Student_Master__c);
             actidlist.add(newdata.get(sid).Activity__c);
        }
        system.debug('stuidlist'+stuidlist);
        
        List<Student_Activities__c> l1= [select id,name,Student_Master__c,Activity__c from Student_Activities__c where Student_Master__c in :stuidlist
                                        and Activity__c in :actidlist];
      
        map<id,Activity__c> actdata= new map<id,Activity__c>([select id,name,Deadline__c,Enrollment_Limit__c,
                                                              Number_Of_Students_Enrolled__c,ActivityStartDate__c,
                                                              ActivityEndDate__c,Number_of_Students_participated__c
                                                              from Activity__c where id in :actidlist]);
        
     
      
        for(id stuactid:newdata.keyset()){
            system.debug('date'+newdata.get(stuactid).createddate );
            if(Date.today() > actdata.get(newdata.get(stuactid).Activity__c).Deadline__c){
                newdata.get(stuactid).addError('student cannot be enrolled for an activity after deadline date');
            }
            if(actdata.get(newdata.get(stuactid).Activity__c).Enrollment_Limit__c==0){
                 newdata.get(stuactid).addError('student enrollment limit for any activity cannot be zero');
            }
            if(l1.size()>0){
                 newdata.get(stuactid).adderror('student cannot be enrolled for same activity more than once');
            }
             if(actdata.get(newdata.get(stuactid).Activity__c).Enrollment_Limit__c > 0){
                 if(actdata.get(newdata.get(stuactid).Activity__c).Number_Of_Students_Enrolled__c >= actdata.get(newdata.get(stuactid).Activity__c).Enrollment_Limit__c){
                  newdata.get(stuactid).addError('Number of students enrolled should not be greater than enrollment limit');
                 }
             }
            
            DateTime dt = System.now();
            Date myDate = date.newinstance(dt.year(), dt.month(), dt.day());
            
            DateTime dt1 = actdata.get(newdata.get(stuactid).Activity__c).ActivityStartDate__c;
            Date startdate = date.newinstance(dt1.year(), dt1.month(), dt1.day());
            
            DateTime dt2 = actdata.get(newdata.get(stuactid).Activity__c).ActivityEndDate__c;
            Date enddate = date.newinstance(dt2.year(), dt2.month(), dt2.day());
           
            if(newdata.get(stuactid).participated__c==true 
                && (myDate > enddate)){
                 newdata.get(stuactid).addError(' student cannot be participated after end date');
                     system.debug('date is'+myDate);
                system.debug('end date'+enddate);
             }
            if( myDate.daysBetween(startdate) <= 2){
                 newdata.get(stuactid).addError('Enrollment closed');
               system.debug('date is'+myDate+2);
                system.debug('start date'+startdate);
               
            }
           
        }
        
        
     } 
    
  
    
    
    
    public static void task26B(Map<id,Student_Activities__c>  newdatamap,Map<id,Student_Activities__c>  olddatamap){
        
       
          set<id> stuidlist= new set<id>();

        if(newdatamap!=null){
        for(id sid:newdatamap.keySet()){
            stuidlist.add(newdatamap.get(sid).Student_Master__c);
            
        }
        }
        
          set<id> stuidlist1= new set<id>();

        if(olddatamap!=null){
        for(id sid:olddatamap.keySet()){
            stuidlist1.add(olddatamap.get(sid).Student_Master__c);
            
        }
        }
        
          map<id,Student_Activities__c> stuactmap= new  map<id,Student_Activities__c>([select id,name,Student_Master__c,
                                           Activity__c,Medal__c from Student_Activities__c where 
                                           Student_Master__c in :stuidlist or  Student_Master__c in :stuidlist1]);
                                        
         map<id,Student_Master__c> studata= new map<id,Student_Master__c>([select id,name,createddate,Activities_Enrolled__c,
                                                   Number_of_GoldMedals__c,Number_of_SilverMedals__c
                                                   from Student_Master__c where id in :stuidlist
                                                      or  id in :stuidlist1]);
        
        for(id sid:studata.keyset()){
              if(stuactmap.size()==0){
             studata.get(sid).Number_of_GoldMedals__c=0;
             studata.get(sid).Number_of_SilverMedals__c=0;
            studata.get(sid).Activities_Enrolled__c=0;
        }
        }
        
        for(id sid:stuactmap.keyset()){
             studata.get(stuactmap.get(sid).Student_Master__c).Number_of_GoldMedals__c=0;
             studata.get(stuactmap.get(sid).Student_Master__c).Number_of_SilverMedals__c=0;
        
        }
     
        for(id sid:stuactmap.keyset()){
            if(stuactmap.size()>0){
             studata.get(stuactmap.get(sid).Student_Master__c).Activities_Enrolled__c=stuactmap.size(); 
            }
           
         /*   if( studata.get(sid).Activities_Enrolled__c==null){
            studata.get(sid).Activities_Enrolled__c=0;
            }
            else{
              studata.get(sid).Activities_Enrolled__c=l1.size();  
            }*/
            if(stuactmap.get(sid).Medal__c=='gold'){
                studata.get(stuactmap.get(sid).Student_Master__c).Number_of_GoldMedals__c++;
            }
            else if(stuactmap.get(sid).Medal__c=='silver'){
                 studata.get(stuactmap.get(sid).Student_Master__c).Number_of_SilverMedals__c++;
            }
        }
        
        update studata.values();
            
    }
    
     public static void task27(Map<id,Student_Activities__c>  newdatamap,Map<id,Student_Activities__c> olddatamap){
     
          set<id> actnewidlist= new set<id>();

        if(newdatamap!=null){
        for(id sid:newdatamap.keySet()){
            actnewidlist.add(newdatamap.get(sid).Activity__c);
            
        }
        }
        
          set<id> actoldidlist= new set<id>();

        if(olddatamap!=null){
        for(id sid:olddatamap.keySet()){
            actoldidlist.add(olddatamap.get(sid).Activity__c);
            
        }
        }
     Aggregateresult[] aglist=[select count(Student_Master__c)act,Activity__c,participated__c from Student_Activities__c where Activity__c in :actnewidlist 
                             or  Activity__c in :actoldidlist GROUP BY Activity__c,participated__c];
         system.debug('aglist is'+aglist);
         
          map<id,Activity__c> actdata= new map<id,Activity__c>([select id,name,Deadline__c,Enrollment_Limit__c,Number_Of_Students_Enrolled__c,ActivityStartDate__c,
                                                              ActivityEndDate__c,Number_of_Students_participated__c from Activity__c 
                                                              where id in :actnewidlist or id in:actoldidlist]);
         for(id aid:actdata.keyset()){
              actdata.get(aid).Number_Of_Students_Enrolled__c=0;
             actdata.get(aid).Number_of_Students_participated__c=0;
         }
         
               map<id,integer> mapcount=new map<id,integer>(); 
           map<id,integer> mapcount1=new map<id,integer>();  
         for(AggregateResult ar:aglist){
             if(!mapcount.containsKey((string)ar.get('Activity__c'))){
                 system.debug('if block'+ar);
                 
                 mapcount.put((string)ar.get('Activity__c'), (integer)ar.get('act'));
             }
             else{
                 system.debug('else bock'+ar);
                integer count= mapcount.get((string)ar.get('Activity__c'));
                 mapcount.put((string)ar.get('Activity__c'), count+(integer)ar.get('act')); 
             }
             
             if(!mapcount1.containsKey((string)ar.get('Activity__c')))
             {
                 if((Boolean)ar.get('participated__c')==true){
                     mapcount1.put((string)ar.get('Activity__c'), (integer)ar.get('act'));
                 }
                
                
             }
         }
         system.debug('mapcount is'+mapcount);
         
         for(id actid:actdata.keySet()){
             system.debug('actid'+actid);
             actdata.get(actid).Number_Of_Students_Enrolled__c=mapcount.get(actid);
         }
         
          for(id actid:actdata.keySet()){
             system.debug('actid'+actid);
             actdata.get(actid).Number_of_Students_participated__c=mapcount1.get(actid);
         }
         
       update actdata.values();
         
        
     }
    
     
}