import { LightningElement, wire, track, api } from 'lwc';


export default class additionchild extends LightningElement {

     @track number1;
    @track number2;
    @track operator;
    @api sum;
   handleChange(event) {
        //event.preventDefault();
      //  alert('bbbbb'+event.target.value);
       // alert(event.target.name=='num1');
       // cons number1;
        if(event.target.name=='num1')
        {
            alert('rrrrrrrrrrrrrr');
              this.number1 = event.target.value;
        }
        //alert(number1);
        
        else if(event.target.name=='num2')
        {
            this.number2 = event.target.value;
            
        } 
        else if(event.target.name=='opt')
        {
            this.operator = event.target.value;
            
        } 
       

        
    }

    get options() {
        return [
            { label: '+', value: 'add' },
            { label: '-', value: 'sub' },
            { label: '*', value: 'mul' },
            { label: '/', value: 'div' }
           
        ];
    }


    handleClick() {
        alert(this.number1);
        alert(this.number2);
        if(this.operator=='add'){
        this.sum=parseInt(this.number1) + parseInt(this.number2);
        alert('ggg'+this.sum);
        }
        else if(this.operator=='sub'){
            this.sum=parseInt(this.number1) - parseInt(this.number2);
            alert('ggg'+this.sum);
        }
        else if(this.operator=='mul'){
            this.sum=parseInt(this.number1) * parseInt(this.number2);
            alert('ggg'+this.sum);
        }
        else if(this.operator=='div'){
            this.sum=parseInt(this.number1) / parseInt(this.number2);
            alert('ggg'+this.sum);
        }
       

        const selectEvent = new CustomEvent('mycustomevent', {
            detail: this.sum
        });
       this.dispatchEvent(selectEvent);


    }
}