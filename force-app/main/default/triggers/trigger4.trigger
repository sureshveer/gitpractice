trigger trigger4 on Account (before insert) {
    
    for(Account a:Trigger.new){
          List<Account> accountlist= [select name,phone from account];
        for(Account act:accountlist){
            if(act.name==a.Name){
                a.adderror('record already exist with this name');
                system.debug('record already exist');
            }
        }
    }

}