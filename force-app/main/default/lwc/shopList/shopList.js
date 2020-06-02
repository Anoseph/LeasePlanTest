import { LightningElement, wire } from 'lwc';
import findGarages from '@salesforce/apex/GarageController.findGarages';
import { CurrentPageReference } from 'lightning/navigation';
import { registerListener, unregisterAllListeners } from 'c/pubsub';
import { fireEvent } from 'c/pubsub';

export default class ShopList extends LightningElement {
    searchKey = '';

    @wire(findGarages, { searchKey: '$searchKey' }) garages;
    @wire(CurrentPageReference) pageRef;
    
    connectedCallback(){
        //subscribe to cityChange event
        registerListener('cityChange', this.handleCityChange, this);
    }

    disconnectedCallback(){
        unregisterAllListeners(this);
    }

    handleCityChange(searchKey){
        this.searchKey = searchKey;
    }

    handleGarageSelect(event) {
        // fire event to display the location of garage on the map
        fireEvent(this.pageRef, 'garageSelected', event.target.garage.Id);
    }

}