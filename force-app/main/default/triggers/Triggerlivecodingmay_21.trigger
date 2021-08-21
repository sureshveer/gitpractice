trigger Triggerlivecodingmay_21 on Contact (after update) {

     //After Update
    if(Trigger.isafter && Trigger.isupdate){
        LiveCodingMay_21.task6(Trigger.New);
    }
    
}