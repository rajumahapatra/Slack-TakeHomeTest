/**
 * @description       : 
 * @author            : Raju Mahapatra
 * @group             : 
 * @last modified on  : 07-28-2021
 * @last modified by  : Raju Mahapatra
**/
public with sharing class CampaignMemberTriggerHandler {
    public static void handleAfterInsert(Map<Id, CampaignMember> campaignMemberNewMap) {
        CampaignMemberAfterInsertHandler.populateRecentCampaign(campaignMemberNewMap);
    }
}
