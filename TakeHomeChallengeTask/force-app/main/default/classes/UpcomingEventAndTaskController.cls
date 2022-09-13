public class UpcomingEventAndTaskController {

    @AuraEnabled(cacheable=true)
    public static SendData findUpcomingTaskAndEvent(String contactId)
    {
        if(String.isNotBlank(contactId)){
            List<Task> tasks = new List<Task>();
            Map<Integer, Task> dateDifferenceTaskMap = new Map<Integer, Task>();
            Set<Integer> daysSet = new Set<Integer>();
            SendData sendData = new SendData();
            Task UpcomingTask = new Task();
            List<Event> events = new List<Event>();
            Map<Integer, Event> dateDifferenceEventMap = new Map<Integer, Event>();
            Set<Integer> daysEventSet = new Set<Integer>();
            Event UpcomingEvent = new Event();
            Date todayDate = date.today();
            tasks = [SELECT Id, WhoId, WhatId, 
                     ActivityDate, Subject 
                     FROM Task 
                     where WhoId= :contactId];
            events = [SELECT Id, WhoId, WhatId, 
                      ActivityDate, Subject 
                      FROM Event 
                      where WhoId= :contactId];
            for(Task task: tasks){
                if(todayDate < task.ActivityDate){
                    Integer numberDaysDue = todayDate.daysBetween(task.ActivityDate);
                    dateDifferenceTaskMap.put(numberDaysDue, task);
                    system.debug(dateDifferenceTaskMap);
                }
            }
            if(!dateDifferenceTaskMap.isEmpty()){
                daysSet = dateDifferenceTaskMap.keySet();
                List<Integer> daysList = new List<Integer>(daysSet);
                daysList.sort();
                system.debug(daysList);
                system.debug(daysList[0]);
                sendData.numberDaysDueTask = daysList[0];
                sendData.Task = dateDifferenceTaskMap.get(daysList[0]);
            }
            for(Event event: events){
                if(todayDate < Event.ActivityDate){
                    Integer numberDaysDue = todayDate.daysBetween(event.ActivityDate);
                    dateDifferenceEventMap.put(numberDaysDue, event);
                    system.debug(dateDifferenceEventMap);
                }
            }
            if(!dateDifferenceEventMap.isEmpty()){
                daysEventSet = dateDifferenceEventMap.keySet();
                List<Integer> daysEventList = new List<Integer>(daysEventSet);
                daysEventList.sort();
                system.debug(daysEventList);
                system.debug(daysEventList[0]);
                sendData.numberDaysDueEvent = daysEventList[0];
                sendData.event = dateDifferenceEventMap.get(daysEventList[0]);
            }
            return sendData;
        }
        else{
            return null;
        }
    }
    
    public class SendData{
        @AuraEnabled
        public Integer numberDaysDueTask {get; set;}
        @AuraEnabled
        public Task task {get; set;}
         @AuraEnabled
        public Integer numberDaysDueEvent {get; set;}
        @AuraEnabled
        public Event event {get; set;}
    }
    
}