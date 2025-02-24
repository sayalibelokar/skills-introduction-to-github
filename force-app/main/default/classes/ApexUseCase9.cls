public class ApexUseCase9 {
    public static string checkGnerationType(integer birthYear){
        string generationType;
        if(birthYear != null){
            if(birthYear >= 1980 && birthYear <= 1994){
                generationType = 'Millenial';
            }
            else if(birthYear >= 1995 && birthYear <= 2009){
               generationType ='Gen Z'; 
            }
            else if(birthYear >= 2010 && birthYear <= 2024){
                generationType = 'Gen Alpha';
            }
        }
        return generationType;
    }

}