public class ContactTriggerHandler {
    public static void handleBeforeInsert(List<Contact> conRec){
        for(Contact con: conRec){
            if(con.AccountId == null){
                con.addError('Parent Information is Mandatory for creating the Contact');
            }
        }
    }
}