trigger Triggerlcjuly28 on Asset (before insert, after insert,Before Update,After Update) {

    if(Trigger.isafter){
        if(Trigger.isinsert || Trigger.isUpdate){
            apexlcjuly28.task17(Trigger.newmap,Trigger.oldmap);
        }
    }
}