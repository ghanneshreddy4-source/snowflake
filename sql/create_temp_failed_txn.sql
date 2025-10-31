USE DATABASE BANK_DB;
USE SCHEMA PUBLIC;

CREATE Temprary TABLE TEMP_FAILED_TRANSACTION AS
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
