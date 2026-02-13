.open fittrackpro.db
.mode box

-- 1.1
SELECT
member_id,
first_name,
last_name,
email,
join_date
FROM members;

-- 1.2
UPDATE members 
SET phone_number = '07000 10005',
    email = 'emily.jones.updated@email.com'
WHERE member_id = 5;

-- 1.3
SELECT COUNT(*) AS total_members
FROM members;

-- 1.4
SELECT m.member_id AS member_id,
       m.first_name,
       m.last_name,
       COUNT(c.schedule_id) AS registration_count
FROM members m
JOIN class_attendance c ON m.member_id = c.member_id
GROUP BY m.member_id, m.first_name, m.last_name
ORDER BY registration_count DESC
LIMIT 1;

-- 1.5
SELECT m.member_id,
       m.first_name,
       m.last_name,
       COUNT(c.schedule_id) AS registration_count
FROM members m
LEFT JOIN class_attendance c ON m.member_id = c.member_id
GROUP BY m.member_id, m.first_name, m.last_name
ORDER BY registration_count ASC
LIMIT 1;

-- 1.6

