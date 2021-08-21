trigger LivecodingJuly27task14 on Case (after  insert,before insert,after update,before update,before delete,after delete) {

    if(Trigger.isafter){
        if(Trigger.isinsert|| Trigger.isafter){
            if(!Triggercodes.selected){
                Triggercodes.selected=true;
            Triggercodes.afterinserttask14(Trigger.new ,Trigger.oldmap);
            }
        }
    }
}