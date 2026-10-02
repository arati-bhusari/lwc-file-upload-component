public class futureBatchApex {
@future
    public static void updateName(set<id> setId){
        list<account> accList = new list<account>();
        list<account> acc= [select id, name, phone from account where id IN: setId];
        for(account ac: acc ){
            ac.name= ac.name +ac.phone;
            accList.add(ac);
        }
        if(accList.size()>0){
            update accList;
        }
    }
}