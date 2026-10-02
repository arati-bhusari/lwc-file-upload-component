global class ScheduleOpportunityBatch implements schedulable{
global void execute(SchedulableContext sc){
       BatchClassForDeletingRecords upc = new BatchClassForDeletingRecords();
        //String sch = '0 5 0,? ? * *';
        //System.schedule('My Job', sch, upc);
        database.executeBatch(upc);
    }
}