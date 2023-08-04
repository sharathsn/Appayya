public Inherited sharing class InheritedSharing {
    public static integer getAccount() {
        return [select id from Account].size();
    }
}