public class FromSalesforceRest {
    public static string fromsfrestmethod(){
        http hh = new http();
        httprequest hreq = new httprequest();
        hreq.setEndpoint('callout:FromSalesforce1/query?q=select+id+from+validationrule');
        //hreq.setEndpoint('https://login.salesforce.com/services/oauth2/token?grant_type=password&client_id=3MVG9fe4g9fhX0E5yoaturQHmGvlibkFJa0jwwk3ljfuH.RfO8U16b9OOvTflq.Mz2PImLjeb_eHSxJfXkwKJ&client_secret=7A32BC9A8FFA072AB1D469C0F7F15A6736D9D78F542508A3067BB7291BE6170A&username=sharathsn@gmail.com&password=Chandru$77vvccQYRfFYC7Y7JMxfpUm5AC');
        //hreq.setheader('Authorization','Bearer '+userinfo.getOrganizationId()+userinfo.getSessionId());
        hreq.setTimeout(60000);
        hreq.setMethod('POST');
        
        HttpResponse hres = hh.send(hreq);
        string res = hres.getBody();
        system.debug(res);
    	return res;
    }
}