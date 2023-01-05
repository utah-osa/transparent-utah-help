-- ============================================================================
-- ========================= Employee Compensation ============================
-- ============================================================================
-- Author: Alex Nielson (alexnielson@utah.gov)

-- Description: This scripts create a table of the each employee's compensation
--  at every entity in the database. It mimics the data presented on 
--  "https://transparent.utah.gov/entity_comp.php". This table does not 
--  use the OSA's grouping for salaries and benefits, so you may get more 
--  granular detail of compensation packages. 

-- Tips: After the table is built, filter off the "entity_id" column to filter 
--  to a specific governmental entity. 


DROP TABLE IF EXISTS `project_id.dataset_name.name_for_this_table`;

CREATE TABLE `project_id.dataset_name.name_for_this_table` (
    entity_id INT64,
     entity_name STRING,
    fiscal_year INT64, 
    fund1 STRING,
    fund2 STRING,
    fund3 STRING,
    fund4 STRING,
    org1 STRING,
    org2 STRING,
    org3 STRING,
    org4 STRING,
    cat1 STRING,
    cat2 STRING,
    cat3 STRING,
    cat4 STRING,
    description STRING,
    employee_name STRING,
    gender STRING,
    title STRING,
    net_amount FLOAT64
) 

PARTITION BY RANGE_BUCKET(entity_id, GENERATE_ARRAY(1, 4000, 1))

AS 

SELECT 

    elookup.id AS entity_id,
    tran.entity_name AS entity_name,
    tran.fiscal_year, 
    fund1,
    fund2,
    fund3,
    fund4,
    org1,
    org2,
    org3,
    org4,
    cat1,
    cat2,
    cat3,
    cat4,
    description,
    tran.vendor_name AS employee_name,
    gender,
    tran.title AS title,
    SUM(amount) AS net_amount
    
FROM `ut-sao-transparency-prod.transaction.transaction` AS tran
LEFT JOIN query.entity AS elookup ON tran.entity_name = elookup.name 

WHERE type = "PY" 
    -- AND entity_name = "uncomment_put_your_entity_name_here_if_you_only_want_one_entity"

GROUP BY 
    entity_id,
     entity_name,
    fiscal_year, 
    fund1,
    fund2,
    fund3,
    fund4,
    org1,
    org2,
    org3,
    org4,
    cat1,
    cat2,
    cat3,
    cat4,
    description,
    employee_name,
    gender,
    title;

