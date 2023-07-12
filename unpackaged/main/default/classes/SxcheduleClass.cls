public class SxcheduleClass implements Schedulable{
public void execute(SchedulableContext con1)
{
    system.debug('Schedulable');
    Contact con = new Contact();
    con.firstname='Sharath';
    con.lastname='Sharath';
    insert con;
}
}