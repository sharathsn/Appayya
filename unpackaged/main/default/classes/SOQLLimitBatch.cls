public class SOQLLimitBatch implements Database.Batchable<sobject> {
    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('select id,name,accountid from contact where accountid=\'0015g00000E7ZUEAA3\'');
    }
    public void execute(Database.BatchableContext BC,List<sobject> scope)
    {
        For(Contact con: (List<Contact>)scope){
            For(Account Acc:[select id from account where Id = :con.accountid]){
                system.debug('Sharaths'+Acc.id);
            }
        }   
    }
    public void finish(Database.BatchableContext BC)
    {
        
    }
}