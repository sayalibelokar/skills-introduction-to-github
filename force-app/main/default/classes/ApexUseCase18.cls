public class ApexUseCase18 {
    public static list<Object> returnContactsAndAccounts(){
        //Find the last 10 Accounts and contact records created in last 24 hours
        list<Object> lstObj = new list<Object>();
        list<Account> lstAccount = [Select id, Name from Account where CreatedDate = TODAY ORDER BY CreatedDate DESC LIMIT 10];
        list<Contact> lstContact = [Select id, Name from Contact where CreatedDate = TODAY ORDER BY CreatedDate DESC LIMIT 10];
    
        if(lstAccount.size() > 0){
            lstObj.addall(lstAccount);            
        }
        
        if(lstContact.size() > 0){
            lstObj.addall(lstContact);            
        }
        return lstObj;
    }
//where CreatedDate = TODAY
}