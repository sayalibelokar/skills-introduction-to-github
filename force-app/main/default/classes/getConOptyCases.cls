public class getConOptyCases {
    public static void getContactOptyCaseFromAccount(List<string> accId){
        List<Account> accRecs = [Select id, Name, (Select id,Name from Contacts), (Select id, Name from Opportunities), (Select id from Cases) from Account where id =:accId]; 
        system.debug('acc'+ accRecs);
        for(Account acc: accRecs){
        if(acc.Opportunities != null){
            for(Opportunity opp: acc.Opportunities){
                system.debug('Opp Id' + opp.Id);
            }
        }
        if(acc.Contacts != null){
            for(Contact con: acc.Contacts){
                system.debug('Con Id' + con.Id);
            }
        }
            if(acc.Cases != null){
                for(Case caseRec: acc.Cases){
                    system.debug('Case Id' + caseRec.Id);
                }
            }
        }
        }
    }