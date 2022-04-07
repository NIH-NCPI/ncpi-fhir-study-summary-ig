/**
 Technically, this IG is intended for summary data, not row-level, however, when 
 a dataset uses this IG, it can also apply some best-practices to row-level resources
 to associate those data resources to their summary/data-dictionary counterparts.

 These resources are intended to provide some examples of how that might be done

 For these data, we'll incorporate references from Example-SummaryData as well as Example-Dataset-DD
 */


Instance: example-rl-condition-1
InstanceOf: Condition
Title: "Example row-level Condition linking back to variable from DD"
Description: "This is an example of linking an otherwise standard FHIR Condition back to it's source variable using the value's Code as one of the code.codings"
* note.text = "This is an example of linking an otherwise standard FHIR Condition back to it's source variable using the value's Code as one of the code.codings"
* verificationStatus.coding = $conditionClinical#confirmed
* category = #encounter-diagnosis
* code.coding = $hp#0010772 "Anomalous pulmonary venous return"
* code.coding[1] = $mondo#0017705 "congenital pulmonary venous return anomaly"
* code.coding[2] = $mondo#0007130 "congenital total pulmonary venous return anomaly"
* code.coding[3] = $ExampleStudyTableCS#status "Subject's status (Case or Control)"
* subject = Reference(example-sum-patient-1)

Instance: example-rl-observation-1
InstanceOf: Observation
Title: "Example row-level Observation linking back to variable from the DD"
Description: "This is an otherwise ordinary Observation except for a few extra bits linking the observation back to its variable from the data-dictionary. In addition to a meaningful public term for the code, we can also provide the code associated with the variable in which the data was found. More importantly, we can directly link the observation back to the ObservationDefinition if the focus isn't otherwise needed."
* note.text = "This is an otherwise ordinary Observation except for a few extra bits of information. In addition to a meaningful public term for the code, we can also provide the code associated with the variable in which the data was found. More importantly, we can directly link the observation back to the ObservationDefinition if the focus isn't otherwise needed. "
* status = #final
* code.coding = $loinc#LP35925-4
* code.coding[1] = $ExampleStudyTableCS#bmi
* focus = Reference(example-study-dd-variable-1-4)
* valueQuantity
  * value = 34.1
  * unit = "kg/m2"
  * system = $ucum
  * code = #kg/m2

/**

The approach to replace a DateTime with the cqf extension isn't
working ATM, so I've replaced it with a different observation.

This is technically correct, but gives an error in sushi. If you
remove the underscore, it will compile but generates errors in the
QA report

Instance: example-rl-observation-2
InstanceOf: Observation
Title: "Example row-level Observation linking back to variable from DD"
Description: "This is an otherwise ordinary Observation except for a few extra bits of information. In addition to a meaningful public term for the code, we can also provide the code associated with the variable in which the data was found. More importantly, we can directly link the observation back to the ObservationDefinition if the focus isn't otherwise needed. "
* note.text = "This is an otherwise ordinary Observation except for a few extra bits of information. In addition to a meaningful public term for the code, we can also provide the code associated with the variable in which the data was found. More importantly, we can directly link the observation back to the ObservationDefinition if the focus isn't otherwise needed. "
* status = #final
* code.coding = $umls#C168843
* code.coding[1] = $ExampleStudyTableCS#age_at_enrollment
* focus = Reference(example-study-dd-variable-1-3)
* _valueDateTime 
  * extension[0]
    * url = $relativeDateTime
    * extension[0]
      * url = "target"
      * valueReference = Reference(example-sum-patient-1)
    * extension[1]
      * url = "targetPath"
      * valueString = "birthDate"
    * extension[2]
      * url = "relationship"
      * valueCode = #after
    * extension[3]
      * url = "offset"
      * valueDuration
        * value = 11000
        * system = $ucum
        * code = #a

*/