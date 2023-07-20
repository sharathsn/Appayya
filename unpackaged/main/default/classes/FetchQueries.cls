public class FetchQueries {
@AuraEnabled
    public static List <SOQL_Queries__mdt> fetchSOQLQueries() {
        return [ SELECT Label, Query__c     FROM SOQL_Queries__mdt  ORDER BY Label ];
    }
    @AuraEnabled
    public static List <Account> fetchAccounts() {
        return [ SELECT id, name     FROM Account  ORDER BY Name ];
    }
}