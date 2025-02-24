public class ApexUseCase11 {
    public static string checkfullFormforAcronym(string Acronym){
        List<Acronym_Master__c> listFullForm =[Select id, Name, Full_Version__c from Acronym_Master__c where Name =:Acronym LIMIT 1];
        if(listFullForm.size() == 1){
            return listFullForm[0].Full_Version__c;
        }
      return 'Not Found';  
    }

}