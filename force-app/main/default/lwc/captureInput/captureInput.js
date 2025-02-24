import { LightningElement } from 'lwc';

export default class CaptureInput extends LightningElement {
      userName = '';
    handleChange(event){
        this.userName = event.target.value;
    }
}