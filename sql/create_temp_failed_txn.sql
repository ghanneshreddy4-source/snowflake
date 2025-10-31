USE DATABASE PC_DBT_DB;
USE SCHEMA  DBT_GRED;

DROP TABLE IF EXISTS TEMP_FAILED_TRANSACTIONS;

CREATE TEMPORARY TABLE TEMP_FAILED_TRANSACTIONS AS
SELECT
    t.transaction_id,
    t.account_id,
    a.account_name,
    a.branch_name,
    t.amount,
    t.status,
    t.transaction_date
FROM BANK_DB.PUBLIC.TRANSACTIONS t
JOIN BANK_DB.PUBLIC.ACCOUNTS a
  ON t.account_id = a.account_id
WHERE t.status = 'FAILED'
  AND t.transaction_date = CURRENT_DATE();

-- Optional validation
SELECT COUNT(*) AS failed_txn_count FROM TEMP_FAILED_TRANSACTIONS;
-- trigger workflow
-- Test run to trigger workflow
-- Trigger test run Fri Oct 31 11:32:07 UTC 2025
