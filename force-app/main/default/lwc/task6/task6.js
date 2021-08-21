import { LightningElement , track, wire } from 'lwc';

import retrieveContactData from '@salesforce/apex/task1.retrieveContactData';
 
export default class Task6 extends LightningElement {

    @track currentAccountName;
    @track searchAccountName;
     handleChangeAccName(event){
       this.currentAccountName = event.target.value;      
     }

     handleAccountSearch(){
        this.searchAccountName = this.currentAccountName;
     }

     @track viewdata = false;
     @track editdata = false;
    viewModal(event) {
        // to open modal set isModalOpen tarck value as true
        event.preventDefault();
        alert(this.template.querySelector("conid"));
        console.log('id => ' + event.detail.row.id);
        alert(event.detail.row.id);
        this.viewdata = true;
    }
    editModal() {
        // to close modal set isModalOpen tarck value as false
        this.editdata = true;
    }
    
     @track records;
     @track dataNotFound;
     @wire (retrieveContactData,{keySearch:'$searchAccountName'})
     wireRecord({data,error}){
         if(data){           
             this.records = data;
             this.error = undefined;
             this.dataNotFound = '';
             if(this.records == ''){
                 this.dataNotFound = 'There is not Contact fond related to Account name';
             }
  
            }else{
                this.error = error;
                this.data=undefined;
            }
     }


}