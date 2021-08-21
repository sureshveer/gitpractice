({
	helpersample : function(component,name) {
        
       
        console.log("helpername is"+component.get("v.name"));
        
        var action= component.get("c.sample");
        action.setParams({"v.name":name});
        console.log("method name is"+component.get("v.name"));
        
        action.setCallback(this,function(response){
            console.log("callback name is"+component.get("v.name"));
            var state=response.getState();
            console.log("state is"+state);
            if(state=="SUCCESS"){
                component.set("v.result",response.getReturnValue());
                console.log("if name is"+component.get("v.result"));
                
            }
            else{
                alert("error");
            }
            
            
            
            
        });
        
        
        
        
        
        
        
        
        
        
        
        
	}
})