public class ApexUseCase20 {
    public static string getloggedInUserDetails(){
        //Find logged in User's details. Details should include: User's Timezone, locale and last login date
        userInfoWrapper wrapper = new userInfoWrapper();
        //DateTime lastLoginInfo;
        //string localeInfo = UserInfo.getLocale();
        wrapper.localeInfo = UserInfo.getLocale();
        //string timezoneInfo = string.valueOf(UserInfo.getTimeZone());
        wrapper.timezoneInfo = string.valueOf(UserInfo.getTimeZone());
        string getUserId = UserInfo.getUserId();
        List<User> userRecord = [select id, LastLoginDate from User where id =: getUserId Limit 1];
        if(userRecord.size() != null){
            if(userRecord[0].LastLoginDate != null){
                //lastLoginInfo = userRecord[0].LastLoginDate; 
                wrapper.lastLoginInfo = userRecord[0].LastLoginDate;  
            }
        }
        //system.debug('localeInfo' + localeInfo);
        //system.debug('timezoneInfo' + timezoneInfo);
        //system.debug('lastLoginInfo' + lastLoginInfo);
        
        return JSON.serialize(wrapper);
    }
    
    public class userInfoWrapper{
        public DateTime lastLoginInfo;
        public string localeInfo;
        public string timezoneInfo;   
    }
    
}