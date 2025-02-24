public class AccountTriggerHandler {
    public static void handleBeforeUpdate(List<Account> newRec, Map<Id,Account> oldMap){
        for(Account acc: newRec){
            if(acc.Industry == 'Agriculture' && acc.Type == 'Prospect'){
                if(acc.Ownership != oldMap.get(acc.Id).Ownership && acc.Ownership == 'Private'){
                    acc.addError('Ownership Cannot be Changed');
                }
            }
        }
    }
    
    public static void handleAfterUpdate(List<Account> newRec, Map<Id,Account> oldMap){
        List<Contact> contactList = new List<Contact>();
        Map<Id,String> mapAccToAddChildren = new Map<Id,String>();
        for(Account acc: newRec){
            if(acc.Website != oldMap.get(acc.id).Website){
                mapAccToAddChildren.put(acc.id, acc.Website);
            }
            
            if(mapAccToAddChildren.keyset().size() > 0){
                List<Contact> conToUpdate = new List<Contact>();
                List<Contact> conList = [Select id, name, AccountId,Website__c from Contact where AccountId IN: mapAccToAddChildren.keyset()];
                for(Contact con: conList){
                    con.Website__c = mapAccToAddChildren.get(con.AccountId);
                    conToUpdate.add(con);
                }
                if(conToUpdate.size() > 0){
                    update conToUpdate;
                }
            }
            
            if(acc.Create_N_Contacts__c != oldMap.get(acc.Id).Create_N_Contacts__c){
                for(integer i = 0; i < acc.Create_N_Contacts__c; i++){
                    Contact con = new Contact();
                    con.LastName = acc.Name + ' ' + i;
                    con.AccountId = acc.Id;
                    contactList.add(con);
                } 
            } 
        }
        if(contactList.size() > 0){
            update contactList;
        }
    }
    /* List<Contact> conToInsert = new List<Contact>();
        for (Account accRecord : newAccounts){
            
            if (accRecord.Create_N_Contacts__c != oldAccMap.get(accRecord.Id).Create_N_Contacts__c && accRecord.Create_N_Contacts__c != null){
                List<Contact> conToDelete = [SELECT id, Firstname, Lastname, AccountId
                                             FROM Contact
                                             where AccountId = :accRecord.Id];
                delete conToDelete;
                for (Integer i = 0; i < accRecord.Create_N_Contacts__c; i++){
                    Contact con = new Contact();
                    con.Lastname = accRecord.Name + i;
                    con.AccountId = accRecord.Id;
                    conToInsert.add(con);
                }
            }
        }
        if (!conToInsert.isEmpty()){
            insert conToInsert;
        } */
    public static void handleAfterInsert(List<Account> newRec){
        List<Contact> conList = new List<Contact>();
        for(Account accRec: newRec){
            if(accRec.Create_N_Contacts__c != null){
                for(integer i = 0; i < accRec.Create_N_Contacts__c; i++){
                    Contact con = new Contact();
                    con.LastName = accRec.Name + ' ' + i;
                    con.AccountId = accRec.Id;
                    conList.add(con);
                } 
            } 
        }
        insert conList;
    }
    
}