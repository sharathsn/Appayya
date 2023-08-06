trigger AccTrigger on Account (before insert) {
For(Account acc: Trigger.new){
 List<Account> accList = [select id from account];
 system.debug(accList.size());
}
}