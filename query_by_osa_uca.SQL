-- ============================================================================
-- ========================= Query by UCA Code ================================
-- ============================================================================
-- Author: Alex Nielson (alexnielson@utah.gov)

-- Description: This scripts shows how to perform searches using the Office of 
-- the State Auditor's Uniform Chart of Accounts. This script show how to use
--  built-in Big Query string manipulation functions.

-- We use the example of grabbing all expenses related to grants and contracts.
-- To see other UCA codes available visit:
-- https://auditor.utah.gov/wp-content/uploads/sites/6/2020/09/Chart-of-Accounts-10-26-15_9_17_2020.pdf


-- Note, there are two other Charts of Account used. 
--  1. Local Education Agency (LEA) will use The Utah State Board of Educations (USBE)'s chart of accounts. 
--  2. State of Utah. Uses its own COA.

SELECT entity_name,
 fiscal_year,
type,
fund1,
fund2,
org1,
org2,
org3,
cat1,
cat2,
cat3,
cat4,
description, 
vendor_name,
account_number AS uca,
REGEXP_EXTRACT(account_number, r'^\d{3}') AS uca_fund,
REGEXP_REPLACE(REGEXP_EXTRACT(account_number, r'-\d{1}[\d|a|b]\d{4}-'), '-','') AS uca_function,
REGEXP_EXTRACT(account_number, r'\d{8}$') AS uca_account,

SUM(amount) AS net_amount
FROM `ut-sao-transparency-prod.transaction.transaction`
WHERE type IN('EX','RV') AND 

REGEXP_REPLACE(REGEXP_EXTRACT(account_number, r'-\d{8}'),'-','') IN ( '40060000', # Grants and Contracts
                                                    '40060100', # Grants and Contracts - Federal 
                                                    '40060200', # Grants and Contracts - State 
                                                    '40060300', # Grants and Contracts - Local 
                                                    '40060400'  # Grants and Contracts - Private 
                                                    )

GROUP BY 
    entity_name,
    fiscal_year,
    type,
    fund1,
    fund2,
    org1,
    org2,
    org3,
    cat1,
    cat2,
    cat3,
    cat4,
    description,
    account_number, 
    uca_fund,
    uca_function,
    uca_account
