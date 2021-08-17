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
account_number,
REGEXP_EXTRACT(account_number, r'^\d{3}') AS uca_fund,
REGEXP_REPLACE(REGEXP_EXTRACT(account_number, r'-\d{6}-'), '-','') AS uca_function,
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
