#### Integration with row-level data

While this IG is specifically designed for the representation of Study Meta Data as opposed to row level data, it is worth mentioning that some of the practices described within this IG can be used to improve traceability of the row-leve data back to it's origins within the study variables. 

Consider the following two examples:

##### Linking Observations to Data Dictionary
In the [first](Observation-example-rl-observation-1.html), we take a standard observation. In this case, the observation of the subject's Age at Enrolmment. That value is represnted using HL7's extension, cqf-relativedatetime. We have two mechanisms through which we can "link" back to the original data-dictionary entry: 

* Linking back to the actual ObservationDefinition that represents the variable where the data was found inside the orginal data table
* Adding the source variable's Code as one of the code.coding entries. 

Both of these should allow for searches based on the original dataset variable. 

##### Linking Conditions (and other resourceTypes) 
For the [second](Condition-example-rl-condition-1.html), we add the source variable's code to the code.coding entries. This will allows for end users to query for Conditions (or possibly other types of resources) that originated from a particular dataset variable. 
