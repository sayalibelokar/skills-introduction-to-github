trigger TaskTrigger on Task (before insert) {
    if(trigger.isInsert && trigger.isBefore){
        for(Task taskRecord: trigger.new){
            taskRecord.Priority = 'High';
        }
    }
}