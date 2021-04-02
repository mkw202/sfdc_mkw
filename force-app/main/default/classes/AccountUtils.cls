public with sharing class AccountUtils {
    
    public static List<Account> accountsByState(String state) {
        List<Account> rets = [SELECT Id, Name FROM Account WHERE BillingState=:state];
        for(Account ret : rets){
            System.debug(ret.Id + ' ' + ret.Name);
        }
        return rets;
    }
}