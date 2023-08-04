@isTest
public without sharing class TestSharing {
    @isTest(SeeAllData=true)

    public static void showSharing() {
        User u =[select id from user where username='appibangari@gmail.com'];
        System.runas(u)
        {
            system.System.debug(WithSharing.getAccount());
        }
    }
}