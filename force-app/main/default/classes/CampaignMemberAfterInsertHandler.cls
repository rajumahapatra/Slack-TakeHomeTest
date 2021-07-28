/**
 * @description       : 
 * @author            : Raju Mahapatra
 * @group             : 
 * @last modified on  : 07-28-2021
 * @last modified by  : Raju Mahapatra
**/
public with sharing class CampaignMemberAfterInsertHandler {
    public static void populateRecentCampaign(Map<Id, CampaignMember> campaignMemberNewMap) {
        Set<sObject> recordsToUpdate = new Set<sObject>();
        for(CampaignMember thisCampaignMember : [SELECT Id, LeadId, ContactId, CampaignId FROM CampaignMember WHERE Id IN :campaignMemberNewMap.keySet()  AND (LeadId != NULL OR CampaignId != NULL)]) {
            if(thisCampaignMember.LeadId != NULL) {
                recordsToUpdate.add(new Lead(Id = thisCampaignMember.LeadId, Recent_Campaign__c = thisCampaignMember.CampaignId));
            }
            if(thisCampaignMember.ContactId != NULL) {
                recordsToUpdate.add(new Contact(Id = thisCampaignMember.ContactId, Recent_Campaign__c = thisCampaignMember.CampaignId));
            }
        }
        List<sObject> listToUpdate = new List<sObject>(recordsToUpdate);
        if(!listToUpdate.isEmpty()) {
            try {
                update listToUpdate;
            }
            catch(Exception e) {
                System.debug('Exception Occured while updating Contact or Lead: ' + e.getMessage() + ' ' + e.getStackTraceString());
            }
        }
    }
}
