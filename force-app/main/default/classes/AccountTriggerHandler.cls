/**
 * @description       : 
 * @author            : Raju Mahapatra
 * @group             : 
 * @last modified on  : 07-28-2021
 * @last modified by  : Raju Mahapatra
**/
public with sharing class AccountTriggerHandler {
    
    public static void handleAfterUpdate(Map<Id, Account> newAccountsMap, Map<Id, Account> oldAccountsMap) {
        AccountAfterUpdateHandler.handleACVChange(newAccountsMap, oldAccountsMap);
    }
    
    public static void handleAfterInsert(Map<Id, Account> newAccountsMap) {
        AccountAfterInsertHandler.handleACVPopulation(newAccountsMap);
    }

    public static void handleAfterDelete(Map<Id, Account> oldAccountsMap) {
        System.debug('In handleAfterDelete');
        AccountAfterDeleteHandler.handleACVRemoval(oldAccountsMap);
    }

    public static void handleBeforeDelete(Map<Id, Account> oldAccountsMap) {
        System.debug('Account Before Delete context');
        AccountBeforeDeleteHandler.handleUPADeletion(oldAccountsMap);
    }
}
