trigger trigger6 on Contact (before delete) {

    for(Contact c:Trigger.old){
 //       List<contact> deletecontact=[select name,phone,contact.Account.Name,title from contact];
   //     for(Contact c1:deletecontact){
            if(c.Accountid!=null){
             c.adderror('cannot delete  contact');
            }
            
        }
    
    
}