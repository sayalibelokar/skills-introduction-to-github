public class ApexUseCase10 {
    public static string checkPlantType(string plantName){
        string plantType = 'Not Specified';
        List<Plant_Information_Master__mdt> plantRecords =[Select id, MasterLabel, Plant_Type__c from Plant_Information_Master__mdt];
        for(Plant_Information_Master__mdt pRecords: plantRecords){
            if(pRecords.MasterLabel == plantName){
                return pRecords.Plant_Type__c;
            }
        }
        return plantType;
    }
        

}