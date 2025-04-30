public class ExtractedContentStorage {

    // Wrapper to receive input from Agentforce
    public class InputWrapper {
        @InvocableVariable(label='EmailId') 
        public String EmailId;

        @InvocableVariable(label='TextInput') 
        public String TextInput;
    }

    // Main method that Agentforce will call
    @InvocableMethod(label='Store Extracted PDF Content')
    public static void storeContent(List<InputWrapper> inputs) {
        List<PDF_Query__c> docs = new List<PDF_Query__c>();

        for (InputWrapper input : inputs) {
            docs.add(new PDF_Query__c(
                Email__c = input.EmailId,
                Agent_Response__c = input.TextInput
            ));
        }

        if (!docs.isEmpty()) {
            insert docs;
        }
    }
}