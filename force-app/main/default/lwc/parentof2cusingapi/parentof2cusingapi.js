import { LightningElement } from 'lwc';

export default class Parentof2cusingapi extends LightningElement {
    percentage = 20;
    handleonchange(event){
        this.percentage = event.target.value;
}
}