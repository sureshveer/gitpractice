({
	add: function(component, event, helper) {
        console.log("checking...in jscontroller");
       
     
        var cmpEvent = component.getEvent("cmpEvent");
        cmpEvent.setParams({
            "message" : "A component event fired me. " +
            "It all happened so fast. Now, I'm here!" });
        cmpEvent.fire();

	 var in1=component.get("v.input1");
         var in2=component.get("v.input2");
      //   alert('alert the record'+in1);
       //  alert('alert the record'+in2);
       helper.fetchaddition(component,in1,in2); 
	}
})