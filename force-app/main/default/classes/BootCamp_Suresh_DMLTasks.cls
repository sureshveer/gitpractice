public class BootCamp_Suresh_DMLTasks{

    //standard object
   public static void tasklast(){
        account act = [select name, NumberOfEmployees, industry from Account where name = 'GenePoint'];
        system.debug('Industry: ' + act.Industry);
        system.debug('Number of Employees: ' + act.NumberOfEmployees);
        system.debug(act);
    }
    
    //student object related tasks
    //retrieve student  records and put them in list 
    public static void task1(){
        List<Student__c>  stu = [select Student_Name__c,Branch__c,Admission_Number__c,Age__c,AgeAtAdmissionDate__c,Date_of_Birth__c,Date_of_Joining__c,
                          Date_ofAdmission__c,	PhoneNumber__c,Email__c,city__c,Course__c from Student__c ];
       
        if(stu!=null){
        system.debug(stu);
        }    
    }
    
    //method to take the student data and put into map
     public static void task2(){
       List<Student__c> stu = [select Student_Name__c,Branch__c,Admission_Number__c,Age__c,AgeAtAdmissionDate__c,Date_of_Birth__c,Date_of_Joining__c,
                          Date_ofAdmission__c,	PhoneNumber__c,Email__c,city__c,Course__c from Student__c ];
       
         integer count=0;
         map<integer,Student__c>  m=new map<integer,Student__c>();
         if(m.isEmpty()){
             for(integer i=0;i<stu.size();i++){
                 m.put(count++,stu.get(i));
             }
    
         }
         system.debug('map is'+m);
         
         for(integer j=0;j<m.size();j++){
         system.debug(m.get(j));
         }
    }
    
    //method to change branch from cse to mech for all students
    //it will not update database
    public static void task3(){
       List<Student__c> stu = [select Student_Name__c,Branch__c from Student__c];
        for(integer i=0;i<stu.size();i++){
        if(stu.get(i).Branch__c=='cse'){
            stu.get(i).Branch__c='mech';            
        }
        }
        System.debug('Student list after changing branch'+stu);
    }
    
    
    
    //retrieve list of student master record(s) by country - Custom object
    public static void task4 (string course){
        list<Student__c> stuList = [select Student_Name__c,Branch__c from Student__c where Course__c =:course];
        for (Student__c stu : stuList){
           
            system.debug('Name: ' + stu.Student_Name__c);
            system.debug('Branch is'+stu.Branch__c);
            system.debug('course'+course+'is related to branch'+stu.Branch__c);
        }
    }
    
    //DML Operations
    
    // insert a new record into student object
    public static void task5(){
        Student__c stu = new Student__c();
        stu.Student_Name__c = 'Sunny';
        stu.city__c = 'India';
        stu.State__c = 'Chennai';
        System.debug('record inserted');
        insert stu;        
    }
    
    // insert a new record into student object
    public static void  task6(){
        Student__c stu = new Student__c(Student_Name__c='Vinay',city__c='India',State__c='Mumbai',PhoneNumber__c='9494001944');        
       System.debug('record inserted');
        insert stu;        
    }
    
    //Update the branch  value to something
    public static void task7(string branch){
        list<Student__c> stuList = [select Branch__c from Student__c];
        for(Student__c stu:stuList)
        {
            if(stu.Branch__c=='cse'){
            stu.Branch__c = branch; 
            }
        }
        update stuList;
    }
    
      //Update the email  value to something
    public static void task8(string email){
        list<Student__c> stuList = [select Email__c from Student__c];
        for(Student__c stu:stuList)
        {
            stu.Email__c = email;   
        }
        update stuList;
    }
    
    //delete student master record by student name
    public static void deleteStudent(string stuName){
        list<Student__c> stuList = [select Student_Name__c from Student__c where Student_Name__c =:stuName];        
        delete stuList;
    }
    
    //delete all student master record
    public static void deleteAllStudent(){
        list<Student__c> stuList = [select Student_Name__c from Student__c];        
        delete stuList;
    }
    
    //Upsert student master record using Name field
    public static void upsertStudent(string stuName){
        Student__c stu = new Student__c(Student_Name__c = stuName, State__c = 'India', city__c='Hyderabad');
        upsert stu name;
    }    

}