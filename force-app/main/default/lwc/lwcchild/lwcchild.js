import { LightningElement } from 'lwc';

export default class  lwcchild extends LightningElement {
        concreate(event){
            const custEvent = new CustomEvent(
                'callpasstoparent', {
                    detail: event.target.value 
                });
            this.dispatchEvent(custEvent);
        }
}