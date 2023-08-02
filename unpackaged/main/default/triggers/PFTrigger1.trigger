trigger PFTrigger1 on PEIntegration__e (after insert) {
for(PEIntegration__e pe : trigger.new)
{
    Account acc= new Account();
    acc.name=pe.description__c;
    insert acc;
}
}