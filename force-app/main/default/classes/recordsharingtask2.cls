public  class recordsharingtask2 {
    
    public static void getuserrecords(List<account> acclist){
      /*  List<String> l1=new List<String>();
         for(Account a:acclist){
            l1.add(a.sharerecords__c);
        }
       string s=userinfo.getName();
    List<Accountshare> acclist1=[select id from accountshare where account.sharerecords__c=:userinfo.getName()];
        List<id> acclist2=new List<id>();
        for(Accountshare a:acclist1){
            acclist2.add(a.accountid);
        }
        List<Account> ac1=[select id,name from account where id in :acclist2];
        Accountshare ac= new Accountshare();*/
      //  ac.accesslevel='read';

        system.debug('acclist'+acclist);
                system.debug('acclist size'+acclist.size());
        
        User user = [Select Id From User Where Name =:userinfo.getName() ];
		List<Accountshare> accShareList = new List<Accountshare>();
		for(Account accobj:acclist){
            system.debug('sharerecords__c'+accobj.sharerecords__c);
            system.debug(userinfo.getName()+'user');
            string[] sahrerec=accobj.sharerecords__c.split(';');
            system.debug('sahrerec'+sahrerec);
                for(string sr:sahrerec){
			if(sr == userinfo.getName()){
                system.debug('if inside');
				Accountshare objShare = new Accountshare();
				objShare.AccountId = accobj.Id;
				objShare.UserOrGroupId = user.Id;
                //you change access level as per requirement
                objShare.AccountAccessLevel = 'read';
                objShare.OpportunityAccessLevel='read';
				//objShare.RowCause = 'Value more than 100';
				accShareList.add(objShare);
			}
                }
		}
		if(accShareList.size() > 0){
			try{
                system.debug('accShareList'+accShareList);
                system.debug('size'+accShareList.size());
				insert accShareList;
			}catch(Exception ex){
				System.debug(ex);
			}
		}
    }

    
}