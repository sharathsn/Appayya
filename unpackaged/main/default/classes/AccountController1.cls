// AccountController.apxc
public  class AccountController1 {
        public List<Account> accountList { get; set; }

    @AuraEnabled
    public static List<Account> getAccounts() {
        return [SELECT Id, Name,Phone,BillingStreet FROM Account order by createddate desc]; // Fetch the first 10 accountsß
        
    }
    
    public AccountController1() {
        accountList = [SELECT Id, Name, Phone, BillingStreet FROM Account];
    }
}