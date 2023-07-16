public class limitbatch implements Database.Batchable<sobject>{
public Database.QueryLocator start(Database.BatchableContext con)
{
   return database.getQueryLocator('select id,name from account where createddate=last_n_days:2'); 
}
public void execute (Database.BatchableContext con,List<sobject> scope)
{
    for (Account acc : (List<account>)scope) {
    acc.name=acc.name+'All';
    update acc;
}

}
public void finish (Database.BatchableContext con)
{
    
}
}