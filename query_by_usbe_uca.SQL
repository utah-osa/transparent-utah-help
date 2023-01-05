-- ============================================================================
-- ========================= Query by USBE UCA Code ===========================
-- ============================================================================
-- Author: Alex Nielson (alexnielson@utah.gov)

-- Description: This scripts shows how to perform searches using USBE's Uniform
-- Chart of Accounts. This script show how to use built-in Big Query string 
-- manipulation functions.

-- To see other UCA codes available visit:
-- https://www.schools.utah.gov/financialoperations/reporting


SELECT
	entity_name,
	govt_lvl,
  fiscal_year,
	type,
	account_number AS uca,
	REGEXP_EXTRACT(account_number , r"^\d{2}") AS uca_fund, 
	REGEXP_EXTRACT(REGEXP_EXTRACT(account_number , r"^\d{2}-\w{3}"), r"\w{3}$") AS uca_location,
	REGEXP_EXTRACT(REGEXP_EXTRACT(account_number , r"^\d{2}-\w{3}-\d{4}"), r"\d{4}$") AS uca_program, 
	REGEXP_EXTRACT(REGEXP_EXTRACT(account_number , r"^\d{2}-\w{3}-\d{4}-\d{4}"), r"\d{4}$") AS uca_function, 
	REGEXP_EXTRACT(REGEXP_EXTRACT(account_number , r"^\d{2}-\w{3}-\d{4}-\d{4}-\d{3}"), r"\d{3}$") AS uca_object, 
	REGEXP_EXTRACT(account_number , r"\d{4}$") AS uca_revenue, 
	COUNT (account_number) AS freq,
	SUM(amount) AS net_amount 
FROM transaction.transaction 
WHERE govt_lvl IN ("K12 EDUCATION") AND 
	type IN ("RV","EX") AND 

  (-- Search by Fund:
  REGEXP_EXTRACT(account_number , r"^\d{2}") IN ('10', '20') 
  -- Search by Location:
  AND REGEXP_EXTRACT(REGEXP_EXTRACT(account_number , r"^\d{2}-\w{3}"), r"\w{3}$") IN ('A45') 
  -- Search by Program:
  AND REGEXP_EXTRACT(REGEXP_EXTRACT(account_number , r"^\d{2}-\w{3}-\d{4}"), r"\d{4}$") IN ('1205') 
  -- Search by Function:
  AND REGEXP_EXTRACT(REGEXP_EXTRACT(account_number , r"^\d{2}-\w{3}-\d{4}-\d{4}"), r"\d{4}$") IN ('1000') 
  -- Search by Object Code
  AND REGEXP_EXTRACT(REGEXP_EXTRACT(account_number , r"^\d{2}-\w{3}-\d{4}-\d{4}-\d{3}"), r"\d{3}$") IN ('110') 
  -- Search by Revenue Code
  OR REGEXP_EXTRACT(account_number , r"-\d{4}$") IN ('1100')
  )


GROUP BY 	entity_name,
  govt_lvl,
	fiscal_year,
	type,
	batch_id,
	uca,
	uca_fund,
	uca_location,
	uca_program,
	uca_function,
	uca_object,
	uca_revenue

