public class Bootcamp_ApexTasks_suresh {
    
    public static void task1(List<Student> stu,String actualdepmt,String replacedepmt){
        
        system.debug('Before operation list is'+stu);
        
        for(integer i=0;i<stu.size();i++){
            if(stu.get(i).getStudepmt()==actualdepmt){
                stu.get(i).setStudepmt(replacedepmt);
            }   
        }
         system.debug('after operation list is'+stu);
    
    }
    
    public static void task2(List<Student> stu,String actualemail,String replaceemail){

         system.debug('Before operation list is'+stu);
        for(integer i=0;i<stu.size();i++){
            if(stu.get(i).getStumail()==actualemail){
            stu.get(i).setStumail(replaceemail);
            }
        }
         system.debug('after operation list is'+stu);
        
    }
    
    public static void task3(List<Student> stu,List<String> cities){
        
        
         system.debug('before operation list is'+stu);
        for(String city:cities){
        for(integer i=0;i<stu.size();i++){
            if(stu.get(i).getStucity()==city){
                system.debug('the corresponding state of city '+city+'is'+stu.get(i).getStustate());
            }
        }
        }
    }
    

     public static void task4(List<Student> stu,List<String> statenames){
        
         system.debug('before operation list is'+stu);
        for(String statename:statenames){
        for(integer i=0;i<stu.size();i++){
            if(stu.get(i).getStustate()==statename){
                system.debug('the corresponding capital  of state '+statename+'is'+stu.get(i).getCitycapital());
            }
        }
        }
    }
    
    public static void task5(List<Student> stu,String department){
           
        for(integer i=0;i<stu.size();i++){
            
            if(stu.get(i).getStudepmt()==department){
            System.debug('corresponding list of students are'+stu.get(i)+'in department'+department);    
                
            }

        }
        
    }
    
     public static void task6(){
         List<StudentMarks> stumarkslist=new List<StudentMarks>();
         
         StudentMarks s1marks= new StudentMarks(85,78,88,56,77,65);
         StudentMarks s2marks= new StudentMarks(58,77,88,66,47,85);
         StudentMarks s3marks= new StudentMarks(55,76,85,59,78,55);
         
           List<Student> stu= new List<Student>();
          stu.add(new Student(101,'suresh','mech','B.Tech','8/8/1994','kakinada','vijayawada','AndhraPradesh','india','New Delhi','svsuresh8@gmail.com',s1marks)); 
          stu.add(new Student(102,'suresh','mech','B.Tech','8/6/1993','vizag','vijayawada','AndhraPradesh','india','New Delhi','vsuresh.2358@gmail.com',s2marks));
          stu.add(new Student(103,'suresh','mech','B.Tech','9/5/1991','kakinada','vijayawada','Telangana','india','New Delhi','suresh@gmail.com',s3marks));
         
         double totalmarks;
         double percentage;
        for(integer i=0;i<stu.size();i++){
          totalmarks=stu.get(i).getStumarks().getEnglishmarks()+ stu.get(i).getStumarks().getTelugumarks()+stu.get(i).getStumarks().getHindimarks()+stu.get(i).getStumarks().getSciencemarks()+stu.get(i).getStumarks().getSocialmarks()
                +stu.get(i).getStumarks().getMathsmarks();
            percentage=totalmarks/6;
            if(percentage>70){
                system.debug('Students above percentage '+percentage +'is'+stu.get(i).getStuname());
            }
            }
  
    }
    
    
    public static void task7(List<Student> stu,List<String> countrynames){
        
        system.debug('before operation list is'+stu);
        for(String countryname:countrynames){
        for(integer i=0;i<stu.size();i++){
            if(stu.get(i).getStucountry() == countryname){
                system.debug('the corresponding capital  of country '+countryname+'is'+stu.get(i).getCountrycapital());
            }
        }
        }
    }
    
     public static void task8(List<Student> stu,Integer month){
        
       
         system.debug('before operation list is'+stu);
      
        for(integer i=0;i<stu.size();i++){
         Date d= Date.parse(stu.get(i).getStudob());
           
            if(d.month() == month){
                system.debug('the corresponding list of students born in month '+month+'are'+stu.get(i));
            }
        }
        
     }
    
      public static void task9(List<Student> stu,String Stringdate){
      
         system.debug('before operation list is'+stu);
      
        for(integer i=0;i<stu.size();i++){
         Date d= Date.parse(stu.get(i).getStudob());
           Date d1=Date.parse(Stringdate);
            if(d.year()==d1.year() && d.month()==d1.month() && d.day()==d1.day()){
                system.debug('the corresponding list of students born in particular date '+d1+'is'+stu.get(i));
            }
        }
        
     }
    
    
     public static void task10(){
         
          List<Student> stu= new List<Student>();
          stu.add(new Student(101,'suresh','mech','B.Tech','8/8/1994','kakinada','vijayawada','AndhraPradesh','india','New Delhi','svsuresh8@gmail.com')); 
          stu.add(new Student(102,'suresh','mech','B.Tech','8/6/1993','vizag','vijayawada','AndhraPradesh','india','New Delhi','vsuresh.2358@gmail.com'));
          stu.add(new Student(103,'suresh','mech','B.Tech','9/5/1991','kakinada','vijayawada','Telangana','india','New Delhi','suresh@gmail.com'));
         
      
         system.debug('before operation list is'+stu);
      
        for(integer i=0;i<stu.size();i++){
            if(math.mod(i,2)==0){
                stu.get(i).setStucity('Hyderabad');
                System.debug('index is'+i+'student name is'+stu.get(i).getStuname()+'student city is'+stu.get(i).getStucity());
            }
            else{
              stu.get(i).setStucity('Bangalore');
                System.debug('index is'+i+'student name is'+stu.get(i).getStuname()+'student city is'+stu.get(i).getStucity());
            }
            
        }
        
     }
    
      public static void task11(){
         
          List<Student> stu= new List<Student>();
          stu.add(new Student(101,'suresh','mech','B.Tech','8/8/1994','Bangalore','vijayawada','AndhraPradesh','india','New Delhi','svsuresh8@gmail.com')); 
          stu.add(new Student(102,'suresh','mech','B.Tech','8/6/1993','vizag','vijayawada','AndhraPradesh','india','New Delhi','vsuresh.2358@gmail.com'));
          stu.add(new Student(103,'suresh','mech','B.Tech','9/5/1991','Bangalore','vijayawada','Telangana','india','New Delhi','suresh@gmail.com'));
         
      
         system.debug('before operation list is'+stu);
    
       for(integer i=0;i<stu.size();i++){
           if(stu.get(i). getStucity()=='Bangalore'){
               
               Date d1=Date.today();
               Date d2= Date.parse(stu.get(i).getStudob());
               system.debug('Student name is'+stu.get(i).getStuname()+'student age is'+(d1.year()-d2.year()));
           }
       
       
       }
      
      
      
      }
    
    
    
    
    
}