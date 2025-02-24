public class ApexUseCase1 {
    public static void CreateNewContact(string firstName, string lastName, string email){
        
        if(firstName != null && lastName != null && email != null){
            List<contact> conToInsert = new List<contact>();
            contact con = new contact();
            con.FirstName = firstName;
            con.LastName = lastName;
            con.Email = email;
            conToInsert.add(con);
            if(conToInsert.size() > 0){
              insert con;   
            }
           
        }
        
        
    }
    
}