public class studentvfbasictask14{
    public string name {get;set;}
    public integer age{get;set;}
        public string dateofbirth {get;set;}
        public list<studentvfbasictask14> stu {get;set;}
       
    public studentvfbasictask14(string name,integer age,string dateofbirth){
            this.name=name;
            this.age=age;
            this.dateofbirth=dateofbirth;
        }
    public studentvfbasictask14(){
        
        stu=new list<studentvfbasictask14>();
        stu.add(new studentvfbasictask14('satya',21,'30/8/1995') );
        stu.add(new studentvfbasictask14('kavya',21,'30/8/1995') );
        stu.add(new studentvfbasictask14('hyma',27,'30/8/1992') );

    }
        


}