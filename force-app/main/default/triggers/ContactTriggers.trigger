trigger ContactTriggers on Contact(before insert,before delete,after insert,after delete,after update,Before update) {

     //Triggertask6
    //Before delete
     if(Trigger.isBefore && Trigger.isdelete){ 
  //  TriggersTasks.BeforeDeletetriggertask6(Trigger.old);
    }
    
    
    
    //Triggertask17
    //before insert
     if(Trigger.isBefore && Trigger.isinsert){ 
 //   TriggersTasks.BeforeInserttriggertask17(Trigger.new);
    }
    
    //Triggertask18,14,9
    //after insert
     if(Trigger.isAfter && Trigger.isinsert){ 
         

         //  TriggersTasks.AfterInserttriggertask18(Trigger.new); 
       //  TriggersTasks.AfterInserttriggertask14(Trigger.new);
       //   TriggersTasks.AfterInserttriggertask9(Trigger.new);
         
    }
    
    //Trigger task14
    //after update
      if(Trigger.isAfter && Trigger.isUpdate){ 
  //   TriggersTasks.AfterInserttriggertask14(Trigger.new);
      }
    
    
    
     //Triggertask19
    //after delete
     if(Trigger.isAfter && Trigger.isdelete){ 
   // TriggersTasks.AfterDeletetriggertask19(Trigger.old);
    }
    
    //Live coding Trigger task5 july10
    //after update and Before update

       
     if(Trigger.isAfter && Trigger.isupdate ){ 
          if(! TriggersTasks.selected){
             TriggersTasks.selected=true;
          //  TriggersTasks.Afterupdatelivecodingtask4july10(Trigger.newmap,Trigger.oldmap);
           
         }
    }
    
      if(Trigger.isBefore && Trigger.isupdate ){ 
        // TriggersTasks.Beforeupdatelivecodingctask4july10(Trigger.newmap,Trigger.oldmap);
      }
    //Live coding Trigger task10 july15
    //after insert
    //
    if(Trigger.isAfter && Trigger.isinsert){ 
     TriggersTasks.Afterinsertlivecodingctask10july15(Trigger.newmap);
    
    }
    

}