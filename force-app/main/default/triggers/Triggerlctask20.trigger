trigger Triggerlctask20 on Case (before insert, after insert,Before Update,After Update,After Delete,Before Delete) {

     if(Trigger.isafter){
        if(Trigger.isinsert || Trigger.isUpdate || Trigger.isdelete){
            if(!apexlcjuly29.selected){
                apexlcjuly29.selected=true;
            apexlcjuly29.task20(Trigger.newmap,Trigger.oldmap);
            }
        }
    }
    
    if( Trigger.isBefore){
        if( Trigger.isUpdate){
             if(!apexlcjuly29.selected){
                apexlcjuly29.selected=true;
           // apexlcjuly29.task20(Trigger.newmap,Trigger.oldmap);
            }
        }
    }
}