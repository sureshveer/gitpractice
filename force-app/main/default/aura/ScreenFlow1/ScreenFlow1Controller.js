({
	doInit : function(component, event, helper) {
	      
        
         var action = component.get("c.getContacts");
          
        
          action.setCallback(this, function(response) {
            // hide spinner when response coming from server 
            
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
              component.set("v.conobj",storeResponse);
                
               component.set("v.view1",true);
                 component.set("v.view2",false);
                 component.set("v.view3",false);
                component.set("v.view4",false);
                component.set("v.view5",false);
                
                 component.set("v.card1",true);
                 component.set("v.card2",false);
                 component.set("v.card3",false);
                 component.set("v.card4",false);
            }
            else if(state === 'INCOMPLETE'){
               // alert('Something is missing');   
            }
                else if(state === 'ERROR'){
                 //   alert('Insertion Failed');   
                }
        });
        
     
        
        
        var x=10000;
        var  count=0;
       
         window.setInterval(
            $A.getCallback(function() { 
                
                
                //alert(count);
              
               count= helper.callApexMethod(component,helper,x,count);
                
            }), x
        ); 
        
        
         var y=1000;
        
        var a=0;
         window.setInterval(
            $A.getCallback(function() { 
               a= helper.settingtime(component,helper,a,x);
               
            }), y
        ); 
        
        $A.enqueueAction(action);
	},
})