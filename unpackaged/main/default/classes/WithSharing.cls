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
}