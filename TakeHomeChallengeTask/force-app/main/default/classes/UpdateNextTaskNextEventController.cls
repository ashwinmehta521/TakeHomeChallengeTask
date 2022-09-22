public with sharing class UpdateNextTaskNextEventController {

    public static void updateNextTaskInsert(List<Task> tasks){
        Set<Id> contactIds = new Set<Id>();
        List<Contact> contacts = new List<Contact>();
        for(Task task: tasks){
            contactIds.add(task.WhoId);
        }
        Date todayDate = date.today();
        contacts = [SELECT Id, NextTask__c FROM Contact where Id IN :contactIds WITH SECURITY_ENFORCED];
        for(Task task: tasks){
            for(Contact contact: contacts){
                if(task.WhoId == contact.Id && task.ActivityDate > todayDate){
                    contact.NextTask__c = task.Subject;
                }
            }
        }
        update contacts;
    }
    
    public static void updateNextTaskUpdate(List<Task> tasks){
        Set<Id> contactIds = new Set<Id>();
        List<Contact> contacts = new List<Contact>();
        for(Task task: tasks){
            contactIds.add(task.WhoId);
        }
        Date todayDate = date.today();
        contacts = [SELECT Id, NextTask__c FROM Contact where Id IN :contactIds WITH SECURITY_ENFORCED];
        for(Task task: tasks){
            for(Contact contact: contacts){
                if(task.WhoId == contact.Id && task.ActivityDate > todayDate){
                    contact.NextTask__c = task.Subject;
                }
            }
        }
        update contacts;
    }
    
    public static void updateNextTaskDelete(List<Task> tasksOld){
        system.debug('tasks'+tasksOld);
         Set<Id> contactIds = new Set<Id>();
        Set<Id> taskIds = new Set<Id>();
        List<Contact> contacts = new List<Contact>();
        List<Task> tasks = new List<Task>();
        for(Task task: tasksOld){
            contactIds.add(task.WhoId);
            taskIds.add(task.id);
        }
        contacts = [SELECT Id, NextTask__c FROM Contact where Id IN :contactIds WITH SECURITY_ENFORCED];
        Date todayDate = date.today();
        tasks = [SELECT Id, Subject, WhoId, ActivityDate FROM Task where WhoId IN :contactIds and Id NOT IN :taskIds and ActivityDate > :todayDate WITH SECURITY_ENFORCED];
        for(Task task: tasks){
            for(Contact contact: contacts){
                if(task.WhoId == contact.Id && task.ActivityDate > todayDate){
                    contact.NextTask__c = task.Subject;
                }
            }
        }
        update contacts;
    }
    
    public static void updateNextEventInsert(List<Event> events){
       Set<Id> contactIds = new Set<Id>();
        List<Contact> contacts = new List<Contact>();
        for(Event event: events){
            contactIds.add(event.WhoId);
        }
        Date todayDate = date.today();
        contacts = [SELECT Id, NextEvent__c FROM Contact where Id IN :contactIds WITH SECURITY_ENFORCED];
        for(Event event: events){
            for(Contact contact: contacts){
                if(event.WhoId == contact.Id && event.ActivityDate > todayDate){
                    contact.NextEvent__c = event.Subject;
                }
            }
        }
        update contacts;
    }
    
    public static void updateNextEventUpdate(List<Event> events){
       Set<Id> contactIds = new Set<Id>();
        List<Contact> contacts = new List<Contact>();
        for(Event event: events){
            contactIds.add(event.WhoId);
        }
        Date todayDate = date.today();
        contacts = [SELECT Id, NextEvent__c FROM Contact where Id IN :contactIds WITH SECURITY_ENFORCED];
        for(Event event: events){
            for(Contact contact: contacts){
                if(event.WhoId == contact.Id && event.ActivityDate > todayDate){
                    contact.NextEvent__c = event.Subject;
                }
            }
        }
        update contacts;
    }
    
    public static void updateNextEventDelete(List<Event> eventsOld){
       Set<Id> contactIds = new Set<Id>();
        Set<Id> eventIds = new Set<Id>();
        List<Contact> contacts = new List<Contact>();
        List<Event> events = new List<Event>();
        for(Event event: eventsOld){
            contactIds.add(event.WhoId);
            eventIds.add(event.id);
        }
        contacts = [SELECT Id, NextEvent__c FROM Contact where Id IN :contactIds WITH SECURITY_ENFORCED];
         Date todayDate = date.today();
        events = [SELECT Id, Subject, WhoId, ActivityDate FROM Event where WhoId IN :contactIds and Id NOT IN :eventIds and ActivityDate > :todayDate WITH SECURITY_ENFORCED];
        for(Event event: events){
            for(Contact contact: contacts){
                if(event.WhoId == contact.Id && event.ActivityDate > todayDate){
                    contact.NextEvent__c = event.Subject;
                }
            }
        }
        update contacts;
    }
}