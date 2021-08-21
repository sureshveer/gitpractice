public class JsController {

    public string selectedTask{get;set;}
    public String Rendersection{get;set;}
    public Boolean RenderBlock{get;set;}
    public JsController(){
        RenderBlock=false;
    }
    
    public list<selectoption> getselecttasklist(){
        list<selectoption> options = new list<selectoption>();
        options.add(new SelectOption('none','none'));
        for(integer i=1;i<5;i+=4){
           integer j=i+4;
            options.add(new SelectOption('Task'+i+'to'+j,'Task'+i+'to'+j));
        }
          for(integer i=5;i<50;i+=5){   
              integer k=i+5;
              integer z=i+1;
            options.add(new SelectOption('Task'+z+'to'+k,'Task'+z+'to'+k));
        }
     
        return options;
    }
    
    public pagereference showTasksection(){
        RenderBlock=true;
          Rendersection=selectedTask; 
        return null;
    }
    
    
}