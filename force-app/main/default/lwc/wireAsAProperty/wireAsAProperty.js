import { LightningElement, wire} from 'lwc';
import getAllAccounts from '@salesforce/apex/AccountController.getAllAccounts';

export default class WireAsAProperty extends LightningElement {
    @wire(getAllAccounts) AccountList;  //wire as a property


}