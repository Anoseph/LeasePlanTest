public with sharing class ManageCustomerReview {
    private List<String> relatedAccountList = new List<String>();
    private Map<Id, Account> accountMap;
    List<Case> triggerOld;
    List<Case> triggerNew;

    public ManageCustomerReview(List<Case>triggerOld, List<Case> triggerNew) {
        this.triggerOld = triggerOld;
        this.triggerNew = triggerNew;
    }

    public void rollupCustomerReview(){
        initializeData();
        calculateAvgReview();
        updateData();
    }

    private void initializeData()
    {
        for(Case c : triggerNew){
            relatedAccountList.add(c.AccountId);
        }

        accountMap = new Map<Id, Account>(
                        [SELECT Id, Customer_Rating__c
                         FROM Account 
                         WHERE Id in :relatedAccountList]); 
    }

    private void calculateAvgReview(){
        for(Case c : triggerNew){ 
        Account a = accountMap.get(c.AccountId);
        if (c.Status=='Closed' && c.Customer_Rating__c > 0){
            Decimal rating = (a.Customer_Rating__c + c.Customer_Rating__c) / 2;
            a.Customer_Rating__c = Math.round(rating);
        }  
    }
    
    }


    private void updateData(){
        update accountMap.values();
    }
}
