public class ComplaintFormController {

    public String email { get; set; }
    public String complaintReason { get; set; }
    public String complaint { get; set; }
    public String priority { get; set; }

    // Variable to store the success message for display
    public String successMessage { get; set; }

    // Constructor
    public ComplaintFormController() {
        // Initialize properties if needed
        successMessage = '';
    }

    // Method to submit the complaint and store it in the Customer_Complaint__c object
    public void submitComplaint() {
        // Validate form data
        if (String.isBlank(email) || String.isBlank(complaintReason) || String.isBlank(complaint) || String.isBlank(priority)) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please fill out all fields.'));
            return; // Stop execution if validation fails
        }

        try {
            // Create new Customer_Complaint__c record
            Customer_Complaint__c newComplaint = new Customer_Complaint__c();
            newComplaint.Email_Id__c = email;
            newComplaint.Complaint_Reason__c = complaintReason;
            newComplaint.Complaint_Description__c = complaint;
            newComplaint.Priority__c = priority;

            // Insert the new complaint record into the database
            insert newComplaint;

            // Set the success message
            successMessage = 'Complaint registered successfully!';

            // Optionally, show a success message on the Visualforce page
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, successMessage));

        } catch (Exception e) {
            // Handle any exceptions
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'An error occurred: ' + e.getMessage()));
        }
    }
}