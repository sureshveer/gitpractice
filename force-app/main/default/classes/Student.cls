public class Student {

     private integer stuid;
     private String stuname;
     private String studepmt;
     private String stucourse;
     private String studob;
     private String stucity;
     private String citycapital;
     private String stustate;
     private String stucountry;
     private String countrycapital;
     private String stumail;
    private StudentMarks stumarks;
    
    public Student(integer stuid,String stuname,String studepmt,String stucourse,String studob,String stucity,String citycapital,String stustate,String stucountry,String countrycapital,String stumail,StudentMarks stumarks){

        this.stuid=stuid;
        this.stuname=stuname;
        this.studepmt=studepmt;
        this.stucourse=stucourse;
        this.studob=studob;
        this.stucity=stucity;
        this.citycapital=citycapital;
        this.stustate=stustate;
        this.stucountry=stucountry;
        this.countrycapital=countrycapital;
        this.stumail=stumail;
        this.stumarks=stumarks;
    }
    
     public  Student(integer stuid,String stuname,String studepmt,String stucourse,String studob,String stucity,String citycapital,String stustate,String stucountry,String countrycapital,String stumail){

        this.stuid=stuid;
        this.stuname=stuname;
        this.studepmt=studepmt;
        this.stucourse=stucourse;
        this.studob=studob;
        this.stucity=stucity;
        this.citycapital=citycapital;
        this.stustate=stustate;
        this.stucountry=stucountry;
        this.countrycapital=countrycapital;
        this.stumail=stumail;
    }
    
    //setters and getters
     public void setStuid(integer stuid)
       {
         this.stuid = stuid;
       }
     public integer getStuid()
       {
         return stuid;
       }
    
     public void setStuname(String stuname)
       {
         this.stuname = stuname;
       }
     public String getStuname()
       {
         return stuname;
       }
    
      public void setStudepmt(String studepmt)
       {
         this.studepmt = studepmt;
       }
     public String getStudepmt()
       {
         return studepmt;
       }
    
      public void setStudob(String studob)
       {
         this.studob = studob;
       }
     public String getStudob()
       {
         return studob;
       }
    
    
    
    public void setStucity(String stucity)
       {
         this.stucity = stucity;
       }
     public String getStucity()
       {
         return stucity;
       }
    
    
    public void setCitycapital(String citycapital)
       {
         this.citycapital = citycapital;
       }
     public String getCitycapital()
       {
         return citycapital;
       }

     public void setStustate(String stustate)
       {
         this.stustate = stustate;
       }
     public String getStustate()
       {
         return stustate;
       }

    
    public void setStumail(String stumail)
       {
         this.stumail = stumail;
       }
     public String getStumail()
       {
         return stumail;
       }

     public void setCountrycapital(String countrycapital)
       {
         this.countrycapital = countrycapital;
       }
     public String getCountrycapital()
       {
         return countrycapital;
       }
    
  
    public void setStucountry(String stucountry)
       {
         this.stucountry = stucountry;
       }
     public String getStucountry()
       {
         return stucountry;
       }
    
     public void setStumarks(StudentMarks stumarks)
       {
         this.stumarks = stumarks;
       }
     public StudentMarks getStumarks()
       {
         return stumarks;
       }
    
    
    
}