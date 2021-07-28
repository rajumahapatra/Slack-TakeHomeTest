/**
 * @description       : 
 * @author            : Raju Mahapatra
 * @group             : 
 * @last modified on  : 07-28-2021
 * @last modified by  : Raju Mahapatra
**/
public with sharing class AccountUtil {
    
    public static void recalculateHierarchyACV(Set<Id> accountIds) {
        System.debug('In AccountUtil.recalculateHierarchyACV');
        List<Account> updateHierarchyACV = new List<Account>();
        List<Account> ultimateParentAccounts = [SELECT Id, ACV__c, (SELECT Id, ACV__c FROM Accounts__r) FROM Account WHERE Id IN :accountIds];
        for(Account acc : ultimateParentAccounts) {
            Decimal hierarchyACV = 0;
            if(acc.ACV__c != NULL) {
                hierarchyACV = hierarchyACV + acc.ACV__c;
            }
            for(Account childAcc : acc.Accounts__r) {
                if(childAcc.ACV__c != NULL) {
                    hierarchyACV = hierarchyACV + childAcc.ACV__c;
                }
            }
            // hierarchyACV = hierarchyACV / (acc.Accounts__r.size() + 1);
            acc.HierarchyACV__c = hierarchyACV;
            for(Account childAcc : acc.Accounts__r) {
                childAcc.HierarchyACV__c = hierarchyACV;
            }
            updateHierarchyACV.addAll(acc.Accounts__r);
        }
        updateHierarchyACV.addAll(ultimateParentAccounts);
        if(!updateHierarchyACV.isEmpty()) {
            try {
                update updateHierarchyACV;
            }
            catch(Exception e) {
                System.debug('Exception Occured while updating Accounts: ' + e.getMessage() + ' ' + e.getStackTraceString());
            }
        }
    }

}
