import { api, LightningElement, wire } from 'lwc';
import getCases from '@salesforce/apex/caseController.getCases';

const col = [

  { label: 'Subject', fieldName: 'Subject', type: 'text' },
  { label: 'Status', fieldName: 'Status', type: 'text' },
  { label: 'Origin', fieldName: 'Origin', type: 'text'},
];

export default class LightningRecordFORM extends LightningElement {
    
  @api recordId; //it will give acc record id
  wiredcaserecords;
  data = [];
  columns = col; //assign data to colums of html from columns of js

   @wire(getCases,{AccountId:'$recordId'}) wiredCases(result){
   this.wiredcaserecords = result;

   if(result.data){
      this.data = result.data;
   } 
};
}