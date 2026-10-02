public with sharing class caseController {
    @AuraEnabled
    
    public static case createCase(String subject, String status, String origin) {

        Case c = new Case();
        c.Subject = subject;
        c.Status = status;
        c.Origin = origin;
        insert c;
        return c;
        
    }

    @AuraEnabled(cacheable=true)
    public static List<Case> getCases(ID AccountId) {
        return [SELECT Id, Subject, Status, Origin FROM Case where AccountId=:AccountId LIMIT 5];
    }

    @AuraEnabled
    public static void escaltecaseRecords(ID AccountId){
     
        List<case> lstcase= new List<case>();
        lstcase=[select Id, Subject, Status, Origin from case where AccountId=:AccountId];
        for(case c : lstcase){
            c.Status='Escalated';
        }
        update lstcase;
    }
}