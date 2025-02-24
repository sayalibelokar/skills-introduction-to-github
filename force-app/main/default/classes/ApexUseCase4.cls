public class ApexUseCase4 {
    public static List<string> getListOfContactEmails(string accName){
        List<string> emailList = new List<string>();
        List<Contact> conList = [select id, name, email, AccountId from Contact where Account.name =: accName];
        if(conList.size() > 0){
            for(Contact con: conList){
                if(con.Email!= null){
                    emailList.add(con.Email);
                }
            }
        }
        return emailList;
    }
}