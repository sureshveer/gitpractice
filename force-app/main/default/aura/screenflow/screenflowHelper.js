({
    settingtime : function (component,helper,a,x){   
        
        a=a+1;
        var b=x/1000;
        if(a==b){
            
            
            a=0;
        }
        component.set("v.setint",a);
        return a;
        
        
    },
    
    
    callApexMethod : function (component,helper,x,count){   
        
        var action = component.get("c.getopportunity");
        
        
        count++;
        
        
        action.setCallback(this, function(response) {
            // hide spinner when response coming from server 
            
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                component.set("v.oppobj",storeResponse);
                
                if(count==1){
                    
                    component.set("v.card1",true);
                    component.set("v.card2",false);
                    component.set("v.card3",false);
                    component.set("v.card4",false);
                    
                    component.set("v.view1",false);
                    component.set("v.view2",true);  
                    component.set("v.view3",false);
                    component.set("v.view4",false);
                    component.set("v.view5",false);
                }
            }
            else if(state === 'INCOMPLETE'){
                // alert('Something is missing');   
            }
                else if(state === 'ERROR'){
                    //   alert('Insertion Failed');   
                }
        });
        
        /*
         
         window.setInterval(
            $A.getCallback(function() { 
                if(count==1){
                   
                helper.callApexMethod1(component,helper,x,count);
                }
            }), x
        ); */
        
        //card1
        if(count==2){
            component.set("v.view1",false);
            component.set("v.view2",false);           
            component.set("v.view3",true);
            component.set("v.card1",true);
            component.set("v.card2",false);
            component.set("v.card3",false);
            component.set("v.card4",false);           
            component.set("v.view4",false);
            component.set("v.view5",false);
        }
        if(count==3){
            component.set("v.view1",false);
            component.set("v.view2",false);
            component.set("v.view3",false);
            component.set("v.view4",true);
            component.set("v.card1",true);
            component.set("v.card2",false);
            component.set("v.card3",false);
            component.set("v.card4",false);
            component.set("v.view5",false);
        }
        if(count==4){
            component.set("v.view1",false);
            component.set("v.view2",false);
            component.set("v.view3",false);
            component.set("v.view4",false);
            
            component.set("v.view5",true);
            component.set("v.card1",true);
            component.set("v.card2",false);
            component.set("v.card3",false);
            component.set("v.card4",false);
        }
        
        //card2
        if(count==5){
            component.set("v.view2",false);
            component.set("v.view3",false);
            
            
            component.set("v.view1",true);
            component.set("v.card1",false);
            component.set("v.card2",true);
            component.set("v.card3",false);
            component.set("v.card4",false);
        }
        
        if(count==6){
            component.set("v.view1",false);
            component.set("v.view3",false);
            
            
            component.set("v.view2",true);
            component.set("v.card1",false);
            component.set("v.card2",true);
            component.set("v.card3",false);
            component.set("v.card4",false);
        }
        if(count==7){
            component.set("v.view2",false);
            component.set("v.view1",false);
            component.set("v.view3",true);
            component.set("v.card1",false);
            component.set("v.card2",true);
            component.set("v.card3",false);
            component.set("v.card4",false);
        }
        
        //card3
        //
        if(count==8){
            component.set("v.view2",false);
            component.set("v.view3",false);
            
            
            component.set("v.view1",true);
            component.set("v.card1",false);
            component.set("v.card2",false);
            component.set("v.card3",true);
            component.set("v.card4",false);
        }
        
        if(count==9){
            component.set("v.view1",false);
            component.set("v.view3",false);
            
            
            component.set("v.view2",true);
            component.set("v.card1",false);
            component.set("v.card2",false);
            component.set("v.card3",true);
            component.set("v.card4",false);
        }
        
        if(count==10){
            component.set("v.view2",false);
            component.set("v.view1",false);
            
            
            component.set("v.view3",true);
            component.set("v.card1",false);
            component.set("v.card2",false);
            component.set("v.card3",true);
            component.set("v.card4",false);
        }
        
        //card4
        if(count==11){
            component.set("v.view2",false);
            component.set("v.view1",true);
            component.set("v.card1",false);
            component.set("v.card2",false);
            component.set("v.card3",false);
            component.set("v.card4",true);
        }
        
        
        
        
        if(count==12){
            component.set("v.view1",false);
            component.set("v.view2",true);
            component.set("v.card1",false);
            component.set("v.card2",false);
            component.set("v.card3",false);
            component.set("v.card4",true);
        }
        if(count==13) {
            helper.mainmethod(component,helper,x,count);
        }
        
        
        
        $A.enqueueAction(action);
        
        return count;
        
    },
    mainmethod : function (component,helper,x,count){  
        var action = component.get("c.doInit");
        $A.enqueueAction(action);
        
    }
    
    //previous code
    /* 
    callApexMethod1 : function (component,helper,x,count){  
        component.set("v.view1",false);
         component.set("v.view2",false);
        if(count==1){
         component.set("v.view3",true);
             component.set("v.card1",true);
             component.set("v.card2",false);
             component.set("v.card3",false);
             component.set("v.card4",false);
        }
         component.set("v.view4",false);
         component.set("v.view5",false);
          
        window.setInterval(
            $A.getCallback(function() { 
                  if(count==1){
                helper.callApexMethod2(component,helper,x,count);
                  }
            }), x
        ); 
        
    },
    
     callApexMethod2 : function (component,helper,x,count){ 
      component.set("v.view1",false);
         component.set("v.view2",false);
         component.set("v.view3",false);
         if(count==1){
      component.set("v.view4",true);
              component.set("v.card1",true);
              component.set("v.card2",false);
              component.set("v.card3",false);
             component.set("v.card4",false);
         }
         
        
          component.set("v.view5",false);
         
           window.setInterval(
            $A.getCallback(function() { 
                  if(count==1){
                helper.callApexMethod3(component,helper,x,count);
                  }
            }), x
        ); 
     },
    callApexMethod3 : function (component,helper,x,count){ 
     component.set("v.view1",false);
         component.set("v.view2",false);
         component.set("v.view3",false);
      component.set("v.view4",false);
        if(count==1){
          component.set("v.view5",true);
             component.set("v.card1",true);
             component.set("v.card2",false);
             component.set("v.card3",false);
                 component.set("v.card4",false);
        }
         window.setInterval(
            $A.getCallback(function() { 
                if(count==1){
                helper.callApexMethod4(component,helper,x,count);
                }
            }), x
        ); 
    
    
    },
    
    //card2
     callApexMethod4 : function (component,helper,x,count){
     
          
         component.set("v.view2",false);
         component.set("v.view3",false);
    
        if(count==1){
          component.set("v.view1",true);
             component.set("v.card1",false);
             component.set("v.card2",true);
             component.set("v.card3",false);
             component.set("v.card4",false);
        }
         
           window.setInterval(
            $A.getCallback(function() { 
                if(count==1){
                helper.callApexMethod5(component,helper,x,count);
                }
            }), x
        ); 
    
     
     },
      callApexMethod5 : function (component,helper,x,count){
     
          
         component.set("v.view1",false);
         component.set("v.view3",false);
    
        if(count==1){
          component.set("v.view2",true);
             component.set("v.card1",false);
             component.set("v.card2",true);
             component.set("v.card3",false);
                 component.set("v.card4",false);
        }
         
           window.setInterval(
            $A.getCallback(function() { 
                if(count==1){
                helper.callApexMethod6(component,helper,x,count);
                }
            }), x
        ); 
    
     
     },
      callApexMethod6 : function (component,helper,x,count){
     
          
         component.set("v.view2",false);
         component.set("v.view1",false);
    
        if(count==1){
          component.set("v.view3",true);
             component.set("v.card1",false);
             component.set("v.card2",true);
             component.set("v.card3",false);
             component.set("v.card4",false);
        }
         
           window.setInterval(
            $A.getCallback(function() { 
                if(count==1){
                helper.callApexMethod7(component,helper,x,count);
                }
            }), x
        ); 
    
     
     },
    
    //card3
      callApexMethod7 : function (component,helper,x,count){
     
          
         component.set("v.view2",false);
         component.set("v.view3",false);
    
        if(count==1){
          component.set("v.view1",true);
             component.set("v.card1",false);
             component.set("v.card2",false);
             component.set("v.card3",true);
             component.set("v.card4",false);
        }
         
           window.setInterval(
            $A.getCallback(function() { 
                if(count==1){
                helper.callApexMethod8(component,helper,x,count);
                }
            }), x
        ); 
    
     
     },
      callApexMethod8 : function (component,helper,x,count){
     
          
         component.set("v.view1",false);
         component.set("v.view3",false);
    
        if(count==1){
          component.set("v.view2",true);
             component.set("v.card1",false);
             component.set("v.card2",false);
             component.set("v.card3",true);
                 component.set("v.card4",false);
        }
         
           window.setInterval(
            $A.getCallback(function() { 
                if(count==1){
                helper.callApexMethod9(component,helper,x,count);
                }
            }), x
        ); 
    
     
     },
      callApexMethod9 : function (component,helper,x,count){
     
          
         component.set("v.view2",false);
         component.set("v.view1",false);
    
        if(count==1){
          component.set("v.view3",true);
             component.set("v.card1",false);
             component.set("v.card2",false);
             component.set("v.card3",true);
             component.set("v.card4",false);
        }
         
           window.setInterval(
            $A.getCallback(function() { 
                if(count==1){
                helper.callApexMethod10(component,helper,x,count);
                }
            }), x
        ); 
    
     
     },
    
    //card4
       callApexMethod10 : function (component,helper,x,count){
     
          
         component.set("v.view2",false);
        
    
        if(count==1){
          component.set("v.view1",true);
             component.set("v.card1",false);
             component.set("v.card2",false);
             component.set("v.card3",false);
             component.set("v.card4",true);
        }
         
           window.setInterval(
            $A.getCallback(function() { 
                if(count==1){
               // helper.callApexMethod11(component,helper,x,count);
                }
            }), x
        ); 
    
     
     },
    
      callApexMethod11 : function (component,helper,x,count){
     
          
         component.set("v.view1",false);
        
    
        if(count==1){
          component.set("v.view2",true);
             component.set("v.card1",false);
             component.set("v.card2",false);
             component.set("v.card3",false);
                 component.set("v.card4",true);
        }
         
         
    
     
     },*/
    
    
})