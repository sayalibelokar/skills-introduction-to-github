public class ApexUseCase3 {
    public static void sendEmailToCustomer(string emailAddress){
        if(!string.isBlank(emailAddress)){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            List<string> toEmailAddressList = new List<string>();
            toEmailAddressList.add(emailAddress);
            mail.setSubject('Urgent- Take a Look');
            mail.setPlainTextBody('Hi, This is a email from Apex');
            mail.setToAddresses(toEmailAddressList);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            
        }
    }
}