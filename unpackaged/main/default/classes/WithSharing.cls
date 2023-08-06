public with sharing class WithSharing {
    public static integer getAccount() {
        return [select id,with__c from Account].size();
    }
    public static integer callInheritedSharing() {
        return InheritedSharing.getAccount();
    }
    
    public static List<Account> accListSharing() {
        return [select id,with__c from Account];
    }
    public static Void accListSharingTri() {
        List<Account> accList = [select id from account];
 		system.debug(accList.size());
        integer i= accList.size();
        Account acc = new Account();
        acc.name='Umapathi1'+i;
        insert acc;
    }
}