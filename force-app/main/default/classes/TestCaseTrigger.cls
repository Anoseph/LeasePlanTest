@isTest
public class TestCaseTrigger {
    @isTest
    public static void testManagerCustomerReview(){
        //Setup Test Data
        Account[] accounts = TestDataFactory.createAccount(1);
        String accountId;
        Decimal customerRating ;
        for(Account a: accounts){
            accountId = a.Id;
        }
        Case[] cases = TestDataFActory.createCase(10, accountId);
        
        Test.startTest();
        
        Case[] casesToUpdate = new List<Case>();

        //Close case with relevant customer rating
        for(Case c : cases){
            c.Status = 'Closed';
            c.Customer_Rating__c = 5;
            casesToUpdate.add(c);
        }

        update casesToUpdate;

        //Retrieve the customer rating on the account
        accounts = [SELECT Id,Customer_Rating__c FROM Account WHERE Id = :accountId];
        for(Account a : accounts){
            customerRating = a.Customer_Rating__c;
        }

        //Check if the csutomer rating has been updated on the Account
        System.assertEquals(5, customerRating,'Expected customer rating');

        Test.stopTest();
    }
}
