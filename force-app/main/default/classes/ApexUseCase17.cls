public class ApexUseCase17 {
    public static List<Integer> findMinAndMax(List<Integer> lstInteger){
        //write a method to find min and max number from a list
        List<Integer> lstMaxMinInteger = new List<Integer>();
        Integer minValue = lstInteger[0];
        Integer maxValue = lstInteger[0];
        for(Integer num:lstInteger){
            if(num < minValue){
                minValue = num;
            }
            if(num >= maxValue){
                maxValue = num;
            }
        }
        lstMaxMinInteger.add(minValue);
        lstMaxMinInteger.add(maxValue);
        return lstMaxMinInteger;
    }
}