public with sharing class UpdateFieldXController {

    public static void updateFieldX(List<Account> accounts){
        Set<Id> accountIds = new Set<Id>();
        Set<Id> contactIds = new Set<Id>();
        List<Contact> contacts = new List<Contact>();
        List<Task> tasks = new List<Task>();
        List<Event> events = new List<Event>();
        for(Account account: accounts){
            accountIds.add(account.Id);
        }
        contacts = [SELECT AccountId, Id, FieldX__c FROM Contact where AccountId IN :accountIds WITH SECURITY_ENFORCED];
        for(Account account: accounts){
            for(Contact contact: contacts){
                contactIds.add(contact.Id);
                if(contact.AccountId == account.Id){
                    contact.FieldX__c = account.FieldX__c;
                }
            }
        }
        tasks = [SELECT Id, WhoId, FieldX__c FROM Task where WhoId IN :contactIds WITH SECURITY_ENFORCED];
        events = [SELECT Id, WhoId, FieldX__c FROM Event where WhoId IN :contactIds WITH SECURITY_ENFORCED];
        for(Contact contact: contacts){
            for(Task task: tasks){
                 if(task.WhoId == contact.Id){
                    task.FieldX__c = contact.FieldX__c;
                }
            }
           for(Event event: events){
                 if(event.WhoId == contact.Id){
                    event.FieldX__c = contact.FieldX__c;
                }
           }
        }
        update contacts;
        update tasks;
        update events;
    }
}