trigger updateNoOfContacts on Account (before insert,before update) {

    if(Trigger.isbefore){
        if(Trigger.isinsert || Trigger.isupdate){
        apexupdateNoOfContacts.task22(Trigger.new);
    }
    }
}