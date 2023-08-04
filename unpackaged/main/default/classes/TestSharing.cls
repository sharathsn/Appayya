@isTest
public with sharing class TestSharing {
    @isTest(SeeAllData=true)

    public static void showSharing() {
        User u =[select id from user where email='shettysharathsn@gmail.com' and profile.name='Syinistrator'];
        System.runas(u)
        {
            system.System.debug(WithoutSharing.getAccount());
        }
    }
}