@isTest
private class Test01 {
    @testSetup static void setup() {
        // Create common test accounts 
        List < Account > testAccts = new List < Account > ();
        for (Integer i = 0; i < 2; i++) {
            testAccts.add(new Account(Name = 'TestAcct' + i));
        }
        insert testAccts;
    }
    @isTest static void testMethod1() {
        // Get the first test account by using a SOQL query 
        Account acct = [SELECT Id FROM Account WHERE Name = 'TestAcct0'
            LIMIT 1
        ]; // Modify first account 
        acct.Phone = '555-1212';
        // This update is local to this test method only. 
        update acct;
        // Delete second account 
        Account acct2 = [SELECT Id FROM Account WHERE Name = 'TestAcct1'
            LIMIT 1
        ]; // This deletion is local to this test method only. 
        delete acct2;
    }
}