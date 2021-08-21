trigger Triggertask26_LCJune22 on Opportunity (after update) {

    if(Trigger.isafter){
        if(Trigger.isupdate){
            ApexLCtask26.task26(Trigger.new);
        }
    }
}