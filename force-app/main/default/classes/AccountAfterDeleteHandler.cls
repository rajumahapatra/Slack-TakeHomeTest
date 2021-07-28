/**
 * @description       : 
 * @author            : Raju Mahapatra
 * @group             : 
 * @last modified on  : 07-28-2021
 * @last modified by  : Raju Mahapatra
**/
public with sharing class AccountAfterDeleteHandler {
    
    public static void handleACVRemoval(Map<Id, Account> oldAccountsMap) {
        Set<Id> acvRemovedAccountsUPAAccountIds = new Set<Id>();
        for(Account oldAcc : oldAccountsMap.values()) {
            if(oldAcc.UltimateParentAccount__c != NULL) {
                System.debug('UPA exists');
                acvRemovedAccountsUPAAccountIds.add(oldAcc.UltimateParentAccount__c);
            }
        }
        if(!acvRemovedAccountsUPAAccountIds.isEmpty()) {
            AccountUtil.recalculateHierarchyACV(acvRemovedAccountsUPAAccountIds);
        }
    }

}
