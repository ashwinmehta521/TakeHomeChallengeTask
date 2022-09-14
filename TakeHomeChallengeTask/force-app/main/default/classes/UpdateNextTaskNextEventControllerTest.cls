@isTest(seeAllData=false)
public class UpdateNextTaskNextEventControllerTest {

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
        
        //create task
        Date todayDate = date.today();
        Date futureDate = todayDate.addDays(7);
        Task task = new Task();
        task.WhoId = contact.Id;
        task.Subject = 'Test task test';
        task.ActivityDate = futureDate;
        task.OwnerId = UserInfo.getUserId();
        insert task;
        
        //create event
         Event event = new Event();
         event.WhoId = contact.Id;
         event.OwnerId = UserInfo.getUserId();
         event.Subject = 'Test event test'; 
         event.ActivityDate = futureDate;
         event.ActivityDateTime = futureDate;
         event.DurationInMinutes = 30;
         insert event;
    }
    
    @isTest static void updateNextTaskInsertTest() {
        Contact contact = [select id from contact where LastName='Test contact'];
        //create task
        Date todayDate = date.today();
        Date futureDate = todayDate.addDays(7);
        Task task = new Task();
        task.WhoId = contact.Id;
        task.Subject = 'Test task creation';
        task.ActivityDate = futureDate;
        task.OwnerId = UserInfo.getUserId();
        insert task;
    }
    
    @isTest static void updateNextTaskUpdateTest() {
        Contact contact = [select id from contact where LastName='Test contact'];
        //create task
        Date todayDate = date.today();
        Date futureDate = todayDate.addDays(7);
        Task task = new Task();
        task.WhoId = contact.Id;
        task.Subject = 'Test task creation';
        task.ActivityDate = futureDate;
        task.OwnerId = UserInfo.getUserId();
        insert task;
        
        task.Subject = 'Test task';
        update task;
    }
    
    @isTest static void updateNextEventInsertTest() {
        Contact contact = [select id from contact where LastName='Test contact'];
        //create task
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
    
    @isTest static void updateNextEventUpdateTest() {
        Contact contact = [select id from contact where LastName='Test contact'];
        //create task
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
        
        event.Subject = 'Test event'; 
        update event;
    }
    
     @isTest static void updateNextTaskDeleteTest() {
        Contact contact = [select id from contact where LastName='Test contact'];
        //create task
        Task task = [select id from task where Subject = 'Test task test' limit 1];
        delete task;
    }
    
    @isTest static void updateNextEventTest() {
        Contact contact = [select id from contact where LastName='Test contact'];
        //create task
        Event event = [select id from event where Subject = 'Test event test' limit 1];
        delete event;
    }
}