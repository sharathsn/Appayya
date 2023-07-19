global class MyWebService {
    // This method will be exposed as a SOAP API
    webservice
     static void sayHello(String name) {
        system.debug('hi');
    }
}