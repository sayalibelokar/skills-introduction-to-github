public class ApexUseCase2 {
    public static Decimal calculateSimpleInterest(Decimal principal, Decimal interest, integer years){
        if(principal!= null && interest!= null && years!=null){
            Decimal simpleInterest = (principal*interest*years)/100;
            return simpleInterest;
        }
        return 0;
    }
    
}