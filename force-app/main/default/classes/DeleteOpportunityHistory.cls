public class DeleteOpportunityHistory {

    public static void deleteHistoryRecords(List<Id> opportunityIds) {
        List<OpportunityFieldHistory> historyToDelete = [SELECT Id FROM OpportunityFieldHistory WHERE OpportunityId IN :opportunityIds];
        
        if (!historyToDelete.isEmpty()) {
            delete historyToDelete;
        }
    }

}