@istest
public class MixedDMLErrorTest {
@istest
    public static void testm()
    {
        
        
        User thisUser = [SELECT Id FROM User WHERE Id = :UserInfo.getUserId()];
        string org =UserInfo.getOrganizationId();

        System.runAs (thisUser) {
            Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
            UserRole r = [SELECT Id FROM UserRole WHERE Name='CEO'];
           
            User usr = new User(alias = 'apexs', email='apex@apexhours.com', 
               emailencodingkey='UTF-8', lastname='Hours', 
               languagelocalekey='en_US', 
               localesidkey='en_US', profileid = p.Id, userroleid = r.Id,
               timezonesidkey='America/Los_Angeles', 
               username=org+'apexhours1@apexhours.com');
            insert usr;
            
            Account a = new Account(Name='ApexHours');
        insert a;
        }
        MixedDMLErrorDemo.myMethod();
    }
}