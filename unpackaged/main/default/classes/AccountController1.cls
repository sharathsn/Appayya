// AccountController.apxc
public  class AccountController1 {
    @AuraEnabled
    public static List<Account> getAccounts() {
        return [SELECT Id, Name FROM Account]; // Fetch the first 10 accountsß
        
    }
}