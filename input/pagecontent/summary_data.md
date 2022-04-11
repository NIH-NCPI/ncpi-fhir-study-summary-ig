#### Summary Data

To help clarify a dataset's contents, data summaries can be provided using the profiles, [VariableSummary](StructureDefinition-variable-summary.html){:target="_blank"} and [StudySummary](StructureDefinition-study-summary.html){:target="_blank"}. 

##### Variable Summary
These should be annotated as summary observations using the appropriate coding in addition to whichever codes may apply to both relevant public terms and the variable's code from the DdTable CodeSystem. 

The profile, [VariableSummary](StructureDefinition-variable-summary.html){:target="_blank"}, adds the requirement that there be a meaningful code added to valueCodeableConcept. This code should describe the variable being summarized. 

In addition to requiring the valueCodeableConcept, it also requires that the subject point to a reference of a SummaryGroup which represents the members described in the summary data (though, the actual members are not expected to be listed). 

For summaries that can involve more than one related value, such as counts for different categorical values, such as gender or race, missingness, etc, one should use components as shown in [this example](Observation-example-summary-gender.html){:target="_blank"}.

##### StudySummary
When providing summary details about the study itself, the StudySummary must reference the relevant ResearchStudy using _focus_. If the summary describes a subpopulation of that study, such as a single consent group, then the _subject_ must point to a FHIR Group listing each member of the subpopulation being described. 