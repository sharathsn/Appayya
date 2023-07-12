public with sharing class DemoCtrl {
public static List<Account> getAccountsFilteredByType(String accountType)
{
    return [select id,name from account where Type =:accountType];
}
    public static List<Account> getAccountsFilteredByName(String accountname)
{
    return [select id,name from account where Name =:accountname];
}
}