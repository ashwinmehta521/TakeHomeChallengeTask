trigger UpdateNextEventTrigger on Event (after insert, after update, after delete) {

    if(Trigger.isAfter && Trigger.isInsert){
        UpdateNextTaskNextEventController.updateNextEventInsert(Trigger.new);
    }
    
    if(Trigger.isAfter && Trigger.isUpdate){
        UpdateNextTaskNextEventController.updateNextEventUpdate(Trigger.new);
    }
    
    if(Trigger.isAfter && Trigger.isDelete){
        UpdateNextTaskNextEventController.updateNextEventDelete(Trigger.old);
    }
}