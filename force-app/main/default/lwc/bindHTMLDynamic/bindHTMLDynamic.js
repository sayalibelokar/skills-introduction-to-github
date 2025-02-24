import { LightningElement } from 'lwc';

export default class BindHTML extends LightningElement {
    myValue = "";
    handleChange(event){
        this.myValue = event.target.value;
    }
}