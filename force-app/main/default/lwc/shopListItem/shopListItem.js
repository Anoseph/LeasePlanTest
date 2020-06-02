import { LightningElement, api } from 'lwc';

export default class ShopListItem extends LightningElement {
    
    @api garage;

    handleSelect(event) {    
        event.preventDefault();
        const selectEvent = new CustomEvent('garageselect', { bubbles: true });
        this.dispatchEvent(selectEvent); 
    }
}