public class Forvf {
public static void vf()
{
    try {
    // Your code that may exceed the SOQL query limit
    // ...

    // Perform multiple SOQL queries
    List<Account> accounts = [SELECT Id FROM Account LIMIT 1000];
        for(Account acc:accounts)
        {
    		List<Contact> contacts = [SELECT Id FROM Contact where name ='texas' limit 1];        
        }
    
    // ... Repeat for additional queries

    // More code...
} catch (System.LimitException e) {
    // Handle the "Too many SOQL queries" error
    // You can perform necessary actions such as logging, error handling, or reducing the number of queries
    
    // Example: Logging the error message
    //System.debug('SOQL Limit Exception: ' + e.getMessage());
    
    // Example: Gracefully handling the error and informing the user
    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Too many SOQL queries. Please try again later.'));
}

}
}