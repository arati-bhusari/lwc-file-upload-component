public with sharing class contactFetch {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactRecords(Id accountId, Integer limitSize, Integer offsetSize) {
        try {
             return [SELECT Id, Name, Email, Phone FROM Contact WHERE AccountId = :accountId ORDER BY Name LIMIT :limitSize OFFSET :offsetSize];
        
        } catch (Exception e) {
            throw new AuraHandledException('Error fetching contact records: ' + e.getMessage());
        }
       
    

    }
}