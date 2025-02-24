public class LeadTriggerHandler {
    public static void handleBeforeUpdate(List<Lead> newLeads){
        for(Lead leadRecord: newLeads){
            leadRecord.Status = 'Working-Contracted'; 
            if(leadRecord.Industry == 'Healthcare'){
                leadRecord.LeadSource = 'Purchased List';
                leadRecord.SICCode__c = '1100';
                leadRecord.Primary__c = 'Yes';
            }
        }
    }
    
    public static void handleAfterInsert(List<Lead> newLeads){
        List<Task> newTaskRecord = new List<Task>();
        for(Lead leadRecord: newLeads){
            Task createNewTask = new Task();
            createNewTask.Priority = 'High';
            createNewTask.OwnerId = leadRecord.OwnerId;
            createNewTask.Description = 'Owner to Follow up with Customer';
            createNewTask.Status = 'Not Started';
            createNewTask.Subject = 'Follow Up';
            createNewTask.WhoId = leadRecord.id; 
            newTaskRecord.add(createNewTask);
        }
        if(newTaskRecord.size() > 0){
            insert newTaskRecord;
        }
    }
    
    public static void handleBeforeDelete(List<Lead> oldLeads){
        for(Lead leadRec: oldLeads){
            system.debug('inside for loop');
            system.debug(leadRec.Status);
            if(leadRec.Status == 'Working-Contracted'){
                leadRec.addError('This lead cannot be deleted');
            }
        }
    }
}