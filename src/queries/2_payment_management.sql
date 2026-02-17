.open fittrackpro.db
.mode box

-- 2.1 
INSERT INTO payments (member_id, amount, payment_date, payment_method, payment_type)
VALUES (11, 50.00, DATETIME('now'), 'Credit Card', 'Monthly membership fee');

-- 2.2 


-- 2.3 
SELECT 
    payment_id,
    amount,
    payment_date,
    payment_method
FROM payments
WHERE payment_type = 'Day pass'
ORDER BY payment_date;
