# Query an entity using a specific search_term across many columns.
DECLARE search_term STRING;
SET search_term = r"authority";

SELECT * FROM `ut-sao-transparency-prod.transaction.transaction` 
WHERE entity_name = "State of Utah" AND 
        (
        REGEXP_CONTAINS(lower(fund1), search_term) OR 
        REGEXP_CONTAINS(lower(fund2), search_term) OR 
        REGEXP_CONTAINS(lower(fund3), search_term) OR 
        REGEXP_CONTAINS(lower(fund4), search_term) OR

        REGEXP_CONTAINS(lower(org1), search_term)OR 
        REGEXP_CONTAINS(lower(org2), search_term)OR 
        REGEXP_CONTAINS(lower(org3), search_term)OR 
        REGEXP_CONTAINS(lower(org4), search_term)OR 
        REGEXP_CONTAINS(lower(org5), search_term)OR 
        REGEXP_CONTAINS(lower(org6), search_term)OR 
        REGEXP_CONTAINS(lower(org7), search_term)OR 
        REGEXP_CONTAINS(lower(org8), search_term)OR 
        REGEXP_CONTAINS(lower(org9), search_term)OR 
        REGEXP_CONTAINS(lower(org10), search_term)OR

        REGEXP_CONTAINS(lower(cat1), search_term)OR
        REGEXP_CONTAINS(lower(cat2), search_term)OR
        REGEXP_CONTAINS(lower(cat3), search_term)OR
        REGEXP_CONTAINS(lower(cat4), search_term)OR
        REGEXP_CONTAINS(lower(cat5), search_term)OR
        REGEXP_CONTAINS(lower(cat6), search_term)OR
        REGEXP_CONTAINS(lower(cat7), search_term) OR

        REGEXP_CONTAINS(lower(description), search_term)
        );
