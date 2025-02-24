public class ApexUseCase12 {
    public static List<Task> identifyLastFiveTask(){
        return [Select id from Task where createddate = TODAY ORDER By CreatedDate DESC LIMIT 5];
    }

}