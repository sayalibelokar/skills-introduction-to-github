public class ApexUseCase7 {
    public static Decimal splitBill(Integer numberOfPeople, decimal bill){
        decimal splitPerPerson = 0; 
        if(bill != null){
        splitPerPerson=  bill/numberOfPeople;
        } 
        return splitPerPerson;
    }

}