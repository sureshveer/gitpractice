({
	Search : function(component, event, helper) {
        var searchField = component.find('searchField');
		var action = component.get("c.fetchEmployeeDetails");
    action.setParams({
        'empName': component.get("v.searchKeyword")
    });
        
        action.setCallback(this, function(response) {
       // hide spinner when response coming from server 
        
        var state = response.getState();
        if (state === "SUCCESS") {
            var storeResponse = response.getReturnValue();
            alert(storeResponse+'response is');
            component.set('v.AccDetails',storeResponse);
        }
         else if(state === 'INCOMPLETE'){
                alert('Something is missing');   
            }
            else if(state === 'ERROR'){
                alert('Insertion Failed');   
            }
        });
        $A.enqueueAction(action);
    },
    
    
    saveempattendance : function(component, event, helper) {
         var Day1 = component.find('day1').get("v.value");
          var Day2 = component.find('day2').get("v.value");
         var Day3 = component.find('day3').get("v.value");
         var Day4 = component.find('day4').get("v.value");
         var Day5 = component.find('day5').get("v.value");
         var Day6 = component.find("day6").get("v.value");
        var Dayslist=[Day1,Day2,Day3,Day4,Day5,Day6];
    alert(Dayslist+'suresh');
    
    },         
})