({
	fetchaddition : function(component,input1,input2) {
		var action=component.get("c.add");
        action.setParams({"input1":input1,"input2":input2
                          });
        console.log(input2+"in1"+input1);
     
        action.setCallback(this,function(response) {
             
           // alert("callback");
            console.log("response is"+response);
                           var state=response.getstate();
            console.log("state is"+state);	
        if(state=="success"){
           
            component.set("v.result",response.getreturnvalue());
             console.log("result is"+component.get("v.result"));
        }
        else{
            alert("error");
        }
                           });
                         
         $A.enqueueAction(action);                 
        
	}
})