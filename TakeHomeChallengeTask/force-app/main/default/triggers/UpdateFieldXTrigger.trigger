trigger UpdateFieldXTrigger on Account (after update) {

    if(Trigger.isAfter && Trigger.isUpdate){
        UpdateFieldXController.updateFieldX(trigger.new);
    }
}