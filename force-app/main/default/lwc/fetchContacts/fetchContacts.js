import { LightningElement, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';

export default class FetchContacts extends LightningElement {
    @wire(getContacts) contacts;
}