import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {
    myMessage = 'Hello World!';

    handleClick(){
        this.myMessage = 'Message Changed to Hello Akola';
    }
}