/**
 * @description       : 
 * @author            : Raju Mahapatra
 * @group             : 
 * @last modified on  : 07-28-2021
 * @last modified by  : Raju Mahapatra
**/
public with sharing class AccountBeforeDeleteHandler {
    
    public static void handleUPADeletion(Map<Id, Account> oldAccountsMap) {
        Boolean isModified = false;
        List<Account> childAccounts = [SELECT Id, HierarchyACV__c FROM Account WHERE UltimateParentAccount__c IN :oldAccountsMap.keySet()];
        for(Account acc : childAccounts) {
            if(acc.HierarchyACV__c != NULL) {
                acc.HierarchyACV__c = NULL;
                isModified = true;
            }
        }
        System.debug('childAccounts: ' + childAccounts);
        if(isModified) {
            try {
                update childAccounts;
            }
            catch(Exception e) {
                System.debug('Exception Occured while updating Accounts: ' + e.getMessage() + ' ' + e.getStackTraceString());
            }
        }
    }
}
