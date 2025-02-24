public class OpportunityTriggerHandler {
    public static void handleAfterUpdate(List<Opportunity> opp){
        list<Task> listTasksToInsert = new List<Task>(); 
        for(Opportunity oppRec: opp){
            if(oppRec.StageName == 'Closed Won'){
                Task createNewTask = new Task();
                createNewTask.Priority = 'High';
                createNewTask.OwnerId = oppRec.OwnerId;
                createNewTask.Description = 'Split the revenue amongst the team members';
                createNewTask.Status = 'Not Started';
                createNewTask.Subject = 'Split Revenue';
                createNewTask.WhatId = oppRec.id;     
                listTasksToInsert.add(createNewTask);
            }
        }
        if(listTasksToInsert.size() > 0){
            insert listTasksToInsert;
        }
    }
    
    public static void handleBeforeUpdate(List<Opportunity> oppRecords, Map<Id,Opportunity> oldMap){
        for(Opportunity opp: oppRecords){
            if(opp.StageName != oldMap.get(opp.Id).StageName){
                opp.Amount = opp.Probability * opp.ExpectedRevenue;
            }
        }
    }
}