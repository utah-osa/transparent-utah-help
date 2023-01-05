-- ============================================================================
-- ========================= Query by Search Term =============================
-- ============================================================================
-- Author: Alex Nielson (alexnielson@utah.gov)

-- Description: This scripts looks through common description fields for a 
--  given regex search string. 


# Query an entity using a specific search_term across many columns.
DECLARE search_term STRING;
SET search_term = r"sales tax";  -- search term must be LOWER case!

SELECT * FROM `ut-sao-transparency-prod.transaction.transaction` 
WHERE entity_name = "State of Utah" AND 
        (
        REGEXP_CONTAINS(LOWER(fund1), search_term) OR 
        REGEXP_CONTAINS(LOWER(fund2), search_term) OR 
        REGEXP_CONTAINS(LOWER(fund3), search_term) OR 
        REGEXP_CONTAINS(LOWER(fund4), search_term) OR

        REGEXP_CONTAINS(LOWER(org1), search_term) OR 
        REGEXP_CONTAINS(LOWER(org2), search_term) OR 
        REGEXP_CONTAINS(LOWER(org3), search_term) OR 
        REGEXP_CONTAINS(LOWER(org4), search_term) OR 
        REGEXP_CONTAINS(LOWER(org5), search_term) OR 
        REGEXP_CONTAINS(LOWER(org6), search_term) OR 
        REGEXP_CONTAINS(LOWER(org7), search_term) OR 
        REGEXP_CONTAINS(LOWER(org8), search_term) OR 
        REGEXP_CONTAINS(LOWER(org9), search_term) OR 
        REGEXP_CONTAINS(LOWER(org10), search_term) OR

        REGEXP_CONTAINS(LOWER(cat1), search_term) OR
        REGEXP_CONTAINS(LOWER(cat2), search_term) OR
        REGEXP_CONTAINS(LOWER(cat3), search_term) OR
        REGEXP_CONTAINS(LOWER(cat4), search_term) OR
        REGEXP_CONTAINS(LOWER(cat5), search_term) OR
        REGEXP_CONTAINS(LOWER(cat6), search_term) OR
        REGEXP_CONTAINS(LOWER(cat7), search_term) OR

        REGEXP_CONTAINS(LOWER(program1), search_term) OR
        REGEXP_CONTAINS(LOWER(program2), search_term) OR
        REGEXP_CONTAINS(LOWER(program3), search_term) OR
        REGEXP_CONTAINS(LOWER(program4), search_term) OR
        REGEXP_CONTAINS(LOWER(program5), search_term) OR
        REGEXP_CONTAINS(LOWER(program6), search_term) OR
        REGEXP_CONTAINS(LOWER(program7), search_term) OR

        REGEXP_CONTAINS(LOWER(function1), search_term) OR
        REGEXP_CONTAINS(LOWER(function2), search_term) OR
        REGEXP_CONTAINS(LOWER(function3), search_term) OR
        REGEXP_CONTAINS(LOWER(function4), search_term) OR
        REGEXP_CONTAINS(LOWER(function5), search_term) OR
        REGEXP_CONTAINS(LOWER(function6), search_term) OR
        REGEXP_CONTAINS(LOWER(function7), search_term) OR

        REGEXP_CONTAINS(LOWER(description), search_term)

        );
