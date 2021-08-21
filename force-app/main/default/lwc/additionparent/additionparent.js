import { LightningElement, wire, track, api } from 'lwc';

export default class additionparent extends LightningElement {
    @api msg;
    @track searchData=false;
    handleCustomEvent(event) {
        const textVal = event.detail;
        this.msg = textVal;
        this.searchData=true;
    }
}