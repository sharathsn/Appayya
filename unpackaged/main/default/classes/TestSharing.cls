@isTest
public with sharing class TestSharing {
    @isTest(SeeAllData=true)

    public static void showSharing() {
        User u =[select id from user where email='shettysharathsn@gmail.com' and profile.name='System Administrator'];
        System.runas(u)
        {
           system.System.debug(WithSharing.getAccount());
            //system.System.debug(WithoutSharing.getAccount());
            //system.System.debug(InheritedSharing.getAccount());
            system.assertEquals(358, WithSharing.getAccount());
        }
    }
}