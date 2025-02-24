public class ApexUseCase16 {
    public static integer returnSum(integer endNumber){
        integer totalSum = 0;
        for(integer i=1; i<= endNumber; i++){
            totalSum += i;
        }
        return totalSum;
    }
        

}