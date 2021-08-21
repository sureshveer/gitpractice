import { LightningElement ,api } from 'lwc';


export default class Ldccomponent1 extends LightningElement {
    @api recordId;
    @api objectApiName;
    fields = ['AccountId', 'Name', 'Title', 'Phone', 'Email'];
}