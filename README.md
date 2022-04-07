# NCPI FHIR Study Summary Implmentation Guide
Profiles and guidelines for storing Data-Dictionaries, Summary Statistics and other forms of Study Meta-data in FHIR. 

By storing meta data about the study, including a data-dictionary, details about transformations and summary data in a publicly accessible server, FHIR can be used to more easily discover datasets with that fit with researchers' interests.

The key concepts include: 

* Data Dictionary - Profiles to add clarity to the use of ActivityDefinition and Observation Definition
* Guidance on using ConceptMaps to document transformations from dataset level variables to public ontologies
* Profile to enforce basic rules and guidence on proving support for summary data in FHIR
* Guidance on linking row-level data back to Data Dictionary elements like Study Variables and their Codes

