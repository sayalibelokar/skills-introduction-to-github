public class ApexUseCase13 {
    public static string generateFirstandLastName(String empEmail){
        string fullName='';
        string extractedName = empEmail.substringbefore('@');
        //1st solution
        /*   List<String> lstSplittedName = extractedName.split('_');
if(extractedName != null){
if(lstSplittedName.size() == 2){
fullName = lstSplittedName[0] + ' '+ lstSplittedName[1];
}
}*/
        
        //2nd solution
        if(extractedName.contains('_')){
            fullName = extractedName.replace('_',' ');
        }
        return fullName;
    }
}