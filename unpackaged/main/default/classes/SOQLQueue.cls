public class SOQLQueue implements Queueable{
    public void execute(QueueableContext QC)
    {
        For(Contact con: [select id,name,accountid from contact where accountid='0015g00000E7ZUEAA3']){
            for(Account Acc:[select id from account where Id = :con.accountid]){
                system.debug('Sharaths'+Acc.id);
            }
        }
    }
}