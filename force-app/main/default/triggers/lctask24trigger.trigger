trigger lctask24trigger on Opportunity(After insert,After update) {

    if(Trigger.isAfter) {
        if(Trigger.isupdate || Trigger.isinsert){
        ApexLCTask24.task24(Trigger.new);
    }
    }
}