trigger trigger7 on Account (before delete) {

    for(Account a:Trigger.old){
    integer count=[select count() from contact where contact.account.name=:a.name];
        if(count>=3){
            a.adderror('cannot delete account');
        }
       }
    
}