({
	objdetails : function(component, event, helper) {
		
        var action=component.get("c.getaccdetails");

        action.setCallback(this,function(response){
            var responsevalue=response.getReturnValue();
           // alert(response.getReturnValue());
            console.log("responsevalue",responsevalue);
           // component.set('v.contactlist',responsevalue);
            component.set("v.accobj",responsevalue);
           
        });
        
          var action1=component.get("c.getcondetails");

        action1.setCallback(this,function(response){
            var responsevalue1=response.getReturnValue();
           // alert(response.getReturnValue());
            console.log("responsevalue1",responsevalue1);
           // component.set('v.contactlist',responsevalue);
            component.set("v.conobj",responsevalue1);
           
        });
        
         var action2=component.get("c.getoppdetails");

        action2.setCallback(this,function(response){
            var responsevalue2=response.getReturnValue();
           // alert(response.getReturnValue());
            console.log("responsevalue2",responsevalue2);
           // component.set('v.contactlist',responsevalue);
            component.set("v.oppobj",responsevalue2);
           
        });
        
        
         var action3=component.get("c.getcasedetails");

        action3.setCallback(this,function(response){
            var responsevalue3=response.getReturnValue();
           // alert(response.getReturnValue());
            console.log("responsevalue3",responsevalue3);
           // component.set('v.contactlist',responsevalue);
            component.set("v.caseobj",responsevalue3);
           
        });
        
        $A.enqueueAction(action,false);
         $A.enqueueAction(action1,false);
         $A.enqueueAction(action2,false);
         $A.enqueueAction(action3,false);
    },
})