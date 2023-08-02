trigger PFCase on Case (after update) {
for( Case c1 : Trigger.new)
{
    PEIntegration__e evt1 = new PEIntegration__e ();
    evt1.description__c=c1.CaseNumber ;
    EventBus.publish(evt1);
    
    PEIntegration__e evt11 = new PEIntegration__e ();
    evt11.description__c=c1.Status;
    EventBus.publish(evt11);
}
    
}