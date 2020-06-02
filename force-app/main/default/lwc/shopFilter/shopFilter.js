import { LightningElement, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import { fireEvent } from 'c/pubsub';

export default class ShopFilter extends LightningElement {
    @wire(CurrentPageReference) pageRef;

    //Fire event to search for the Garages
    handleKeyChange(event) {
        fireEvent(this.pageRef, 'cityChange', event.target.value);
    }
}
