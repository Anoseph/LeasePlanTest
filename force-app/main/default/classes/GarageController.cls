public with sharing class GarageController {
    
    @AuraEnabled (cacheable = true)
    public Static List<Garage__c> findGarages(String searchKey){
        String key = '%' + searchKey + '%';

        return [SELECT Id, Name, Address__c, Zipcode__c, City__c, Location__latitude__s, Location__longitude__s
                FROM Garage__c
                WHERE city__c LIKE :key
                WITH SECURITY_ENFORCED
                LIMIT 1000]; 
    }
    
}
