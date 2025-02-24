trigger OpportunityTrigger on Opportunity (after update, before update) {
    if(trigger.isAfter && trigger.isUpdate){
        OpportunityTriggerHandler.handleAfterUpdate(Trigger.New);
    }
    if(trigger.isBefore && trigger.isUpdate){
         OpportunityTriggerHandler.handleBeforeUpdate(Trigger.New, Trigger.oldMap);
    }
}