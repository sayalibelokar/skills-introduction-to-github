trigger LeadTrigger on Lead (before update, after insert,before delete){
    if(trigger.isBefore && trigger.isUpdate){
       LeadTriggerHandler.handleBeforeUpdate(Trigger.New);
    }
    
    if(trigger.isAfter && trigger.isInsert){
        LeadTriggerHandler.handleAfterInsert(Trigger.New);
}
    if(trigger.isBefore && trigger.isDelete){
        LeadTriggerHandler.handleBeforeDelete(Trigger.Old);
}
}