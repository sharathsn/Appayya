global class Multiple {
    global string var;
    Account acc;
    global class first{
        global void first()
        {
            system.debug('first');
        }
    }
    global class second{
        global void first()
        {
            system.debug('second');
        }
    }
            global Multiple()
        {
            var='true';
        }
                public List<Account> Multiples()
        {
            List<Account> accList=new List<Account>();
            acc=new Account();
            acc.Name=var;
            accList.add(acc);
            return accList;
        }
    public void updateAccount()
    {
        Account[] accList =[select id,name from account];
        if(accList?.size()>0){
            
        
        for(Account acc:accList)
        {
            acc.Name = acc.Name + 'Append';
        }}
        update(accList);
    }
}