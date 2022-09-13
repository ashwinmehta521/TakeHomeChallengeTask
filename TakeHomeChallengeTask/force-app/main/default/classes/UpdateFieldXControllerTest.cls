@isTest(seeAllData=false)
public class UpdateFieldXControllerTest {

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
    
    @isTest static void updateFieldX() {
        Account account = [select id, FieldX__c from Account where Name = 'Test account'];
        account.FieldX__c = 'Test call';
        try{
            update account;
        }catch(Exception e){
            
        }
    }
}