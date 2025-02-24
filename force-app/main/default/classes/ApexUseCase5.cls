public class ApexUseCase5 {
    public static boolean checkParentChildCombo(string acctName, string conName){
        List<contact> conRecords = [select Id,Name,Account.name from Contact where name =: conName AND Account.name =: acctName];
        if(conRecords.size() > 0){
            return true;
        }
        return false;
    }
}