public without sharing class WithoutSharing {
    public static integer getAccount() {
        return [select id,with__c from Account].size();
    }
    public static integer callInheritedSharing() {
        return InheritedSharing.getAccount();
    }
}