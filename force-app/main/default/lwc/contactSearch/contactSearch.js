import { LightningElement } from 'lwc';
import searchContact from '@salesforce/apex/ContactController.searchContact';
export default class ContactSearch extends LightningElement {
    searchTerm= '';
    contacts;
    error;

    handleSearchTermChange(event) {
        this.searchTerm = event.target.value;
    }
    handleSearch(){
        searchContact( { searchTerm : this.searchTerm})
        .then((result) => {
            this.contacts = result;
            this.error = undefined;
        })
        .catch((error) => {
            this.error = error;
        });
    } 
}