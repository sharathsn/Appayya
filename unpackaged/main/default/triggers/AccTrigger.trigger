trigger AccTrigger on Account (before insert) {

 WithSharing.accListSharingTri(Trigger.new);


}