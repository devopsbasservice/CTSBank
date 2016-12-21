
USE onlineBankingDemo;

SELECT * FROM admin;
SELECT * FROM net_banking;
SELECT * FROM account;
SELECT * FROM cust_details;
SELECT * FROM transactions;

TRUNCATE TABLE net_banking;
TRUNCATE TABLE account;
TRUNCATE TABLE cust_details;
TRUNCATE TABLE transactions;

UPDATE cust_details SET c_net_banking=0 WHERE c_id=1

SELECT c_id, c_name, c_gender, c_state, c_city, c_pin, c_email, c_mobNo, c_net_banking,
c_status, c_date, ac_no, ac_type, ac_blnc, ac_date
FROM cust_details
JOIN account ON ac_cid=c_id
WHERE c_status=1 AND c_id=1;