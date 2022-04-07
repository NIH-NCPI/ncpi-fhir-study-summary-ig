/**
 Example ConceptMap used to document transformations during ingestion
 */

ValueSet: ExampleStudyTableVS1
Id: datatable-valueset-1
Title: "Table ValueSet"
Description: "Example Data Table with 4 variables"
* ^status = #draft
* ^url = $ExampleStudyTableVS
* include codes from system $ExampleStudyTableCS

ValueSet: ExampleStudyTableMappingsVS1
Id: datatable-mappings-valueset-1
Title: "Harmonized ValueSet for data table"
Description: "Public codes mapped from example dataset

The codes used below were chosen purely for example's sake and are in no way an endorsement or suggestion for terms that should be used in a real data-dictionary."
* ^url = $ExampleStudyPublicMappingsVS
* $umls#C2348584 "Subject Unique Identifier"
* $umls#C0079399 "Gender"
* $umls#C168843 "Age in Days at Enrollment"
* $umls#C1305855 "Body mass index"
* $loinc#LP35925-4 "Body mass index (BMI)"
* $umls#C0872128 "case control"
* $hp#0010772 "Anomalous pulmonary venous return"
* $mondo#0017705 "congenital pulmonary venous return anomaly"
* $mondo#0007130 "congenital total pulmonary venous return anomaly"

Instance: example-study-dd-conceptmap-1
InstanceOf: ConceptMap
Title: "Concept Map showing representing harmonization mappings"
Description: "Data Harmonization for example dataset"
* status = #active
* purpose = "Represent transformations to public codes applied during data ingestion"
* url = "http://example.org/my-dataset/fhir/conceptmap/data-to-public"
* sourceUri = $ExampleStudyTableVS
* targetUri = $ExampleStudyPublicMappingsVS
* group[0]
  * source = $ExampleStudyTableCS
  * target = $umls
  * element[0]
    * code = #subjectid
    * display = "Subject's Unique Identifier"
    * target[0]
      * code = #C2348584
      * display  = "Subject Unique Identifier"
      * equivalence = #equivalent
  * element[1]
    * code = #gender
    * display = "Gender"
    * target[0]
      * code = #C0079399
      * display = "Gender"
      * equivalence = #equivalent
  * element[2]
    * code = #age_at_enrollment
    * display = "Subject's Age at Enrollment in days"
    * target[0]
      * code = #C168843
      * display  = "Age in Days at Enrollment"
      * equivalence = #equivalent
  * element[3]
    * code = #bmi
    * display = "Subject's BMI, Measured at Enrollment"
    * target[0]
      * code = #C1305855
      * display  = "Body mass index"
      * equivalence = #equivalent
  * element[4]
    * code = #status
    * display = "Subject's status (Case or Control)"
    * target[0]
      * code = #C0872128
      * display  = "case control"
      * equivalence = #equivalent
* group[1]
  * source = $ExampleStudyTableCS
  * target = $loinc
  * element[0]
    * code = #bmi
    * display = "Subject's BMI, Measured at Enrollment"
    * target[0]
      * code = #LP35925-4
      * display  = "Body mass index (BMI)"
      * equivalence = #equivalent
* group[2]
  * source = $ExampleStudyTableCS
  * target = $hp
  * element[0]
    * code = #status
    * display = "Subject's status (Case or Control)"
    * target[0]
      * code = #0010772
      * display  = "Anomalous pulmonary venous return"
      * equivalence = #equivalent
* group[3]
  * source = $ExampleStudyTableCS
  * target = $mondo
  * element[0]
    * code = #status
    * display = "Subject's status (Case or Control)"
    * target[0]
      * code = #0017705
      * display  = "congenital pulmonary venous return anomaly"
      * equivalence = #equivalent
    * target[1]
      * code = #0007130
      * display  = "congenital total pulmonary venous return anomaly"
      * equivalence = #equivalent

    