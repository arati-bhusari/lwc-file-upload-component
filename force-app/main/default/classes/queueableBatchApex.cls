public class queueableBatchApex implements queueable{
    public void execute(queueableContext QC){
        list<contact> conList = new list<contact> ();
        list<contact> con= [select id, name from contact];
        for(contact co: con){
            co.firstname = co.firstname +'Test';
            conList.add(co);
        }
    update conList;
    }
}