public class FromSalesforceRest {
    public static string fromsfrestmethod(){
        http hh = new http();
        httprequest hreq = new httprequest();
        hreq.setEndpoint('callout:FromSalesforce1/query?q=select+id+from+validationrule');
        hreq.setheader('Authorization','Bearer '+userinfo.getSessionId());
        hreq.setTimeout(60000);
        hreq.setMethod('GET');
        
        HttpResponse hres = hh.send(hreq);
        string res = hres.getBody();
    	return res;
    }
}