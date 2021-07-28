/**
 * @description       : 
 * @author            : Raju Mahapatra
 * @group             : 
 * @last modified on  : 07-28-2021
 * @last modified by  : Raju Mahapatra
**/
@isTest
public with sharing class TestDataFactory {
    
    public static List<Contact> getTestContacts(Integer numberOfContacts) {
        List<Contact> testContactRecords = new List<Contact>();
        for(Integer counter = 1; counter <= numberOfContacts ; counter++) {
            Contact thisContact = new Contact(LastName = 'DummyContact' + counter, Email = 'dummyemail@' + counter + '.domain');
            testContactRecords.add(thisContact);
        }
        return testContactRecords;
    }
    
    public static List<Lead> getTestLeads(Integer numberOfLeads) {
        List<Lead> testLeadRecords = new List<Lead>();
        for(Integer counter = 1; counter <= numberOfLeads ; counter++) {
            Lead thisLead = new Lead(LastName = 'DummyLead' + counter, Email = 'dummyemail@' + counter + '.domain', Company='DummyCompany' + counter);
            testLeadRecords.add(thisLead);
        }
        return testLeadRecords;
    }

    public static List<Campaign> getTestCampaigns(Integer numberOfCampaigns) {
        List<Campaign> testCampaignRecords = new List<Campaign>();
        for(Integer counter = 1; counter <= numberOfCampaigns ; counter++) {
            Campaign thisCampaign = new Campaign(Name = 'DummyCampaign' + counter);
            testCampaignRecords.add(thisCampaign);
        }
        return testCampaignRecords;
    }

}
