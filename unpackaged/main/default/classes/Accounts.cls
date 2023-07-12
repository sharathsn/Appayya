public class Accounts {
	//List<string>
	//List<id>
	integer i;
    string s;
    public Accounts()
    {
        i=1234;
        s='sharath';
        sharath();
    }
     public Accounts(integer i,string s)
    {
        this.i=i;
        this.s=s;
        sharath();
    }
    public Accounts(string ss, integer ii)
    {
        i=ii;
        s=ss;
        sharath();
    }
    public integer sharath()
    {
        //system.debug('sharath');
    	return i;
    }
    
    public static integer sharath1()
    {
        //system.debug('sharath');
    	return 1;
    }
    class Contacts
{
    //void sharath()
    public integer sharath()
    {
        //system.debug('sharath');
    	return 1;
    }
    public integer i;
    string s;
}
}