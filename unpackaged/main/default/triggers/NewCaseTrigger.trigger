trigger NewCaseTrigger on Case (after insert) {
    List< My_Event__e > eventList = new List< My_Event__e >();

    for (Case newCase : Trigger.new) {
        My_Event__e event = new My_Event__e();
        event.CaseNumber__c = newCase.CaseNumber;
        event.Description__c = newCase.Description;
        event.Priority__c = newCase.Priority;
        event.ContactEmail__c = newCase.Contact.Email;
        // Set other relevant fields

        eventList.add(event);
    }

    EventBus.publish(eventList);
}