/**
 Summary that applies to a Study as a whole (or possibly one of the consent groups)
 */
Profile: StudySummary
Parent: Observation
Id: study-summary
Title: "Study Summary"
Description: "An observation containing summary data associated with research data from FHIR

The code _MUST_ indicate that it is a summary and the subject _MUST_ point to the group of 
participants if the summary doesn't pertain to the entire study. 

The StudySummary _MUST_ reference a study in the focus. 


"
* ^version = "0.1.0"
* ^status = #draft
* code.coding = $umls#C0242482 "Summary Report"
* subject only Reference(NcpiGroup)
* focus 1.. 
* focus only Reference(NcpiResearchStudy) 

