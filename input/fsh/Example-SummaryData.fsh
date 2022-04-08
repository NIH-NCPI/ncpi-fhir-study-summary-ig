/**
 Representing basic summaries of variables in FHIR can be done using standard FHIR Observations.
 */

/**
 In order to use the Profile, SummaryObservation, we need to create a Group which represents the patients whose data was considered.
*/
Instance: example-sum-patient-1
InstanceOf: Patient
Title: "Example Patient 1"
Description: "A Patient with a small number of observations"
* gender = #female

Instance: example-sum-patient-2
InstanceOf: Patient
Title: "Example Patient 2"
Description: "A Patient with no observations...just for group example"
* gender = #male

Instance: example-sum-patient-3
InstanceOf: Patient
Title: "Example Patient 3"
Description: "A Patient with no observations...just for group example"

Instance: example-sum-patient-4
InstanceOf: Patient
Title: "Example Patient 4"
Description: "A Patient with no observations...just for group example"
* gender = #female

Instance: example-summary-group-1
InstanceOf: Group
Title: "Example Group for Summary Results"
Description: "We only have a single patient"
* type = #person
* actual = true 
* quantity = 4
* member.entity = Reference(example-sum-patient-1)
* member[1].entity = Reference(example-sum-patient-2)
* member[2].entity = Reference(example-sum-patient-3)
* member[3].entity = Reference(example-sum-patient-4)

/**
 Summarize the Subjects' Gender
*/
Instance: example-summary-gender
InstanceOf: VariableSummary 
Title: "Example Variable Summary with categories (gender)"
Description: "Simple example of a VariableSummary using components to capture counts of different categories (male, female and missing)"
* status = #final
* code.coding = $umls#C0242482 "Summary Report"
* valueCodeableConcept.coding = $umls#C0079399 "Gender"
* valueCodeableConcept.coding[1] = $ExampleStudyTableCS#gender
* subject = Reference(example-summary-group-1)
* component
  * code = $administrativeGender#female 
  * valueInteger = 2
* component[+]
  * code = $administrativeGender#male
  * valueInteger = 1
* component[+]
  * code = $umls#C1705492 "Missing"
  * valueInteger = 1