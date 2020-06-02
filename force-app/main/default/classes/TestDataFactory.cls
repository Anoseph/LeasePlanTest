@IsTest
public class TestDataFactory {
  
    public static List<Account> createAccount(Integer numOfAccounts){
        List<Account> accounts = new List<Account>();
        for(Integer i=0; i < numOfAccounts; i++) {
            Account a = new Account(Name='TestAccount' + i);
            accounts.add(a);
        }
        insert accounts;

        return accounts;
    }

    public static List<Case> createCase(Integer numOfCases, String accountId){
        List<Case> cases = new List<Case>();
        for(Integer i=0; i < numOfCases; i++) {
            Case c = new Case(AccountId = accountId, Status= 'New');
            cases.add(c);
        }
        insert cases;

        return cases;
    }

}
