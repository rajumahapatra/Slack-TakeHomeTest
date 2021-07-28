/**
 * @description       : 
 * @author            : Raju Mahapatra
 * @group             : 
 * @last modified on  : 07-28-2021
 * @last modified by  : Raju Mahapatra
**/
public with sharing class AccountAfterUpdateHandler {
    
    public static void handleACVChange(Map<Id, Account> newAccountsMap, Map<Id, Account> oldAccountsMap) {
        Set<Id> acvChangedUltimateParentAccountIds = new Set<Id>();
        List<Account> upaRemovedAccounts = new List<Account>();
        for(Account acc : newAccountsMap.values()) {
            if((acc.ACV__c != oldAccountsMap.get(acc.Id).ACV__c) || (acc.UltimateParentAccount__c != oldAccountsMap.get(acc.Id).UltimateParentAccount__c)) {
                if(acc.UltimateParentAccount__c != NULL) {
                    acvChangedUltimateParentAccountIds.add(acc.UltimateParentAccount__c);
                }
                else if(acc.UltimateParentAccount__c == NULL) {
                    Account upAcc = new Account(Id = acc.Id, HierarchyACV__c = NULL);
                    upaRemovedAccounts.add(upAcc);
                }
                else {
                    acvChangedUltimateParentAccountIds.add(acc.Id);
                }
            }
        }
        if(acvChangedUltimateParentAccountIds.size() > 0) {
            AccountUtil.recalculateHierarchyACV(acvChangedUltimateParentAccountIds);
        }
        if(!upaRemovedAccounts.isEmpty()) {
            try {
                update upaRemovedAccounts;
            }
            catch(Exception e) {
                System.debug('Exception Occured while updating Accounts: ' + e.getMessage() + ' ' + e.getStackTraceString());
            }
        }
    }
}
