import { LightningElement, api } from 'lwc';
import createCaseForAccount from '@salesforce/apex/AccountCaseController.createCaseForAccount';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AccountToCaseNevigationCompo extends LightningElement {

    @api recordId; //it will fetch the record id of current open page
    subject='';
    description='';
    caseId;



    handleSubjectChange(event){
        this.subject= event.target.value;
    }
    handleDescription(event){
        this.description= event.target.value;
    }
    handleCreateCase(){
        console.log('handleCreateCase() is called');
        console.log('subject passed is-->' ,this.subject);
        console.log('Description is->' ,this.description);


        createCaseForAccount({  //here we are using imperative way of calling apex
        accountId: this.recordId,
        subject: this.subject,
        description: this.description
    })
    .then(result=>{
        this.caseId = result;   //record created and id is assigned to caseId varieble
        console.log('Case record Created', this.caseId);
        this.showToast('Success', 'Case created successfully', 'success');

    })
    .catch(error=>{
        console.log('Error Occurred', error);
        this.showToast('Error', 'Error Occurreeddd','Error');
    })


    }
    showToast(title, message, variant) {
         this.dispatchEvent(new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
         }))

        }
}