import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class MyFirstLwc extends LightningElement {
    myTitle = "Salesforce Noob";

    handleClick(){
        this.showToast();
    }

     showToast(){
        const event = new ShowToastEvent({
            title: 'Success',
            message: 'You clicked the button!',
            variant: 'success',
        })
        this.dispatchEvent(event);
    }
}