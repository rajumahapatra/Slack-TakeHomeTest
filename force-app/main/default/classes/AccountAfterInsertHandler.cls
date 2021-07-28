/**
 * @description       : 
 * @author            : Raju Mahapatra
 * @group             : 
 * @last modified on  : 07-28-2021
 * @last modified by  : Raju Mahapatra
**/
public with sharing class AccountAfterInsertHandler {
    public static void handleACVPopulation(Map<Id, Account> newAccountsMap) {
        Set<Id> ultimateParentAccountIds = new Set<Id>();
        for(Account newAcc : newAccountsMap.values()) {
            if(newAcc.ACV__c != NULL) {
                if(newAcc.UltimateParentAccount__c != NULL) {
                    ultimateParentAccountIds.add(newAcc.UltimateParentAccount__c);
                } 
                else {
                    ultimateParentAccountIds.add(newAcc.Id);
                }
            }
        }
        if(!ultimateParentAccountIds.isEmpty()) {
            AccountUtil.recalculateHierarchyACV(ultimateParentAccountIds);
        }
    }
}
