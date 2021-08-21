({
	evenorodd : function(component, event, helper) {
		var x=component.find('input1').get('v.value');
        if(x%2==0){
            component.set('v.result',x+'is even');
        }
        else{
           component.set('v.result',x+'is odd'); 
        }
	}
})