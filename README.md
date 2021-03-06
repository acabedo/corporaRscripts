# corporaRscripts

## Scripts

The aim of these scripts is to include some procedures I recently use to generate speech corpora. Commonly, they are R scripts:

1. Validate_ELAN_Files. This R script it was designed to make a little easier the task of editing and transforming files coming from ELAN software. Some times it is very tricky to validate XML tags that could be included in annotations from ELAN. So, if you use any kind of tagging system on your transcriptions, you can use this simply script to take all ELAN files from a folder, change escaped tags to non escaped ones, add a new DTD (added also on this folder, but you can customize it yourself), edit the files with an XML editor (Oxygen, for example), and replace them again; this way ELAN software will recognise these tags without stripping them on visualization. In plain English, it is a way to validate ELAN files without extracting data, validating XML tags and reuploading to new data files. It will allow you to edit the XML file directly generated by ELAN.
2. Process to ELAN. The aim of this R script is to provide the user the option to transform automatic transcriptions retrieved from Amazon transcribe (JSON file) and to create two files for every one of these transcriptions: a words file and a segments (intonational phrases) file. Every file will get a start time, an ending time and a speaker reference; with this info it will be pretty straightforward to import them in an ELAN file. 
