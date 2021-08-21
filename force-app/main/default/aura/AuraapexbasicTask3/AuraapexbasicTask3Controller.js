({
	caliculation : function(component, event, helper) {
		var x=parseInt(component.find('input1').get('v.value'));
        var y=parseInt(component.find('input2').get('v.value'));
        var z=component.find('operator').get('v.value');
        
        if(z=='add'){
            component.set('v.Task3result',x+y);
        }
        else if(z=='sub'){
            component.set('v.Task3result',x-y);
        } 
        else if(z=='mul'){
            component.set('v.Task3result',x*y);
        }
        else if(z=='div'){
            component.set('v.Task3result',x/y);
        }
        else if(z=='mod'){
            component.set('v.Task3result',x%y);
        }
	},
    
    evenorodd : function(component, event, helper) {
		var num=component.find('number1').get('v.value');
        //task8
        if(num%2==0){
            component.set('v.Task8result',num+'is even');
        }
        else{
           component.set('v.Task8result',num+'is odd'); 
        }
        
        //task14
         var num1=0; 
         var num2=1; 
         var sum; 
         var i=0; 
         var arraynum=[num1,num2];
         for (i = 0; i < num; i++)  
         { 
             sum=num1+num2;
             arraynum.push(sum);
             num1=num2; 
             num2=sum; 
         } 
         component.set('v.Task14result',arraynum); 
        
        
        //task23
        var i , fact = 1;
			for(i=1;i<=num;i++){
			fact = fact *i;
			}
        component.set('v.Task23result','factorial of a number'+' '+num+'is'+' '+fact);
        
        //task27
         var area=(Math.sqrt(3)/4)*(num*num);
         component.set('v.Task27result','area of equilateral triangle is'+' '+area);
        
        //task29
        var addingitem = [];
                  for(var i=1;i<num;i++){
                      addingitem.push(i);    
                  }
         component.set('v.Task29result',addingitem);
      
       
        
        //Number Palindrome
        var rev=num;
        var r,sum=0;
        
        
        while(num>0){
            r=num % 10;
            sum=(sum*10)+r;
            num=parseInt(num/10);
           
        }
        
        if(rev==sum){
            component.set('v.NumPalindromeresult',rev+' '+'is palindrome'); 
        }
        else{
           component.set('v.NumPalindromeresult',rev+' '+'is  not a palindrome'); 
            }
        
     
	},
    
    ispalindromenumber : function(component, event, helper) {
		var x=component.find('input3').get('v.value');
        //task9
        component.set('v.Task9result',x+' '+'length is'+' '+x.length);
      
        //task25
        if(x==x.toUpperCase()){
             component.set('v.Task25result','lower case is '+' '+x.toLowerCase());
        }
        else if(x==x.toLowerCase()){
            component.set('v.Task25result','upper case is '+' '+x.toUpperCase());
        }
        
        //task20
          var addingitem = [];
                 for(var i=1;i<=5;i++){
                      addingitem.push(i+'Time'+' '+x);  
                 }
            component.set('v.Task20result',addingitem);
       
         //task16
        var reverse='';
        for(var i=x.length;i>=0;i--){
            reverse=reverse+x.charAt(i);
        }
        
         component.set('v.Task16result','Reversed string is'+' '+reverse.trim());
        
        //task6
        if(reverse.trim()==x){
            component.set('v.Task6result',x+'is palindrome');
        }
        else{
            component.set('v.Task6result',x+'is not palindrome');
        }
        
        //task26
        var z2=x.split("");
        var addingitem = [];
        for(var i=0;i<z2.length;i++){    
            if((z2[i]>="A" && z2[i]<="Z") || (z2[i]>="a" && z2[i]<="z")){
               addingitem.push(z2[i]+' '+'is a alphabhet');
        }
        else if(z2[i]>="0" && z2[i]<="9"){
            addingitem.push(z2[i]+' '+'is a number');
        }
            else{
                addingitem.push(z2[i]+' '+'is a special character');
            }
    }
        
        //task28
        var z2=x.split("");
        var addingitem = [];
        for(var i=0;i<z2.length;i++){    
            if(z2[i]=="a" ||z2[i]=="e"||z2[i]=="i"||z2[i]=="o"||z2[i]=="u"){
                addingitem.push(z2[i]+' '+'is a vowel');
            }
            else{
                addingitem.push(z2[i]+' '+'is a consonant');
            }
        }
        component.set('v.Task28result',addingitem);
        
        //task50
        if(x==null){
           component.set('v.Task50result','string is empty'); 
        }
       else{
         component.set('v.Task50result','string is not empty');                 
      }
	},
    
     TwostringTasks : function(component, event, helper) {
          var x=component.find('input4').get('v.value');
          var y=component.find('input5').get('v.value');
         //task12
            component.set('v.Task12result',x+y);
         //task30
         if(x==y){
              component.set('v.Task30result',x+' '+'and'+' '+y+'are equal');
         }
         else{
             component.set('v.Task30result',x+' '+'and'+' '+y+'are not equal');
         }
         
         //task18
         if(x.length>y.length){
             component.set('v.Task18result',x+' '+'is greater in length');
         }
         else{
              component.set('v.Task18result',y+' '+'is greater in length');
         }
         
         //task13
         component.find('input4').set('v.value',y);
         component.find('input5').set('v.value',x);
         var z;
          z=x;
         x=y;
         y=z;
        component.set('v.Task13result','input1 is'+' '+x+' '+'input2 is'+' '+y);
     
     },
    reverseliststrings : function(component, event, helper) {
         var z1=component.find('input6').get('v.value');
          var z2=component.find('input7').get('v.value');
         var z3=component.find('input8').get('v.value');
        
        //task16
        var stringarray=[z1,z2,z3];
         var reversestringarray=[];
         var reverse=' ';
                for(var i=0;i<stringarray.length;i++){
                 
                    reverse=' ';
                    for(var j=stringarray[i].length-1;j>=0;j--){
                        reverse=reverse+stringarray[i].charAt(j);
                      
                    }
                    
                    reversestringarray.push(reverse);
                    component.set('v.Task16result1',reversestringarray); 	
                }
        
    },
     twostringfunctions : function(component, event, helper) {
          var z1=component.find('input9').get('v.value');
          var z2=component.find('input10').get('v.value');
          var z6=parseInt(component.find('input11').get('v.value'));
         //task43
         if(z1.includes(z2)){
           component.set('v.Task43result',z1+' '+'contains '+' '+z2);    
         }
         else{
            component.set('v.Task43result',z1+' '+'does not contains string'+' '+z2);   
         }
         
         //task44
          if(z1.includes(z2)){
            var z7=  z1.replace(z2,'');
           component.set('v.Task44result','After removing particular word  '+' '+z7);    
         }
         else{
            component.set('v.Task44result',z1+' '+'does not contains string'+' '+z2);   
         }
         
         //task45
        
       
         var z3=z1.substring(z1.lastIndexOf(" "));
         var z4=z1.replace(z3,"");
         component.set('v.Task45result','After removing last word:- '+z4);
         
         //task46
         var z5=z1.split(" ");
         component.set('v.Task46result','splitting string into substrings:-'+z5);
         
         //task47
         var z7=z1.charAt(z6);
         component.set('v.Task47result','character at index'+' '+z6+' '+'is'+z7);
     },
    
    DateFunctions : function(component, event, helper) {
    
        var z1=component.find('input12').get('v.value');
          var z2=component.find('input13').get('v.value');
          var z3=component.find('input14').get('v.value');
        
        //task33
        var z4=[z1,z2,z3];
        z4.sort();
        var z5=[];
        for(var i=0;i<z4.length;i++){
           z5[i]=new Date(Date.parse(z4[i]));
        }
         component.set('v.Task33result',z5);
        
        //task34
        
       var z6=new Date(Date.parse(z1));
        if(z6==new Date()){
        component.set('v.Task33result','After parsing current date in string into current date format:-'+' '+z6);
        }
        else{
          component.set('v.Task33result','No current date in string format to parse');  
        }
        
       //task36
        var z7=new Date(Date.parse(z1));
         var z8=new Date(Date.parse(z2));
        if(Date.parse(z2)>Date.parse(z1)){
        var Difference_In_Time = z8.getTime() - z7.getTime(); 
        var Difference_In_Days = Difference_In_Time / (1000 * 3600 * 24); 
        }
        component.set('v.Task36result','Difference Between two dates'+' '+z7 +' '+'and'+' '+ z8+' '+'are'+' '+Difference_In_Days);
        
        //task37
        if(z7==z8){
           component.set('v.Task37result','same dates');   
        } 
        else{
            component.set('v.Task37result','Not same dates');  
        }
        
        //task42
        var z9=new Date(Date.parse(z1));
         var z10=new Date(Date.parse(z2));
         var z11=new Date(Date.parse(z3));
        var z12=[z9,z10,z11];
        var z13=[];
        for(var i=0;i<z12.length;i++){
        if((z12[i].getFullYear()%4)==0){
            z13.push(z12[i]+' '+'is  a leap year');
             
        }
        else{
             z13.push(z12[i]+' '+'is not a leap year');
           
        }
             component.set('v.Task42result',z13);
        }
    
    }
    
})