@isTest
public class DemoCtrltest {

    static testmethod void testAccountFilterByType()
    {
        List<Account>accounts=DemoCtrl.getAccountsFilteredByType('Customer - Direct');
        List<User> u = [SELECT UserName,Email FROM User where username='sharathsn@gmail.com' LIMIT 1]; 
        Assert.areEqual(1, u.size());
    }
}