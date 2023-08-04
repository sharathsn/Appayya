public with sharing class WithoutSharing {
    public static integer getAccount() {
        return [select id from Account].size();
    }
    public static integer callInheritedSharing() {
        return InheritedSharing.getAccount();
    }
}