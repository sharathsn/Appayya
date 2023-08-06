trigger AccTrigger on Account (before insert) {
if(ContactTriggerHandler.isFirstTime){
        ContactTriggerHandler.isFirstTime = false;
For(Account acc: Trigger.new){
 WithSharing.accListSharingTri();
}
}
}