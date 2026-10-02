public with sharing class AccountController {
    public static List<Account> getAllActiveAccounts() {
      return [SELECT Id, Name, Active__c FROM Account WHERE Active__c = 'Yes' WITH SECURITY_ENFORCED];
    }
   

    @AuraEnabled
    public static void createAccountPeginationRecords(Integer recordCount){
        if(recordCount == null || recordCount <= 0){
           throw new AuraHandledException('Please enter a valid number of records to create.');
        }
        else {
          List<Account> lstAccount = new List<Account>();
          for(Integer i=1 ;i <=recordCount;i++){
            Account acc = new Account();
            acc.Name = 'Pegination Account ' + i;
            acc.Industry = 'Agriculture';
            acc.Phone = '124567890'+i;
            lstAccount.add(acc);
          }
          try {
            if (!lstAccount.isEmpty()) {
              insert lstAccount;
            }
          } catch (Exception e) {
            System.debug('Error occurred while inserting accounts: ' + e.getMessage());
          }
        }
    }

    //to show records with pagination
    @AuraEnabled(cacheable='true')
    public static List<Account> getPeginationAccountRecords(Integer pageSize, Integer offsetSize){
        return [select id, name, industry, phone from Account limit :pageSize offset :offsetSize];
    }


    @AuraEnabled(cacheable=true)
    public static list<Account> getAllAccounts(){
      return[Select Id, Name, Industry from Account];
    }




  }