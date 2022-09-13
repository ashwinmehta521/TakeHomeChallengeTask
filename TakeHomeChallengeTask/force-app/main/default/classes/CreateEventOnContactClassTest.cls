@isTest(seeAllData=false)
public class CreateEventOnContactClassTest {

    @testSetup static void setup(){
        //create account
        Account account = new Account();
        account.Name = 'Test account';
        insert account;
        //create contact
        Contact contact = new Contact();
        contact.AccountId = account.Id;
        contact.LastName = 'Test contact';
        insert contact;
        
        Date todayDate = date.today();
        Date futureDate = todayDate.addDays(7);
        
        //create event
         Event event = new Event();
         event.WhoId = contact.Id;
         event.OwnerId = UserInfo.getUserId();
         event.Subject = 'Test event creation'; 
         event.ActivityDate = futureDate;
         event.ActivityDateTime = futureDate;
         event.DurationInMinutes = 30;
         insert event;
       
    }
    
    @isTest static void createEventOnContactTest() {
        Contact contact = [select id from contact where LastName='Test contact'];
        Booking__c booking = new Booking__c();
        booking.ContactId__c = contact.Id;
        try{
            insert booking;
        }catch(Exception e){
            
        }
        
        
        //system.assertEquals(data.numberDaysDueTask, 7, 'Expected output is same as actual output');
        //system.assertEquals(data.numberDaysDueEvent, 7, 'Expected output is same as actual output');
    }
}