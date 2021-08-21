trigger trigger1 on Account (before insert,before update) {

    for(Account a:Trigger.new)
    {
        if(Trigger.isBefore && Trigger.isinsert){
            if(a.Description ==null){
                a.adderror('Description field cannot be null');
                system.debug('default value');
            }
        }
        else if(trigger.isBefore && trigger.isupdate){
            if(a.Description.length()<=10){
                a.Description='This is'+' '+a.name;
                system.debug('Default value');
                
            }
        }
    }
}