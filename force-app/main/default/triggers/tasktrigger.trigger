trigger tasktrigger on Opportunity (before insert,before update,before delete,after insert,after update,after delete) {

    if(Trigger.isafter && Trigger.isupdate){
        apextrigger.task1(Trigger.new);
    }
    
}