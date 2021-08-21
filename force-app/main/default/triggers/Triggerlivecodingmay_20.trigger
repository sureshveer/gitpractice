trigger Triggerlivecodingmay_20 on Opportunity (after update) {

    //After Update
    if(Trigger.isafter && Trigger.isupdate){
        LiveCodingMay_20.task1(Trigger.New);
    }
    
}