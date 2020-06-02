public with sharing class CaseTriggerHandler extends TriggerHandler {
    Map<Id, Case> oldCasesMap;
    Map<Id, Case> newCasesMap;
    List<Case> triggerOld;
    List<Case> triggerNew;

    public CaseTriggerHandler(){
    }

    protected override void afterUpdate(List<SObject> updatedRecords, Map<Id, SObject> updatedRecordsMap, List<SObject> oldRecords, Map<Id, SObject> oldRecordsMap) {
        oldCasesMap = (Map<Id, Case>) oldRecordsMap;
        newCasesMap = (Map<Id, Case>) updatedRecordsMap;
        this.triggerNew = (List<Case>) updatedRecords;
        this.triggerOld = (List<Case>) oldRecords;

        ManageCustomerReview customerReview = new ManageCustomerReview(triggerOld, triggerNew);
        customerReview.rollupCustomerReview();
    }
    
}
