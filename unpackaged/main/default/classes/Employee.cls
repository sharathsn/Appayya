public class Employee {

    public string name;
    public integer age;
    public department objDept;
    public Employee(string name, integer age,integer salary, string depName)
    {
        this.name=name;
        this.age=age;
        objDept = new department(salary,depName);
    }
    public class department
    {
        
        public integer salary;
        public string depName;
        public department(integer salary, string depName)
        {
            this.salary=salary;
            this.depName=depName;
        }
    }
}