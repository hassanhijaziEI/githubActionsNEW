@isTest
private class Test01 {
    @testSetup static void setup() {
        // Create common test accounts 
        String test;
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
        //test 30/8
        //test
        //hello 30/8
        String inputText = 'HellooO11200, World!';
        String inputText1 = 'HellooO110, World!';
        // Act
        String result = Zeft.hello(inputText,inputText1);
        
        // Assert
        System.assertEquals(inputText, result, 'Expected the same text to be returned');
        acct.Phone = '555-12102';
        // This update is local to this test method only. 
        update acct;
        // Delete second account 
        Account acct2 = [SELECT Id FROM Account WHERE Name = 'TestAcct1'
            LIMIT 1
        ]; // This deletion is local to this test method only. 
        delete acct2;
    }
}