trigger UpdateFieldXTrigger on Account (after update) {

    if(Trigger.isAfter && Trigger.isUpdate){
        Set<Id> accountIds = new Set<Id>();
        Set<Id> contactIds = new Set<Id>();
        List<Contact> contacts = new List<Contact>();
        List<Task> tasks = new List<Task>();
        List<Event> events = new List<Event>();
        for(Account account: Trigger.New){
            accountIds.add(account.Id);
        }
        contacts = [SELECT AccountId, Id, FieldX__c FROM Contact where AccountId IN :accountIds];
        for(Account account: Trigger.New){
            for(Contact contact: contacts){
                contactIds.add(contact.Id);
                if(contact.AccountId == account.Id){
                    contact.FieldX__c = account.FieldX__c;
                }
            }
        }
        tasks = [SELECT Id, WhoId, FieldX__c FROM Task where WhoId IN :contactIds];
        events = [SELECT Id, WhoId, FieldX__c FROM Event where WhoId IN :contactIds];
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