/**
 
 Pulling Brian's summary examples from ncpi-fhir-ig. These don't 
 use the subject => Group, instead relying on the study definition
 to determine the subjects associated with the summaries. 
  
 */

/**
This NCPI CS was put together originally as a makeshift place 
to define our codes. Maybe we can pull together suitable codes 
defined elsewhere instead?
 */
CodeSystem: Ncpi
Id: ncpi
Title: "NCPI FHIR Codes"
Description: "Codes that would apply to NCPI projects"
* ^url = $ncpi
* ^version = "0.1.0"
* ^status = #active
* ^experimental = false
* ^publisher = "NCPI FHIR Works"
* ^content = #fragment 
* #Consortium "Study Consortium"
* #StudyCohort "Study Cohort"
* #Summary "Summary Data"
* #CohortCount "Number of Cohorts"
* #SampleCount "Number of Samples"
* #Participant "Number of Participants"
* #StorageSize "Size on Disk"
* #ConsentCodes "Consent Codes"
* #TerraWorkspace "Terra Workspace Name"
* #PrimaryDisease "Primary Disease"
* #AccessType "Access Type"
* #StudyDesign "Study Design"

/**
 * The overall cohort
 */
Instance: research-study-cmg
InstanceOf: SummaryResearchStudy
Usage: #example
Title: "Center for Mendelian Genomics (CMG)"
Description: "Center for Mendelian Genomics (CMG) - An example of a Multi-Center Study"
* title = "Center for Mendelian Genomics"
* status = #completed 
* primaryPurposeType = #diagnostic 
* category 
  * coding 
    * system = $ncpi
    * code = #Consortium 
    * display = "Study Consortium"
* condition
  * text = "Mendelian"

Instance: research-study-phs000711
InstanceOf: SummaryResearchStudy
Usage: #example
Title: "Baylor Hopkings Center CMG"
Description: "Baylor Hopkins Center for Mendelian Genomics (BH CMG) - Example Research Study representing a Specific study under the CMG umbrella"
* title = "Baylor Hopkins Center for Mendelian Genomics (BH CMG)"
* status = #completed 
* primaryPurposeType = #diagnostic 
* partOf = Reference(research-study-cmg)
* category 
  * coding 
    * system = $ncpi
    * code = #StudyCohort 
    * display = "Study Cohort"
* condition
  * text = "Mendelian"

/**
 * For Consortium specific summaries, we could point the focus to the 
 * consortium research study
 */
Instance: anvil-summary-cmg
InstanceOf: StudySummary
Title: "Summary detail for Center for Mendelian Genomics"
Description: "Summary detail for Center for Mendelian Genomics"
* status = #final
* code.coding = $umls#C0242482 "Summary Report"
* focus = Reference(research-study-cmg)
* component
  * code = #CohortCount "Number of Cohorts"
  * valueInteger = 41
* component[+]
  * code = $ncpi#SampleCount "Number of Samples"
  * valueInteger = 807
* component[+]
  * code = $ncpi#Participant "Number of Participants"
  * valueInteger = 807
* component[+]
  * code = #StorageSize "Size on Disk"
  * valueQuantity = 4.87 $ucum#TR

/**
  *  * value = 4.87
  *  * code = TR
  *  * system = $ucum 
  *  * unit = ppb
*/

/**
 * Each of the substudies would have their own summary observation
 */
Instance: anvil-summary-phs000711
InstanceOf: StudySummary
Title: "Baylor Hopkins Center for Mendelian Genomics (BH CMG)"
Description: "Baylor Hopkins Center for Mendelian Genomics (BH CMG)"
* status = #final
* code.coding = $umls#C0242482 "Summary Report"
* focus = Reference(research-study-phs000711)
/**
 * No access to row level data, so no point in providing a subject
 * However, that could point to a group with all participants in the relevant group being summarized
 */
* component
  * code = $ncpi#SampleCount "Number of Samples"
  * valueInteger = 807
* component[+]
  * code = $ncpi#Participant "Number of Participants"
  * valueInteger = 807
* component[+]
  * code = #ConsentCodes "Consent Codes"
  * valueString = "HMB-IRB-NPU"
* component[+]
  * code = #TerraWorkspace "Terra Workspace Name"
  * valueString = "AnVIL_CMG_BaylorHopkins_HMB-NPU_WES"
* component[+]
  * code = #PrimaryDisease "Primary Disease"
  * valueString = "Mendelian" /* A code may be better for this?*/
* component[+]
  * code = #AccessType "Access Type"
  * valueString = "Controlled Access"
* component[+]
  * code = #StudyDesign 
  * valueString = "Mendelian"
* component[+]
  * code = #DataType
  * valueString = #Exome
* component[+]
  * code = #StorageSize "Size on Disk"
  * valueQuantity = 4.87 $ucum#TR
