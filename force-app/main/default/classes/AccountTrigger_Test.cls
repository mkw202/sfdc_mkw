@isTest
private class AccountTrigger_Test {
    @isTest static void TestCreateNewAccountInBulk() {
        //setup test data
        //create 200 new account
        List<Account> accts = new List<Account>();
        for(Integer i=0; i<200; i++) {
            Account acct = new Account(Name = 'Test Account ' + i);
            accts.add(acct);
        }

        //perform  test
        Test.startTest();
        insert accts;
        Test.stopTest();
        // Verify that 200 new Accounts were inserted
        List<Account> verifyAccts = [SELECT Id FROM Account];
        System.assertEquals(200, verifyAccts.size());    
        // Also verify that 200 new Opportunities were inserted
        List<Opportunity> verifyOpps = [SELECT Id FROM Opportunity];                              
        System.assertEquals(200, verifyOpps.size()); 

    }
}
    
}