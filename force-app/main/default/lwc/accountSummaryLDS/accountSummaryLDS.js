import { api, LightningElement, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Account.Name'; 
import PHONE_FIELD from '@salesforce/schema/Account.Phone';

const FIELDS = [NAME_FIELD, PHONE_FIELD];

export default class AccountSummaryLDS extends LightningElement {
    @api recordId;

    @wire(getRecord,{ recordId: '$recordId', fields: FIELDS }) accountList; //accountList contains data and error

    get Name(){   //Name id the variable which hold value of Account record name field
        return getFieldValue(this.accountList.data, NAME_FIELD);
    }

    get Phone(){
        return getFieldValue(this.accountList.data, PHONE_FIELD);
    }
}