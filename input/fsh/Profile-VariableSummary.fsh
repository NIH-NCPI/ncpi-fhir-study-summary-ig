/**
 Summary Observations record summary data associated with data-values stored in FHIR
 */
Profile: VariableSummary
Parent: Observation
Id: variable-summary
Title: "Variable Summary"
Description: "An observation containing summary data associated with research data from FHIR

The code _MUST_ indicate that it is a summary and the subject _MUST_ point to the group of 
participants to which the observation is based on.
"
* ^version = "0.1.0"
* ^status = #draft
* code.coding = $umls#C0242482 "Summary Report"
* valueCodeableConcept 1..1
* subject only Reference(SummaryGroup)

