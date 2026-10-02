global class BatchClassForDeletingRecords implements Database.Batchable<sObject>{

       
        global Database.QueryLocator start(Database.BatchableContext BC){
			Date systemDate = system.today();
			string query = 'select id  from Opportunity where createDdate IN :systemDate AND name=="SSS"';
			return Database.getQueryLocator(query);
        }
      
     
       global void execute(Database.BatchableContext BC, List<Opportunity> oppList){
              if(oppList.size()>0)
		      delete oppList;
         }
     
       global void finish(Database.BatchableContext BC){
            
       }
    }