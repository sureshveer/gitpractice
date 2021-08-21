trigger TriggerLivecoding_Task27 on Opportunity (after insert,Before insert) {

     if(Trigger.isBefore){
        if(Trigger.isinsert){
           livecoding_June23.task27_1(Trigger.new);
        }
    }
    
    
    if(Trigger.isafter){
        if(Trigger.isinsert){
           livecoding_June23.task27(Trigger.new);
        }
    }
    
}