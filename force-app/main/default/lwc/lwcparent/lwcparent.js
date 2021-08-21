import { LightningElement , track ,wire} from 'lwc';

import getContacts from '@salesforce/apex/WireExaple.getContacts';
import { NavigationMixin } from 'lightning/navigation';  
//import delSelectedCons from '@salesforce/apex/WireExaple.deleteContacts';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';

// importing to show toast notifictions


// importing to refresh the apex if any record changes the datas
import {refreshApex} from '@salesforce/apex';



// datatable columns with row actions
const columns = [
    { label: 'FirstName', fieldName: 'FirstName' }, 
    { label: 'LastName', fieldName: 'LastName' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone'}, 
    { label: 'Email', fieldName: 'Email', type: 'email' },
    {type: "button", typeAttributes: {  
        label: 'Edit',  
        name: 'Edit',  
        title: 'Edit',  
        disabled: false,  
        value: 'edit',  
        iconPosition: 'left'  
    }}, 
    {type: "button", typeAttributes: {  
        label: 'View',  
        name: 'View',  
        title: 'View',  
        disabled: false,  
        value: 'view',  
        iconPosition: 'left'  
    }} 
    /*{
        type: 'action',
        typeAttributes: {
            rowActions: actions,
            menuAlignment: 'right'
        }
    }*/
];
export default class lwcparent extends NavigationMixin(LightningElement) {
    objectApiName = CONTACT_OBJECT;
    fields = [FIRSTNAME_FIELD, LASTNAME_FIELD, EMAIL_FIELD];
    @track name;
    createcon(){
        alert('show contact');
        this.con=true;
        this.data=false;
    }
    successpage(event) {
        const toastEvent = new ShowToastEvent({
            title: "Contact created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
    }
    
    passToParent(event){
        this.name = event.detail;
        console.log(this.name)
    }

    @track data;
    @track con;
    @track columns = columns;
    @track record = [];
    @track bShowModal = false;
    @track currentRecordId;
    @track isEditForm = false;
    @track showLoadingSpinner = false;
    
    // non-reactive variables
    selectedRecords = [];
    refreshTable;
    error;
    
    // retrieving the data using wire service
    @wire(getContacts ,{keySearch:'$name'}) 
   
    contacts(result) {
       
        this.refreshTable = result;
        this.con=false;
        if (result.data) {      
            this.data = result.data;  
           this.con=false;
            this.error = undefined;

        } else if (result.error) {
            this.error = result.error;
            this.data = undefined;

        }
    }
   

   
    
    callaction( event ) {  
          
        const recId =  event.detail.row.Id;  
        const actionName = event.detail.action.name;  
       if ( actionName === 'Edit' ) {  
  
            this[NavigationMixin.Navigate]({  
                type: 'standard__recordPage',  
                attributes: {  
                    recordId: recId,  
                    objectApiName: 'Contact',  
                    actionName: 'edit',
                    onSuccess:'handleSuccess'
                }  
            })  
  
        } else if ( actionName === 'View') {  
  
            this[NavigationMixin.Navigate]({  
                type: 'standard__recordPage',  
                attributes: {  
                    recordId: recId,  
                    objectApiName: 'Contact',  
                    actionName: 'view'  
                }  
            })  
  
        }         
  
    } 
    handleSuccess() {
        alert('save');
        return refreshApex(this.refreshTable);
    } 

}