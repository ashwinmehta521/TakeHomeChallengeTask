public class CreateEventOnContactClass {

    public static void createEventOnContact(List<Booking__c> listOfBookings){
        Set<Id> contactIdSet = new Set<Id>();
        List<Contact> listOfContacts = new List<Contact>();
        List<Event> eventsToBeCreated = new List<Event>();
        for(Booking__c booking:listOfBookings) {
            contactIdSet.add(booking.ContactId__c);
        }  
        listOfContacts = [SELECT Id, Account.OwnerId FROM Contact where Id IN :contactIdSet];
        for(Contact contact:listOfContacts){
            Event event = new Event();
            event.WhoId = contact.Id;
            event.OwnerId = contact.Account.OwnerId;
            event.Subject = 'Test event creation';
            event.ActivityDate = system.today();
            event.ActivityDateTime = system.today();
            event.DurationInMinutes = 30;
            eventsToBeCreated.add(event);
        }
        if(!eventsToBeCreated.isEmpty()){
            insert eventsToBeCreated;
        }
        
    }
}