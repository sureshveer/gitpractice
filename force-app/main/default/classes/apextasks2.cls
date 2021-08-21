public class apextasks2 {
    
    
    public static void task1(List<string> industrylist,List<string> ratinglist){
        if(industrylist!=null && ratinglist!=null){
            List<Account> acct=[select id,name from Account where account.rating in :ratinglist or account.industry in :industrylist ];
            system.debug('account details are'+acct);
            system.debug('account size is'+acct.size());
        }
    }
    
    public static void task2(List<string> industrylist,List<string> ratinglist){
        Set<Id> conidlist=new Set<Id>();
        List<Contact> con=[select Accountid from Contact];
        for(Contact c:con){
            conidlist.add(c.AccountId);
        }
        
        if(industrylist!=null && ratinglist!=null){
            List<Account> acct=[select id,name,(select name from contacts) from Account where id in :conidlist 
                                and  (account.rating in :ratinglist or account.industry in :industrylist) ];
            system.debug('account details are'+acct);
            system.debug('account size is'+acct.size());
            //logic using nested for loops
            //   for(Account a:acct){
            //     for(Contact c:a.contacts){
            //       system.debug('***********************************************');   
            //        system.debug('account details are'+a);
            //      system.debug('contact details reated to account are'+c);
            //    system.debug('Account'+a.Name+'have '+a.contacts.size()+'contacts');
            //  system.debug('***********************************************');
            
            //}
            // }
            
            map<Account,List<contact>> m=new map<Account,List<Contact>>();
            for(Account a:acct){
                m.put(a, a.contacts);
            }
            Set<Account> s=m.keyset();
            for(Account a:s){
                system.debug('Account is+' +a +'contacts are'+m.get(a)); 
                system.debug('Account'+a.Name+'have '+m.get(a).size()+'contacts');
            }
        }
    }
    
    
    public static void task3(List<string> industrylist,List<string> ratinglist){
        Set<Id> conidlist=new Set<Id>();
        List<Contact> con=[select Accountid from Contact];
        for(Contact c:con){
            conidlist.add(c.AccountId);
        }
        
        Set<Id> oppidlist=new Set<Id>();
        List<Opportunity> opp=[select Accountid from Opportunity];
        for(Opportunity o:opp){
            oppidlist.add(o.AccountId);
        }
        
        if(industrylist!=null && ratinglist!=null){
            List<Account> acctconlist=[select id,name,(select name from contacts) from Account where id in :conidlist 
                                       and  (account.rating in :ratinglist or account.industry in :industrylist) ];
            
            List<Account> acctopplist=[select id,name,(select name from opportunities) from Account where id in :conidlist 
                                       and  (account.rating in :ratinglist or account.industry in :industrylist) ];
            
            //   system.debug('account details are'+acctconlist);
            //   system.debug('account size is'+acctconlist.size());
            
            map<Account,List<contact>> m=new map<Account,List<Contact>>();
            for(Account a:acctconlist){
                m.put(a, a.contacts);
            }
            
            map<Account,List<opportunity>> m1=new map<Account,List<opportunity>>();
            for(Account a:acctopplist){
                m1.put(a, a.opportunities);
            }
            //printing map m
            system.debug('contacts are');
            Set<Account> s=m.keyset();
            for(Account a:s){
                system.debug('Account is+' +a +'contacts are'+m.get(a)); 
                system.debug('Account'+a.Name+'have '+m.get(a).size()+'contacts');
            }
            
            system.debug('opportunities are');
            //printing map m1
            Set<Account> s1=m1.keyset();
            for(Account a:s1){
                system.debug('Account is+' +a +'opportunities are'+m.get(a)); 
                system.debug('Account'+a.Name+'have '+m1.get(a).size()+'opportunities');
            }
            
            
            
        }
    }
    
    public static void task5(List<string> countrylist,List<string> citylist){
        
        if(countrylist!=null && citylist!=null){
            List<Account> acct=[select id,name from Account where account.BillingCountry in :countrylist or account.Billingcity in :citylist ];
            for(Account a :acct){
                system.debug('Accounts with country '+a.BillingCountry +'and city'+a.BillingCity+'is'+acct);
            }
        }
        
    }
    
    public static void task6(){
        Set<Id> oppidlist=new Set<Id>();
        List<Opportunity> opp=[select Accountid from Opportunity];
        for(Opportunity o:opp){
            oppidlist.add(o.AccountId);
        }         
        List<Account> acct=[select No_of_Opportunities__c,(select name from opportunities)	 from account where id in:oppidlist ];
        system.debug('account details are'+acct);
        for(Account a:acct){
            a.No_of_Opportunities__c=a.opportunities.size();
        }
        update acct;
        for(Account a:acct){
            system.debug('No of opportunities are'+ a.No_of_Opportunities__c);
        }
    }
    
    
    public static void task7(){
        Set<Id> conidlist=new Set<Id>();
        List<Contact> con=[select Accountid from Contact];
        for(Contact c:con){
            conidlist.add(c.AccountId);
        }
        
        List<Account> acct = [select id, name,Billingcity,(select mailingcity from  contacts) from account where id in:conidlist];
        
        system.debug('Before updating account with contact details are'+acct);
        
        for(Account a:acct){
            for(contact c:a.contacts){
                c.mailingcity=a.BillingCity;
                system.debug('account billing city is'+a.BillingCity+'and contact mailing city is'+c.MailingCity);
            }
            update acct;
        }
        system.debug('Before updating account with contact details are'+acct);
    }
    
    public static void task8(integer x1,integer x2){
        integer sum=x1+x2;
        system.debug('sum of numbers '+x1+'and'+x2+'is'+sum);
    }
    public static void task9(List<integer> numbers){
        integer sum=0;
        for(integer i=0;i<numbers.size();i++){
            sum =sum+numbers.get(i);
        }
        system.debug('sum of numbers in list is'+sum);
    }
    
    public static void task10(){
        
        List<Account> acct=[select id,name,industry from Account];
        system.debug('account size is'+acct.size());
        for(Account a:acct){
            if(a.Industry=='Énergy'){
                system.debug('Account name is'+a.Name+'account industry is'+a.Industry);
            }
            else if(a.Industry=='Banking'){
                system.debug('Account name is'+a.Name+'account industry is'+a.Industry);
            }
            else if(a.Industry=='agriculture'){
                system.debug('Account name is'+a.Name+'account industry is'+a.Industry);
            }
            else if(a.Industry=='apparel'){
                system.debug('Account name is'+a.Name+'account industry is'+a.Industry);
            }
            else{
                system.debug('No account'+'account industry is'+a.Industry);
            }
        }
        
        
    }
    
    public static void task11(List<String> ratinglist,List<String> industrylist){
        
        List<Account> acct=[select id,name,industry,rating from Account where account.rating in :ratinglist or account.industry in :industrylist ];
        for(Account a:acct){
            if(a.Industry=='Energy' && (a.Rating=='Hot' || a.Rating=='cold' || a.Rating=='warm')){
                system.debug(a.industry+'-'+a.Name+'-'+a.Rating);
            }
        }
        
    }
    
    public static void task12(){
        List<Account> acct=[select id,name,(select name from contacts) from Account];
        for(Account a:acct){
            system.debug(a.name+'-'+a.contacts.size());
        }
        
    }
    
    public static void task13(List<String> a){
        
        integer length;
        for(integer i=0;i<a.size();i++){
            length=a[i].length();//length stores length of a each string based on index
            system.debug(a[i]+'length is'+length);
        }
    }
    
    //program 14 not understood
    
    
    public static void task15(String country){
        
        //sub task1
        map<String,String> m= new map<String,String>();
        m.put('india','New Delhi');
        m.put('us','New York');
        m.put('uk','London');
        m.put('sri lanka','Colombo');
        if(m.containsKey(country)){//checks given country is in our map or not
            System.debug(country +'capital city is' +m.get(country));
        }
        else{
            System.debug(country+'is not listed in map');
            
        }
        
        system.debug('-----------------------------separating two logics--------------------------------------------------------');
        
        //sub task2
        List<Account> acct= [select Billingcity,Billingcountry  from account];
        map<String,String> m1= new map<String,String>();
        for(Account a:acct){
            m1.put(a.BillingCountry,a.BillingCity);
        }
        if(m1.containsKey(country)){//checks given country is in our map or not
            System.debug(country +'capital city is' +m1.get(country));
        }
        else{
            System.debug(country+'is not listed in map');
            
        }
        
    }
    
    public static void task17(string sentence){
        
        string[] s1=sentence.split(' ');
        map<String,integer> m= new map<String,integer>();
        
        for(String s:s1){
            if(m.containsKey(s)){
                m.put(s,m.get(s)+1);
            }
            else{
                m.put(s,1);
            }
        }
        
        
        Set<string> s2= m.keySet();
        for(string s3:s2){
            system.debug(s3 +'is counted for'+m.get(s3)+'times');
        }
        
        for(string s4:s1){
            system.debug('Number of characters in '+s4+'is'+s4.length());
        }
    }
    
    
    
}