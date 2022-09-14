trigger UpdateNextTaskTrigger on Task (after insert, after update, before delete) {

    if(Trigger.isAfter && Trigger.isInsert){
        UpdateNextTaskNextEventController.updateNextTaskInsert(Trigger.new);
    }
    
    if(Trigger.isAfter && Trigger.isUpdate){
        UpdateNextTaskNextEventController.updateNextTaskUpdate(Trigger.new);
    }
    
    if(Trigger.isBefore && Trigger.isDelete){
       UpdateNextTaskNextEventController.updateNextTaskDelete(Trigger.old);
    }
}