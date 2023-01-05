DECLARE min_date_for_entity DATE DEFAULT '2007-07-01';
DECLARE max_date_for_entity DATE DEFAULT CURRENT_DATE;

-- SET (min_date_for_entity, max_date_for_entity) = (
--   SELECT AS STRUCT MIN(posting_date), MAX(posting_date)
--   FROM `ut-sao-transparency-prod.tu_public_atom.utah_state_auditor`
--   WHERE type="RV"
-- );

SELECT posting_date, 
  amount,
  moving_sum,
  LAG (moving_sum, 365) OVER (ORDER BY posting_date) AS moving_sum_old_lag,
  (moving_sum - LAG (moving_sum, 365) OVER (ORDER BY posting_date))/LAG (moving_sum, 365) OVER (ORDER BY posting_date) AS perc_diff

FROM
(
  SELECT posting_date,
    amount,
    SUM(amount) OVER (ORDER BY posting_date ROWS BETWEEN 364 PRECEDING AND CURRENT ROW) AS moving_sum
  FROM
  (
    SELECT entity_dates_possible_tab.posting_date,
          daily_sum.amount,
    
          

    FROM(
    SELECT * FROM  UNNEST(
        (SELECT GENERATE_DATE_ARRAY(min_date_for_entity, max_date_for_entity) )
      ) AS posting_date 
    ) entity_dates_possible_tab
    LEFT JOIN 
      (
        -- Get the daily sum by type
        SELECT type, posting_date, SUM(amount) AS amount
        FROM `ut-sao-transparency-prod.transaction.transaction`

        WHERE type="RV" AND entity_name = "State of Utah"
        --  AND SUBSTR(account_number,12,4) IN ("2480")
        GROUP BY type, posting_date
      ) AS daily_sum ON entity_dates_possible_tab.posting_date = daily_sum.posting_date
    
  )
)

ORDER BY posting_date DESC