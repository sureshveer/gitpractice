public class LCJune20task21{

    
    public static void concreate(map<Id,Integer> createcon){
        
       Set<Id> Accountid=createcon.keyset();
        List<contact> conlist= new List<contact>();
        for(Id aid:Accountid){
            for(integer i=0;i<createcon.get(aid);i++){
                conlist.add(new contact(accountid=aid,lastname='kumar'+i,email='svsuresh8@gmail.com'));
            }
        
    }
        insert conlist;
        system.debug('conlist is'+conlist);
    }
    
}