public class ApexUseCase14 {
    public static List<integer> returnFibonaccisequence(integer endNumber){
        List<integer> lstFibonacciSeries = new List<Integer>();
        integer m= 0, n=1;
        lstFibonacciSeries.add(m);
        lstFibonacciSeries.add(n);
        for(integer i =0; i<= endNumber; i++){
            Integer nextNumber = m + n;
             if(nextNumber >= endNumber){
                break;
            }
            m= n;
            n= nextNumber;
            lstFibonacciSeries.add(nextNumber);
        }
        return lstFibonacciSeries;
    }
//
}