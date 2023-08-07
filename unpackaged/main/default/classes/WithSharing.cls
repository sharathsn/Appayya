public  with sharing class WithSharing {
    public static integer getAccount() {
        return [select id,with__c from Account].size();
    }
    public static integer callInheritedSharing() {
        return InheritedSharing.getAccount();
    }
    
    public static List<Account> accListSharing() {
        return [select id,with__c from Account];
    }
    public static Void accListSharingTri(List<Account> accl) {
        List<Account> accList;
        //if(schema.SObjectType.Account.fields.Active1__c.isupdateable())
        accList = [select id,active1__c from account];
 		system.debug(accList.size());
        integer j= accList.size();
        integer i = InheritedSharing.getAccount();
        Account acc = new Account();
        acc.name=i+'Umapathi'+j;
        insert acc;
    }
}