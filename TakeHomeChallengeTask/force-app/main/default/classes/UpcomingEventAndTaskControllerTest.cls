@isTest(seeAllData=false)
public class UpcomingEventAndTaskControllerTest {

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
        //create task
        Task task = new Task();
        task.WhoId = contact.Id;
        task.Subject = 'Test task creation';
        task.ActivityDate = futureDate;
        task.OwnerId = UserInfo.getUserId();
        insert task;
    }
    
    @isTest static void findUpcomingTaskAndEventTestWithContact() {
        Contact contact = [select id from contact where LastName='Test contact'];
        UpcomingEventAndTaskController.SendData  data = UpcomingEventAndTaskController.findUpcomingTaskAndEvent(contact.Id);
        system.assertEquals(data.numberDaysDueTask, 7, 'Expected output is same as actual output');
        system.assertEquals(data.numberDaysDueEvent, 7, 'Expected output is same as actual output');
    }
    
    @isTest static void findUpcomingTaskAndEventTestWithBlankContact() {
        Contact contact = [select id from contact where LastName='Test contact'];
        UpcomingEventAndTaskController.SendData  data = UpcomingEventAndTaskController.findUpcomingTaskAndEvent('   ');
        system.assertEquals(data, null, 'Expected output is same as actual output');
    }
    
}