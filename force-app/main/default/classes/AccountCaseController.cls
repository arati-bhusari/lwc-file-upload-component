public with sharing class AccountCaseController {
   @AuraEnabled
  
    public static Id createCaseForAccount(Id accountId, String subject, String description) {
      if(accountId == null){
            throw new AuraHandledException('Account ID cannot be null.');
      }

        Case newCase = new Case();
        newCase.AccountId = accountId;
        newCase.Subject = subject;
        newCase.Description = description;
        newCase.Status = 'New';
        newCase.Origin = 'Web';
        insert newCase;
        return newCase.Id;

    }
}