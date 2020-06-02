import { LightningElement, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import { getRecord } from 'lightning/uiRecordApi';
import { registerListener, unregisterAllListeners } from 'c/pubsub';

const fields = [
	'Garage__c.Name',
	'Garage__c.Location__Latitude__s',
    'Garage__c.Location__Longitude__s',
    'Garage__c.Address__c',
    'Garage__c.Phone__c'
];

export default class ShopMap extends LightningElement {
    cardTitle = 'Garage Location';
    recordId;
    mapMarkers = [];
    name;

    @wire(CurrentPageReference) pageRef;

    @wire(getRecord, { recordId: '$recordId', fields })
    loadGarage({ error, data }) {
		if (error) {
			// TODO: handle error
		} else if (data) {
            this.name = data.fields.Name.value;
            const phone = data.fields.Phone__c.value;
			const Latitude = data.fields.Location__Latitude__s.value;
            const Longitude = data.fields.Location__Longitude__s.value;
            const address = data.fields.Address__c.value;
            
            //Transform the Garage Location to Map Marker
			this.mapMarkers = [{
				location: { Latitude, Longitude },
				title: this.name,
				description: `Address: ${address} Phone: ${phone}`
			}];
		}
	}


    connectedCallback(){
        //subscribe to garage selected event
        registerListener('garageSelected', this.handleGarageSelected, this);
        
    }

    disconnectedCallback(){
        unregisterAllListeners(this);
    }

    handleGarageSelected(garageId){
        this.recordId = garageId;
    }

}    