trigger AccountTrigger on Account (after update, before update, after insert) {
    List<Opportunity> createNewOpty = new List<Opportunity>();
    if(trigger.isAfter && trigger.isUpdate){
        AccountTriggerHandler.handleAfterUpdate(Trigger.New, Trigger.oldMap);
        for(Account acc: Trigger.new){
            if(acc.Clone__c && !Trigger.oldMap.get(acc.id).Clone__c){
                Opportunity newOpty = new Opportunity();
                newOpty.Name = acc.name +'New Opportunity';
                newOpty.AccountId = acc.id;
                newOpty.StageName = 'Prospecting';
                newOpty.CloseDate = Date.today().addDays(20);
                createNewOpty.add(newOpty);
            }
        }
        if(!createNewOpty.isEmpty()){
            system.debug(createNewOpty);
            insert createNewOpty;
        }
    }
    
    if(trigger.isBefore && trigger.isUpdate){
        AccountTriggerHandler.handleBeforeUpdate(Trigger.New, Trigger.oldMap);
    }
    
    if(trigger.isAfter && trigger.isInsert){
        AccountTriggerHandler.handleAfterInsert(Trigger.New);
    }
}