/**
 * @description       : 
 * @author            : Raju Mahapatra
 * @group             : 
 * @last modified on  : 07-28-2021
 * @last modified by  : Raju Mahapatra
**/
@isTest
public with sharing class CampaignMemberAfterInsertHandler_Test {
    
    @TestSetup
    static void makeData() {
        
        // create test contact records
        List<Contact> contacts = TestDataFactory.getTestContacts(2);
        
        // create test lead records
        List<Lead> leads = TestDataFactory.getTestLeads(2);
        
        // get test Campaign records
        Campaign newCampaign = TestDataFactory.getTestCampaigns(1)[0];

        // insert the test data
        List<sObject> testRecords = new List<sObject>();
        testRecords.addAll(contacts);
        testRecords.addAll(leads);
        testRecords.add(newCampaign);
        insert testRecords;
    }
    
    @isTest
    static void populateRecentCampaign_Test() {
        List<Contact> contacts = [SELECT Id FROM Contact];
        List<Lead> leads = [SELECT Id FROM Lead];
        Campaign newCampaign = [SELECT Id FROM Campaign][0];
        CampaignMember member1 = new CampaignMember(CampaignId = newCampaign.Id, ContactId = contacts[0].Id);
        CampaignMember member2 = new CampaignMember(CampaignId = newCampaign.Id, LeadId = leads[0].Id);
        CampaignMember member3 = new CampaignMember(CampaignId = newCampaign.Id, ContactId = contacts[1].Id, LeadId=leads[1].Id);
        Test.startTest();
        insert new List<CampaignMember> { member1, member2, member3 };
        System.assertEquals(2, [SELECT count() FROM Contact WHERE Recent_Campaign__c = :newCampaign.Id], 'Two Contacts should have been populated with Recent Campaign');
        System.assertEquals(2, [SELECT count() FROM Lead WHERE Recent_Campaign__c = :newCampaign.Id], 'Two Leads should have been populated with Recent Campaign');
        Test.stopTest();
    }
}
