public class studentmaster{
    
    //task1 and task2
    public string fullname;
    public integer age;
    public string city;
    public string state;
    public string country;
    public set<string> departmentset= new set<string>{'commerce','it','finance'};
        public set<string> courseset= new set<string>{'Bcom','MCA','MBA'};
            public string course;
    public string department;
    public map<string,string> citystatemap= new map<string,string>{'Hyderabad'=>'telangana','Bangaore'=>'Karnataka','chennai'=>'Tamilnadu'};
        public List<studentmaster> studentlist;
    
    public List<Marks> marklist;
    
    public studentmaster(){
        
    }
    
    
    //task3
    public studentmaster(string fullname,integer age,string city,string state,string country,string course,string department){
        
        this.fullname=fullname;
        this.age=age;
        if(citystatemap.containskey(city)){
            this.city=city;
        }
        for(String s:citystatemap.values()){
            if(state==s){
                this.state=state;
            }
        }
        this.country=country;
        if(courseset.contains(course)){
            this.course=course;
        }
        if(departmentset.contains(department)){
            this.department=department;
        } 
        system.debug(this);
    }
    
    //task4
    public studentmaster(string fullname,integer age,string course,string department,List<Marks> marklist){
        this.fullname=fullname;
        this.age=age;
        if(courseset.contains(course)){
            this.course=course;
        }
        if(departmentset.contains(department)){
            this.department=department;
        } 
        this.marklist=marklist;
    }
    //task5
    public void setCountryCity(string country,string city){
        
        country=this.country;
        if(citystatemap.containskey(city)){
            city=this.city;
        }
        system.debug('method country is'+country);
        system.debug('method city is'+city);
    }
    
    //task6
    public void setCountryCity2(string country,string city){
        if(this.country == ' ' && this.city==' '){
            this.country=country;
            if(citystatemap.containskey(city)){
                this.city=city;
            }
        }
        system.debug(this.country + this.city);
        
    }
    
    //task7
    public string getcountry(){
        
        system.debug('country is'+this.country);
        return this.country;
        
    }
    
    //task8
    public string getcountrycity(){
        
        system.debug('country is'+this.country +'city is'+this.city);
        return this.country+this.city;
    }
    
    
    //task9
    public Boolean getcountry1(string country){
        if(this.country==country){
            system.debug('true');
            return true;
        }
        else{
            system.debug('false');
            return false;
        }
    }
    
    
    //task10
    public Boolean getcountrycity1(string country,string city){
        if(this.country==country && this.city==city){
            return true;
        }
        else{
            return false;
        }
    }
    
    
    //task11
    public Boolean setstatefromcity(string city){
        
        Boolean result;
        if(citystatemap.containskey(city)){
            system.debug('the related state of city '+city+' is'+citystatemap.get(city));
            result=true;
            return result;
        }
        return result;
    }
    
    //task12
    public List<studentmaster> constructor(integer x){
        
        studentlist= new List<studentmaster>();
        integer agecount=17;
        if(x>=20){
            for(integer i=1;i<x;i++){
                studentlist.add(new studentmaster('student'+i,agecount++,'Hyderabad','Telangana','india','MCA','IT'));
                if(agecount>25){
                    agecount=17;
                }
            }
        }
        for(integer j=0;j<studentlist.size();j++){
            system.debug('student name is'+studentlist.get(j).fullname+'age is'+studentlist.get(j).age);
        }   
        return studentlist;
    }
    
    
    //task13
    public void setcity(integer x){
        studentlist= new List<studentmaster>();
        integer agecount=17;
        if(x>=20){
            for(integer i=1;i<x;i++){
                studentlist.add(new studentmaster('student'+i,agecount++,'Hyderabad','Telangana','india','MCA','IT'));
                if(agecount>25){
                    agecount=17;
                }    
            }
        }
        
        for(integer i=0;i<studentlist.size();i++){
            if(math.mod(i,2)==0){
                studentlist.get(i).city='Hyderabad';
                system.debug('index is'+i+'city is'+studentlist.get(i).city);    
            }
            else{
                studentlist.get(i).city='Bangalore';
                system.debug('index is'+i+'city is'+studentlist.get(i).city);
            }
        }
    }
    
    //task14
    public void seggregateStudentByCity(integer x){
        
        system.debug('-------------------------task12---------------------'); 
        studentlist= new List<studentmaster>();
        integer agecount=17;
        if(x>=20){
            for(integer i=0;i<x;i++){
                studentlist.add(new studentmaster('student'+i,agecount++,'Hyderabad','Telangana','india','MCA','IT'));
                if(agecount>25){
                    agecount=17;
                }    
            }
        }
        system.debug('------------------task13----------------------------'); 
        
        for(integer i=0;i<studentlist.size();i++){
            if(math.mod(i,2)==0){
                studentlist.get(i).city='Hyderabad';
                system.debug('index is'+i+'city is'+studentlist.get(i).city);    
            }
            else{
                studentlist.get(i).city='Bangalore';
                system.debug('index is'+i+'city is'+studentlist.get(i).city);
            }
        }
        
        system.debug('--------------------task14--------------------------');  
        
        List<studentmaster> cityhydlist=new List<studentmaster>();
        List<studentmaster> citybanlist=new List<studentmaster>();
        for(integer i=1;i<studentlist.size();i++){
            if(studentlist.get(i).city=='Hyderabad'){
                cityhydlist.add(studentlist.get(i));
            }
            if(studentlist.get(i).city=='Bangalore'){
                citybanlist.add(studentlist.get(i));
            }
        }
        for(integer j=1;j<citybanlist.size();j++){
            system.debug('student name is'+citybanlist.get(j).fullname+'and city is'+citybanlist.get(j).city); 
        }
    }
    
    //task15
    public void getDistinctAge(integer x){
        List<studentmaster> studentlist= new List<studentmaster>();
        integer agecount=17;
        if(x>=20){
            for(integer i=0;i<x;i++){
                studentlist.add(new studentmaster('student'+i,agecount++,'Hyderabad','Telangana','india','MCA','IT'));
                if(agecount>25){
                    agecount=17;
                }    
            }
        }
        
        set<integer> distinctage= new Set<integer>();
        
        for(integer i=0;i<studentlist.size();i++){
            distinctage.add(studentlist.get(i).age);
        }
        system.debug('Distinct age instudentlist is'+distinctage);
    }
    
    
    //task16
    public void getDistinctAgeCount(integer x){
        
        studentlist= new List<studentmaster>();
        integer agecount=17;
        if(x>=20){
            for(integer i=0;i<x;i++){
                studentlist.add(new studentmaster('student'+i,agecount++,'Hyderabad','Telangana','india','MCA','IT'));
                if(agecount>25){
                    agecount=17;
                }    
            }
        }
        
        List<integer> distinctage= new List<integer>();
        
        for(integer i=0;i<studentlist.size();i++){
            distinctage.add(studentlist.get(i).age);
        }
        
        map<integer,integer> m= new map<integer,integer>();
        
        for(integer s:distinctage){
            if(m.containsKey(s)){
                m.put(s,m.get(s)+1);
            }
            else{
                m.put(s,1);
            }
        }
        
        Set<integer> s1= m.keySet();
        for(integer s2:s1){
            system.debug(s2 +'is counted for'+m.get(s2)+'times');
            
        } 
    }
    
    //task17
    class Marks{
        
        public string subjectname;
        public integer marks;
        public string result;
        
        public Marks(String subjectname,integer marks,string result){
            this.subjectname=subjectname;
            this.marks=marks;
            this.result=result;
            
        }
        
    }
    
    //task18
    public void createstudentswithmarks(integer x){
        
        Marks m1= new Marks('c',75,'pass');
        Marks m2= new Marks('c++',90,'pass');
        Marks m3= new Marks('java',25,'fail');
        marklist= new List<Marks>();
        marklist.add(m1);
        marklist.add(m2);
        marklist.add(m3);
        
        studentlist= new List<studentmaster>();
        integer agecount=17;
        if(x<=20){
            for(integer i=0;i<x;i++){
                studentlist.add(new studentmaster('student'+i,agecount++,'MCA','it',marklist));
                if(agecount>25){
                    agecount=17;
                }    
            }    
        }
        
        for(integer i=0;i<studentlist.size();i++){
            for(Marks m:studentlist.get(i).marklist)
                system.debug('student name is'+studentlist.get(i).fullname+' '+'subject name is'+m.subjectname
                             +' '+'marks is'+m.marks);
        }
        
    }    
    
    
    
    //task19
    public void setResult(integer x){
        Marks m1= new Marks('c',75,'pass');
        Marks m2= new Marks('c++',90,'pass');
        Marks m3= new Marks('java',25,'fail');
        marklist= new List<Marks>();
        marklist.add(m1);
        marklist.add(m2);
        marklist.add(m3);
        
        studentlist= new List<studentmaster>();
        integer agecount=17;
        if(x<=20){
            for(integer i=0;i<x;i++){
                studentlist.add(new studentmaster('student'+i,agecount++,'MCA','it',marklist));
                if(agecount>25){
                    agecount=17;
                }    
            }    
        }
        //will update the result field in marks object based on marks field in marks for each student
        for(integer i=0;i<studentlist.size();i++){
            for(Marks m:studentlist.get(i).marklist){
                if(m.marks>=35){
                    m.result='Pass';
                }
                else{
                    m.result='fail';
                }
            }
        }
        
        //prints the student names after updating result field based on marks field in marks object
        for(integer i=0;i<studentlist.size();i++){
            for(Marks m:studentlist.get(i).marklist){
                system.debug('student name is'+studentlist.get(i).fullname+' '+'subject name is'+m.subjectname
                             +' '+'marks is'+m.marks+' '+'Result is'+m.Result);
            }
            
        }
    }
    
    //task20
    public void getAllSubPassed(integer x){
        
        Marks m1= new Marks('c',75,'pass');
        Marks m2= new Marks('c++',90,'pass');
        Marks m3= new Marks('java',25,'fail');
        marklist= new List<Marks>();
        marklist.add(m1);
        marklist.add(m2);
        marklist.add(m3);
        
        studentlist= new List<studentmaster>();
        integer agecount=17;
        if(x<=20){
            for(integer i=0;i<x;i++){
                studentlist.add(new studentmaster('student'+i,agecount++,'MCA','it',marklist));
                if(agecount>25){
                    agecount=17;
                }    
            }    
        }
        //prints all student names who scored more than 35 marks or 35 marks
        system.debug('student scored more than 35 or 35 marks');
        for(integer i=0;i<studentlist.size();i++){
            for(Marks m:studentlist.get(i).marklist){
                if(m.marks>=35){
                    system.debug('student name is'+studentlist.get(i).fullname+' '+'marks is'+m.marks+' '+'Result is'+m.result);
                }
                
            }
        }
        
    }
    
    //task 21
    public void doMarksCaliculation(integer x){
        
        Marks m1= new Marks('c',75,'pass');
        Marks m2= new Marks('c++',90,'pass');
        Marks m3= new Marks('java',25,'fail');
        marklist= new List<Marks>();
        marklist.add(m1);
        marklist.add(m2);
        marklist.add(m3);
        
        studentlist= new List<studentmaster>();
        integer agecount=17;
        if(x<=20){
            for(integer i=0;i<x;i++){
                studentlist.add(new studentmaster('student'+i,agecount++,'MCA','it',marklist));
                if(agecount>25){
                    agecount=17;
                }    
            }    
        }
        
        for(integer i=0;i<studentlist.size();i++){
            integer totalmarks=0;
            double avgofmarks;
            for(Marks m:studentlist.get(i).marklist){   
                totalmarks=totalmarks+m.marks;
                avgofmarks=totalmarks/3;
                
            }
            system.debug('student name is'+studentlist.get(i).fullname+ ' '+'total marks are'+totalmarks+' '+'avg of marks for each srudent is'+avgofmarks);
        }
    }
    
}