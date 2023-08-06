public without sharing class WithSharing {
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
        List<Account> accList;
        //if(schema.SObjectType.Account.fields.Active1__c.isupdateable())
        accList = [select id,active1__c from account with system_mode];
 		system.debug(accList.size());
        integer i= accList.size();
        Account acc = new Account();
        acc.name=i+'Umapathi';
        insert acc;
    }
}