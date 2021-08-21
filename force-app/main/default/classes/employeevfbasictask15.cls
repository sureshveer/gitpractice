public class employeevfbasictask15 {
    public string name {get;set;}
    public integer salary{get;set;}
        public integer exp {get;set;}
        public list<employeevfbasictask15> emp {get;set;}
        public employeevfbasictask15(string name,integer salary,integer exp){
            this.name=name;
            this.salary=salary;
            this.exp=exp;
        }
    public employeevfbasictask15(){
        emp=new list<employeevfbasictask15>();
        emp.add(new employeevfbasictask15('satya',10000,3) );
        emp.add(new employeevfbasictask15('kavya',20000,5) );
        emp.add(new employeevfbasictask15('hyma',30000,4) );
    }
        


}