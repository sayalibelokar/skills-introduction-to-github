public class ApexUseCase19 {
//Find the Type of Object Based on the recordId provided 
    public static string checkObjectType(Id recordId){
        string objectType ='';
        Map<string, Schema.SObjectType> globalDescMap = Schema.getGlobalDescribe();
        for(string eachString: globalDescMap.keySet()){
            string keyprefix = globalDescMap.get(eachString).getDescribe().getKeyPrefix();
            if(keyprefix != null){
                if(string.valueOf(recordId).startsWith(keyPrefix)){
                    objectType = eachString;
                } 
            }
        }
        return objectType;
    }
}