trigger CaseTrigger on Case (before insert) {
    if(trigger.isBefore && trigger.isInsert){
        for(Case caseRecords: Trigger.NEW){
            if(caseRecords.Origin == 'Phone'){
                caseRecords.Priority = 'High';
            }
            else{
                caseRecords.Priority ='Low';
            }
            
        }
    }
}