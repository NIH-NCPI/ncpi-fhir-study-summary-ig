/**
 All related instances necessary to show how to build a data-dictionary for a small dataset
 */

/**
 Define the Code Systems specific to the components of the dataset itself. 

 One CodeSystem for the dataset listing each of the tables as individual codes
 One CodeSystem for each of the tables with individual codes for each variable to be represented in FHIR
*/
CodeSystem: ExampleStudyDatasetCS1
Id: dataset-codesystem-1
Title: "Dataset CodeSystem (lists all tables)"
Description: "Example Dataset with 1 table and 4 variables"
* ^url = $ExampleStudyDatasetCS
* ^content = #complete
* ^count = 1
* #demographics

CodeSystem: ExampleStudyTableCS1
Id: datatable-codesystem-1
Title: "Datatable CodeSystem (lists all variables)"
Description: "Example Data Table with 4 variables"
* ^url = $ExampleStudyTableCS
* ^content = #complete
* ^count = 5
* #subjectid "Subject's Unique Identifier"
* #gender "Gender"
* #age_at_enrollment "Subject's Age at Enrollment in days"
* #bmi "Subject's BMI, Measured at Enrollment"
* #status "Subject's status (Case or Control)"

ValueSet: ExampleCaseControlVS1
Id: example-case-control-vs-1
Title: "Case/Control Vars for 'status' categoricals"
Description: "Example Case/Control values"
* ^status = #draft
* $umls#C99269 "Case"
* $umls#C99270 "Control"

Instance: example-study-dd-table-1
InstanceOf: StudyDdTable
Title: "Data-Dictionary Table"
Description: "Example Data Table definition"
* status = #active
* code.coding = $ExampleStudyDatasetCS#demographics "Demographic data"
* topic.coding = $umls#C0035168 "Research"
* observationResultRequirement[0] = Reference(example-study-dd-variable-1-1)
* observationResultRequirement[1] = Reference(example-study-dd-variable-1-2)
* observationResultRequirement[2] = Reference(example-study-dd-variable-1-3)
* observationResultRequirement[3] = Reference(example-study-dd-variable-1-4)

/**
 This is an example of a very simple variable. It is just a string containing
 the unique ID associated with a given subject.
*/
Instance: example-study-dd-variable-1-1
InstanceOf: StudyDdVariable
Title: "DD Variable subjectid"
Description: "Participant's Unique Identifier (example of simple variable)"
* code.coding = $ExampleStudyTableCS#subjectid
* permittedDataType = #string

/**
 
*/
Instance: example-study-dd-variable-1-2
InstanceOf: StudyDdVariable
Title: "DD Variable gender"
Description: "Subject's gender"
* code.coding = $ExampleStudyTableCS#gender
* permittedDataType = #CodeableConcept
* validCodedValueSet.reference = "http://hl7.org/fhir/ValueSet/administrative-gender"

/**
 A slightly more complex Variable with a range 
*/
Instance: example-study-dd-variable-1-3
InstanceOf: StudyDdVariable
Title: "DD Variable age_at_enrollment"
Description: "Subject's Age at Enrollment (Example with a range of 30-40 years of age)"
* code.coding = $ExampleStudyTableCS#age_at_enrollment
* permittedDataType = #integer
* qualifiedInterval.age
  * low.value = 10957
  * low.unit = "days"
  * high.value = 14610
  * high.unit = "days"

/**
 A Quantity example with units
*/
Instance: example-study-dd-variable-1-4
InstanceOf: StudyDdVariable
Title: "DD Variable bmi"
Description: "Subject's BMI at Enrollment"
* code.coding = $ExampleStudyTableCS#bmi
* permittedDataType = #Quantity
* quantitativeDetails
  * unit = $ucum#kg/m2

/**
 An Example with codes associated with the value
*/
Instance: example-study-dd-variable-1-5
InstanceOf: StudyDdVariable
Title: "DD Variable status"
Description: "Subject's Case/Control Status"
* code.coding = $ExampleStudyTableCS#status
* permittedDataType = #CodeableConcept
* validCodedValueSet.reference = "ValueSet/example-case-control-vs-1"

