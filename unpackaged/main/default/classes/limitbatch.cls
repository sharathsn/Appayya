public class limitbatch implements Database.Batchable<sobject>{
public Database.QueryLocator start(Database.BatchableContext con)
{
   return database.getQueryLocator('select id,name from account'); 
}
public void execute (Database.BatchableContext con,List<sobject> scope)
{
    for (Account acc : (List<account>)scope) {
    List<Contact> contacts = [SELECT Id, Name FROM Contact WHERE AccountId = :acc.Id];
    // Perform some logic with the contacts
}

}
public void finish (Database.BatchableContext con)
{
    
}
}