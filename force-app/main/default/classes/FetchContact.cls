public class FetchContact{
     @AuraEnabled(cacheable=true)
    public static list<Contact> fetchContact(){
        system.debug('fetchContact method called');
        List<Contact> lstContact = new List<Contact>();
        lstContact = [SELECT Id, Name, Email, Phone FROM Contact LIMIT 5];
        return lstContact;

    }
}