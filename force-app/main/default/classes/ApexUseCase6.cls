public class ApexUseCase6 {
    public static boolean checkIfPersonCanVote(Date birthDate){
        Date todaysDate = system.today();
        Integer numberDaysDue = (birthDate.daysBetween(todaysDate))/365;
        if(numberDaysDue >= 18){
            return true;
        }
        return false;
    }
}