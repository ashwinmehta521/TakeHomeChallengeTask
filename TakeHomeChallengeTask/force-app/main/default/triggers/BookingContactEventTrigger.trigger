trigger BookingContactEventTrigger on Booking__c (after insert) {

    if(Trigger.isAfter && Trigger.isInsert)
    {
        CreateEventOnContactClass.createEventOnContact(Trigger.new);
    }
}