({
    /*
	doinit : function(component, event, helper) {
		
        var action=component.get("c.getconlist");
    
    /*    action.setparams({
            
        });
        action.setCallback(this,function(response){
            var responsevalue=response.getReturnValue();
            alert(response.getReturnValue());
            console.log("responsevalue",responsevalue);
           // component.set('v.contactlist',responsevalue);
            component.set("v.contactlist",responsevalue);
           
        });
        $A.enqueueAction(action,false);
	}*/
    
    dosearch : function(component, event, helper) {
             
         component.set('v.columns', [
            {label: 'name', fieldName:'Name', type: 'text'},
            {label: 'Email', fieldName:'Email', type: 'text'}
             
             ]);
        
    var test1=component.find('test');
    var test2=test1.get('v.value');
    alert('test'+test2);
    var action=component.get("c.getconlistname");
    
    action.setParams({ name:test2 });
    
 action.setCallback(this,function(response){
            var responsevalue=response.getReturnValue();
            alert(response.getReturnValue());
            console.log("responsevalue",responsevalue);
           // component.set('v.contactlist',responsevalue);
            component.set("v.contactlist",responsevalue);
           
        });
        $A.enqueueAction(action,false);


    },
    
     handleChange : function(component, event, helper) {        
            var lookupId = event.getParam("value")[0];
        },
        handleSuccess : function(component, event, helper) {
            var record = event.getParam("response");
            var apiName = record.apiName; // returns "Case"
            var caseId = record.id; // returns the Id of the new record
        },
    /*
    doInit : function(cmp) {
    	// Initialize input select options
        var opts = [
            { "class": "optionClass", label: "Option1", value: "opt1", selected: "true" },
            { "class": "optionClass", label: "Option2", value: "opt2" },
            { "class": "optionClass", label: "Option3", value: "opt3" }

        ];
        cmp.find("InputSelectDynamic").set("v.options", opts);
        
        
    },*/
    
    
})