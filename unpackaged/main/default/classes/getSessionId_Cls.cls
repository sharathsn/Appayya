public with sharing class getSessionId_Cls {
	@AuraEnabled
    public static string getOldSession()
    {
        string sessId = [select Session_Id__c from user where id=:userinfo.getUserId()].Session_Id__c;
        if(string.isblank(sessId))
        {
            sessId = '0';
        }
        return sessId;
    }
    @AuraEnabled
    public static string getCurrentSession()
    {
        User u = new user();
        u.id=userinfo.getUserId();
        u.Session_Id__c=UserInfo.getOrganizationId()+''+UserInfo.getSessionId().subString(15);
        update u;
        
        return UserInfo.getOrganizationId()+''+UserInfo.getSessionId().subString(15);
    }
    @AuraEnabled
    public static void updateCurrentSession()
    {
        User u = new user();
        u.id=userinfo.getUserId();
        u.Session_Id__c=UserInfo.getOrganizationId()+''+UserInfo.getSessionId().subString(15);
        update u;
        
		//return UserInfo.getOrganizationId()+''+UserInfo.getSessionId().subString(15);
    }
}