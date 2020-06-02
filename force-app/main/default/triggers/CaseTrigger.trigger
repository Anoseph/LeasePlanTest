trigger CaseTrigger on Case (after update) {

    new CaseTriggerHandler().run();
    /*List<String> relatedAccountList = new List<String>();
    for(Case c : Trigger.New){
        relatedAccountList.add(c.AccountId);
    }

    Map<Id, Account> accountMap = new Map<Id, Account>(
        [Select Id, Customer_Rating__c, No_of_Closed_Cases__c
        From Account 
        where Id in :relatedAccountList]);

    //Check if the below logic is correct?
    for(Case c : Trigger.New){
        Account a = accountMap.get(c.AccountId);
        if (c.Status=='Closed' && c.Customer_Rating__c > 0){
            a.No_of_Closed_Cases__c = a.No_of_Closed_Cases__c + 1;
            a.Customer_Rating__c = (a.Customer_Rating__c + c.Customer_Rating__c) / a.No_of_Closed_Cases__c;
        }    
        
    }

    update accountMap.values(); */
}