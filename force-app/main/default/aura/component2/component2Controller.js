({
	sample : function(component, event, helper) {
        console.log("name is"+component.get("v.name"));
		helper.helpersample(component,component.get("v.name"));
	}
})