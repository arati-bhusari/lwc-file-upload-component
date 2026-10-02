import { LightningElement } from 'lwc';

export default class ApiDemoParent extends LightningElement {
    parentMessage= '';

    handleChange(event){
        this.parentMessage= event.target.value;
    }

}