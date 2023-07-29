@RestResource(urlMapping='/Account/*')
global class ApexRest {
    @HttpGet
    global static void sharath(){
        integer i,j=10;
        system.debug(i);
        system.debug(j);
    }
}