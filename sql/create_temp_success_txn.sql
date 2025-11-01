USE DATABASE BANK_DB;
USE SCHEMA PUBLIC;

CREATE OR REPLACE TEMPORARY TABLE TEMP_SUCCESS_TRANSACTIONS AS
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
WHERE t.status = 'SUCCESS'
  AND t.transaction_date = CURRENT_DATE();
