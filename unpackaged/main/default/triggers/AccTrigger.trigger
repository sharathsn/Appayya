trigger AccTrigger on Account (before insert) {
integer i=1;
For(Account acc: Trigger.new){
if(i==1)
 WithSharing.accListSharingTri();
 i++;
}
}