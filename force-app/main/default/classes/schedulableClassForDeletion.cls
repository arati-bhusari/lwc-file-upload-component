Global class schedulableClassForDeletion implements schedulable{
global void execute(SchedulableContext sc) {
        // Specify the query to delete the records you want
        //String queryToDeleteRecords = 'SELECT Id FROM Your_Object__c WHERE CreatedDate < LAST_N_DAYS:30';
        
        // Create an instance of the batch class and execute it
        BatchClassForDeletingRecords batch = new BatchClassForDeletingRecords();
        Database.executeBatch(batch);
    }
}