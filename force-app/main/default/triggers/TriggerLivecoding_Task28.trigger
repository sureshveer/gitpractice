trigger TriggerLivecoding_Task28 on Lead (after insert) {

     if(Trigger.isafter){
        if(Trigger.isinsert){
          // livecoding_June23.task28(Trigger.new); 
        }
    }
}