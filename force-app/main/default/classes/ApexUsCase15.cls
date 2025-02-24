public class ApexUsCase15 {
    public static string returnReversedString(string sentence){
        if(sentence != null){
        string reversedSentense = sentence.reverse();    
        return reversedSentense;
        }
        return null;
    }

}