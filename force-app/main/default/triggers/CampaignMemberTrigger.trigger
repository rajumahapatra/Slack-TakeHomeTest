/**
 * @description       : 
 * @author            : Raju Mahapatra
 * @group             : 
 * @last modified on  : 07-27-2021
 * @last modified by  : Raju Mahapatra
**/
trigger CampaignMemberTrigger on CampaignMember (after insert) {
    CampaignMemberTriggerHandler.handleAfterInsert(Trigger.newMap);
}