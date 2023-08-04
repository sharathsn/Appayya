public with sharing class AccountController {
    @AuraEnabled
    public static List<Account> getAccounts(Integer pageNumber, Integer pageSize) {
        Integer offset = (pageNumber - 1) * pageSize;
        return [SELECT Id, Name, Industry FROM Account ORDER BY Name LIMIT :pageSize OFFSET :offset];
    }
}