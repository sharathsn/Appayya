public with sharing class CustomObjectController {
    @AuraEnabled
    public static List<Account> getCustomObjects() {
        return [SELECT Id, Name FROM Account];
    }
}