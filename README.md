# transparent-utah-help
This repo has helpful files and scripts for super users working with the transparent utah database.

# FAQ/Example scripts

### What is the structure of the transaction database?
Here is a link to the transaction tables schema: https://docs.google.com/spreadsheets/d/1JINi6bKB7HSaaBHo6S7tQpMjIl1yOD5CY6Lb5t7PrLg/edit?usp=sharing
A version of it is in this repo called "transparent utah database schema.xlsx"

### How do I query Bigquery in R?
Check out the file "basic_bq_query.Rmd" to see how to set up a service account and run queries in R.

### How do I query bigquery in Python?
Check the file "basic_bq_query.ipynb" to how to set up a service account and client in python. This file was made for some USU students who were querying our DB so it walks through higher ed queries.

### How can I conduct a keyword search using SQL and Regex?
Check the file "query_by_search_term.SQL". You will need to change the search term and also other parts of the WHERE clause to your needs. 


### What is the Uniform Chart of Accounts? and how do I use it?
https://auditor.utah.gov/wp-content/uploads/sites/6/2020/09/Chart-of-Accounts-10-26-15_9_17_2020.pdf
Check out this google doc by Alexander Nieslon : https://docs.google.com/document/d/1lg7nlGcbazZgbgm0pny8urGOPU6YOHT9Fj4PNkMTFhw/edit?usp=sharing 
A local version is in the github folder. It is called: "Characteristics of Correct Uniform Chart of Accounts.pdf"
If you need a csv/xlsx version message alexnielson@utah.gov

### How do I search a specific UCA code(s) in big query?
Most Local Governments use the Utah Office of the State Auditor's Uniform Chart of Accounts.Check out the file 'query_by_osa_uca.SQL'.The example shows how to find Grants and Contracts expenditures. 

Local Education Agencies (School Districts and Charter Schools)Most Local Governments use the Utah State Board of Education's Chart of Accounts. Check out the file 'query_by_usbe_uca.SQL'.

Note: Higher Education entity do not yet have a Uniform Chart of Accounts. 
Note2: The State of Utah uses an internal chart of accounts. 

### How do I query salesforce?
Check out the file "common_sf_queries.Rmd" to see ways to query common salesforce tables. Python has a similar interface into the api called 'simple-salesforce'. 

## Other helpful resources

### Scripting 
https://cloud.google.com/bigquery/docs/reference/standard-sql/procedural-language

### BigQuery best practices
https://cloud.google.com/bigquery/docs/best-practices-costs

### Bigquery Regex Testing 
https://blog.coupler.io/bigquery-regexp/
