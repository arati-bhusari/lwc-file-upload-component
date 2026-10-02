public class accClass {

   //before opportunity is inserted, automatically opportunity order number should populate into the opportunity tracking number
    public static void populateOppOrderNumber(list<opportunity> oppList){
        for(opportunity opp: oppList){
            if(opp.OrderNumber__c != null){
                opp.TrackingNumber__c = opp.OrderNumber__c;
            } 
        }    
    }
    
    //after creating account, create the same record of that account in loan object
    public static void createAccountRecordInLoanObj(list<account> accList){
        list<loan__c> loanList = new list<loan__c>();
        for(Account acc: accList){
            Loan__c loan  = new Loan__c();
            loan.Name = acc.Name;
            loan.Account__c = acc.Id;
           
           loanList.add(loan);            
        }
        if(loanList.size()>0){
        insert loanList;
    }
    }
    
    //before update, update the loan limit field with '2000000' 
    public static void updateLoanLimit(map<id, Loan__c> newMapLoan, map<id, Loan__c>oldMapLoan){
        
        for(Loan__c loanObj: newMapLoan.values()){
            if(loanObj.Loan_Type__c !=null && loanObj.Loan_Type__c !=  oldMapLoan.get(loanObj.id).Loan_Type__c) {
                loanObj.Loan_Type__c = '2000000';
                
            }
        }  
    }
   
    //after update, populate the loan limit field value of loan(Child) obj in Area field of Branch(Parent) obj
   /* public static void populateLoanLimitInBranchAraeField(map<id, Loan__c> newMapLoan, map<id, Loan__c>oldMapLoan){
     
        set<id> BranchId = new set<id>();
        for(Loan__c loanObj: newMapLoan.values()){
            if(loanObj.Loan_Type__c != null && loanObj.Loan_Type__c != oldMapLoan.get(loanObj.Id).Loan_Type__c && loanObj.Branch__c != null){
              BranchId.add(loanObj.Branch__c);  
            } 
        }
        if(BranchId.size()>0){
           list< Branch__c>  Bobj = [select id, Area__c,(select id, Loan_Type__c from Loans__r) from Branch__c where id IN : BranchId];
               for(Branch__c bo: Bobj){
                   for(Loan__c loanObj :newMapLoan.values()){
                   Branch__c b = new Branch__c();
                       
                   b.Area__c = bo.get(loanObj.Branch__c).Loan_Type__c;
                   //b.Id = bo.loanObj.Branch__c;
                   } 
            }
        }
    }*/
    
    
    //before deletion of Account if Email is present then put error while deletion 
    public static void preventDeeletionOfAccouintRecord(list<account> acc){
        for(Account accObj: acc){
            if(accObj.phone != null){
           accObj.addError('Can not delete Account');
        }   
    }
    }  
        
    //After deleting the account record , delete the contact obj record
        public static void  deleteConAfterDeeletingAccount(list<Account> accList){
           List<ID> accountIDList = new List<ID>();

         for(Account accObj: accList) {
                    accountIDList.add(accObj.id);
        }
      
            if(accountIDList.size()>0){
            list<Contact> conList = [select id, accountId from Contact where accountId IN:accountIDList];     
  
                delete conList; 
            
          
        }
    
        }
    
    
    
        @invocablemethod
        public static void callflow(list<id> ids){
            list <account> listacc = [select id, name , AccountNumber from account where id IN: ids];
            for(account ac : listacc){
                if(ac.AccountNumber ==null){
                    ac.AccountNumber ='12345';
                }
            }
        update listacc;
        }
    
    
    @auraEnabled
    public static String createLoanRecord(contact conObj){
        try{insert conObj;
        return conObj.id;
           }
        catch(exception e){
            throw new AuraHandledException (e.getMessage());
        }
    }
    
    
    @auraEnabled
    public static String saveAccount(Account accRec){
        insert accRec;
        return accRec.id;
    }
   
    
    @AuraEnabled(Cacheable=true)
   public static List<Account> fetchAccountRecords(String searchKey){
    if (String.isBlank(searchKey)){
        return new List<Account>();
    }
    else {
      return [SELECT Id, Name, Phone, Industry FROM Account WHERE Name LIKE :('%' + searchKey + '%') LIMIT 10];  
    }
   } 
    
    

}