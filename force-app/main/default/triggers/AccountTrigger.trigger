/**
 * @description       : 
 * @author            : Raju Mahapatra
 * @group             : 
 * @last modified on  : 07-28-2021
 * @last modified by  : Raju Mahapatra
**/
trigger AccountTrigger on Account (after update, after insert, after delete, before delete) {
    
    if(Trigger.isAfter) {
        if(Trigger.isUpdate) {
            AccountTriggerHandler.handleAfterUpdate(Trigger.newMap, Trigger.oldMap);
        }
        if(Trigger.isInsert) {
            AccountTriggerHandler.handleAfterInsert(Trigger.newMap);
        }
        if(Trigger.isDelete) {
            AccountTriggerHandler.handleAfterDelete(Trigger.oldMap);
        }
    }

    if(Trigger.isBefore) {
        if(Trigger.isDelete) {
            AccountTriggerHandler.handleBeforeDelete(Trigger.oldMap);
        }
    }
}