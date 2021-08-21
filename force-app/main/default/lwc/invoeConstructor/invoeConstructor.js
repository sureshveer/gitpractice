import { LightningElement, track, wire } from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getContactList';

export default class LifeCycle extends LightningElement {
    

    @track columns = [
       
        { label: 'FirstName', fieldName: 'FirstName', type: 'string' },
        { label: 'LastName', fieldName: 'LastName', type: 'string' },
        { label: 'Email', fieldName: 'Email', type: 'string' },
       
    ];



    //wiring to a function
    contacts;
    error;

    @wire(getContactList)
    wiredContacts({ error, data }) {
        if (data) {
            alert('fff');
            this.contacts = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contacts = undefined;
        }
    }

    //wiring apex method to a property
  //  @wire(getContactList) contacts;
   
    //callingg apex method impartievly
    /*

    @track contacts;
    @track error;
    constructor() {
        super();
        alert('a');
        getContactList()
                  
            .then(result => {
                this.contacts = result;
                alert(this.contacts+'s');
                alert(this.contacts.size);
                this.error = undefined;
            })
            .catch(error => {
                this.error = error;
                this.contacts = undefined;
            });
    }*/

}