public class ApexUseCase8 {
    public static boolean checkIfDivisible(integer inputNumber){
        if(inputNumber != null){
            if(math.mod(inputNumber, 7) == 0 && math.mod(inputNumber, 11) == 0){
                return true;
            }
        }
         return false;
    }
}