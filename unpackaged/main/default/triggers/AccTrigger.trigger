trigger AccTrigger on Account (before insert) {
For(Account acc: Trigger.new){
 for(Contact con:[select id from contact where accountId = :acc.Id]){
 }
}
}