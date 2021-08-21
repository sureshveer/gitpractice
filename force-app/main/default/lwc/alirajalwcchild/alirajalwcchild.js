import { LightningElement, track, wire} from 'lwc';
import retrieveContactData from '@salesforce/apex/alirajalwcclass.retrieveContactData';

        
export default class alirajalwcchild extends LightningElement 
{
    @track contactName;
   
    @track records;

    handleChangeconName(event)
    {
      this.contactName = event.target.value;
      
    }   
    

    @wire (retrieveContactData,{keySearch:'$contactName'})
    wireRecord({data,error})
    {        
        if(data)
        {      
            if(this.contactName!='')
            {    
            this.records = data;
            this.error = undefined;
            const selectEvent = new CustomEvent('mycustomevent', {detail:this.records});
            this.dispatchEvent(selectEvent);
            }
        }
        else
        {
            this.error = error;
            this.records=undefined;
        }   
    }
    
}