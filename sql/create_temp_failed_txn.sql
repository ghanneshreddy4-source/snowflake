-- Switch to the database and schema
USE DATABASE BANK_DB;
USE SCHEMA PUBLIC;

-- Drop the temp table if it exists
DROP TABLE IF EXISTS TEMP_FAILED_TRANSACTIONS;

-- Create a temporary table
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
