trigger SendEmailConfirmation on Session_Speaker__c (after insert) {

    for(Session_Speaker__c newItem : trigger.new) {
        Session_Speaker__c sessionSpeaker = 
            [ select	Session__r.Name,
             			Session__r.Session_Date__c,
             			Speaker__r.First_Name__c,
             			Speaker__r.Last_Name__c,
             			Speaker__r.Email__c from
             			Session_Speaker__c where Id=:newItem.Id
            ];
        if(sessionSpeaker.Speaker__r.Email__c != null) {
            String address = sessionSpeaker.Speaker__r.Email__c;
        }
 
    }
}