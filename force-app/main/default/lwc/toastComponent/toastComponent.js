import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ToastComponent extends LightningElement {
    handleSuccess(){
     console.log('Success Method');
     this.showToast(
        'Success',
        'Record Created successfully',
        'Success'
     )
    }
    handleWarning(){
       console.log('Warning Method');
        this.showToast(
        'Warning',
        'Do not click this button',
        'Warning'
     )
    }
    handleInfo(){
        console.log('Info Method');
         this.showToast(
        'Info',
        'Please find the Information',
        'Info'
     )
    }
    handleError(){
        console.log('Error Method');
         this.showToast(
        'Error',
        'Got Error',
        'Error'
     )
    }

    showToast(title, message, variant) {
         this.dispatchEvent(new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
         }))
   
  }
    
}