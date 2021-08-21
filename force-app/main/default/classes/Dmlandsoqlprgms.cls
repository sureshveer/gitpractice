public class Dmlandsoqlprgms{


    //standard object account related tasks
    
   public static List<Account> task1(){
   
       List<Account> act = [select name, Phone,AnnualRevenue,industry from Account where account.industry='energy'];
   
    
       for(integer i=0;i<act.size();i++){
        system.debug('Name is'+act.get(i).name+' '+'Annual Revenue is'+act.get(i).AnnualRevenue);
        }
            
        return act;
    }

 
    //method to retrive account name and no of employees bsed on industry and no of employees 
    public static List<account> task2(){
        List<account>  act = [select name, Phone,type,AnnualRevenue,industry,NumberOfEmployees from Account where Account.industry='energy' or Account.industry='education' or Account.NumberOfEmployees>=5000];
        for(integer i=0;i<act.size();i++){
            system.debug('Name is'+act.get(i).name+' '+'NUmber of Emplloyees are'+act.get(i).NumberOfEmployees);
          }
        return act;
     }          


     public static List<Account> task3(){
         List<account>  act = [select name, Phone,type,AnnualRevenue,industry from Account where Account.type='Customer - Direct' or Account.AnnualRevenue < 25000 or
                                                                    Account.industry='Apparel' or Account.industry='energy' or Account.industry='consulting'   ];
       
         system.debug('Account type is customer direct');
        for(integer i=0;i<act.size();i++){
           system.debug('Name is'+act.get(i).name+' '+'Annual Revenue is'+act.get(i).AnnualRevenue+' '+'Type is'+act.get(i).type+' '+'industry is'+act.get(i).industry);
          }
         return act;
      
    }


   public static set<String> task4(){
        List<account>  act = [select industry from Account];
        set<string> act1= new set<string>();
      for(integer i=0;i<act.size();i++){
          act1.add(act.get(i).industry);
          }
       for(String a:act1){
           system.debug('unique  industry values are'+a);
       }
      return act1;
    }


   public static integer task5(string industry){
        integer count = [select count() from Account where account.industry=:industry];
system.debug('no of records with industry'+industry +'is '+count);
      return count;
  }



   public static map<string,Integer> task6(string industry){
        integer count = [select count() from Account where account.industry=:industry];

map<string,integer> m= new map<string,integer>();
m.put(industry,count);

set<string> s1=m.keyset();

for(string a:s1){
system.debug('key is '+a+' '+'value is'+m.get(a));
}
//system.debug('no of records with industry'+industry +'is '+count);

return m;
  }


   public static List<Account> task7(){
       List<Account> act = [select name from Account where account.industry='energy' limit 4];
for(integer i=0;i<act.size();i++){
system.debug('Account name is'+act.get(i).name);
}
return act;
}

public static List<Account> task8(){
       List<Account> act = [select name from Account where account.name like 'S%'];
for(integer i=0;i<act.size();i++){
system.debug('Account name is'+act.get(i).name);
}
return act;
}

public static List<Account> task9(){
       List<Account> act = [select name from Account where account.name like '%A'];
for(integer i=0;i<act.size();i++){
system.debug('Account name is'+act.get(i).name);
}
return act;
}


public static List<Account> task10(){
       List<Account> act = [select name,phone,type,industry,AnnualRevenue,NumberOfEmployees from Account where (account.NumberOfEmployees>=5000 and account.NumberOfEmployees<=150000) or account.AnnualRevenue>=500000];
    for(integer i=0;i<act.size();i++){
  system.debug('Name is'+act.get(i).name+' '+'Annual Revenue is'+act.get(i).AnnualRevenue+' '+'Type is'+act.get(i).type+' '+'industry is'+act.get(i).industry+' '+'no of employees'+act.get(i).NumberOfEmployees);
}
return act;
}


public static Account task11(){

Account act= new Account(name='suresh',phone='9494001944',type='customer direct');
insert act;

return act;
}

public static Account task12(){

Account act= new Account();
act.name='sureshkumar';
act.phone='9494001944';
act.type='customer direct';
insert act;
return act;
}


public static List<Account> task13(integer x){

List<account> act= new List<Account>();
for (integer i=1;i<=x;i++){
act.add(new Account(name='suresh'+i,phone='9494001944',type='customer direct'));
}
insert act;
return act;
}

public static List<Account> task14(integer x){
List<account> act= new List<Account>();
for (integer i=0;i<=x;i++){
if(math.mod(i,2)==0){
act.add(new Account(name='suresh'+i,industry='consulting',NumberOfEmployees=x+10));

}
else{
act.add(new Account(name='suresh'+i,industry='electronics',AnnualRevenue=(x-1)*100000));

}
}
    insert act;
    return act;
}


public static List<Account> task15(){

    List<Account> act = [select name,phone,type,industry,NumberOfEmployees from Account where account.industry='energy'];

system.debug('before updating list of account records are'+act);
for (Account acto:act){
acto.NumberOfEmployees=acto.NumberOfEmployees+1;
}

update act;
system.debug('after updating list of account records are'+act);
return act;
}


public static List<Account> task16(){
         List<Account> act= new List<Account>();
     act = [select name,phone,type,industry,NumberOfEmployees,AnnualRevenue from Account where account.industry='energy' or account.industry='consulting'];

system.debug('before updating list of account records are'+act);
for (Account acto:act){
    system.debug('Annual Revenue is'+acto.AnnualRevenue);
    if(acto.AnnualRevenue==null){
        system.debug('will not update annual revenue');
        // acto.AnnualRevenue=acto.AnnualRevenue-1000;
    }
    else{
        acto.AnnualRevenue=acto.AnnualRevenue-1000;
    }
acto.NumberOfEmployees=acto.NumberOfEmployees+10;
}
update act;
system.debug('after updating list of account records are'+act);
return act;
}

public static List<Account> task17(){

    List<Account> act = [select name,phone,type,NumberOfEmployees from Account where account.NumberOfEmployees>1  or account.NumberOfEmployees=null];
  
  for(integer i=0;i<act.size();i++){
    system.debug('before updating list of account records are'+act.get(i).NumberOfEmployees);
    }
   
 for (Account acto:act){
       // system.debug('No of employees'+acto.NumberOfEmployees);
        if(acto.NumberOfEmployees==null){
            acto.NumberOfEmployees=10;
            
        }
        else if(acto.NumberOfEmployees != 0 || acto.NumberOfEmployees!=null){
           acto.NumberOfEmployees=acto.NumberOfEmployees+10;
        }
        else{
            system.debug('will do nothing');
        }


}

update act;
    for(integer i=0;i<act.size();i++){
system.debug('after updating list of account records are'+act.get(i).NumberOfEmployees);
    }
 return act;
}

public static List<Account> task18(){

    List<Account> act = [select name,phone,type,industry from Account where account.AnnualRevenue=0 or account.AnnualRevenue=null];
delete act;
 return act;   
}


public static List<Account> task19(){


    List<Account> act = [select name from Account where account.name like '%0' or account.name like '%1' or account.name like '%2' or
                        account.name like '%3' or account.name like '%4' or account.name like '%5' or account.name like '%6' or 
                        account.name like '%7' or account.name like '%8' or account.name like '%9'];

delete act;
    return act;

}

public static List<Account> task20(integer x){
List<Account> act= new List<Account>();
for (integer i=1;i<=x;i++){
 act.add(new Account(name='suresh'+i,phone='9494001944',type='direct'));

}
upsert act;
return act;
}

}