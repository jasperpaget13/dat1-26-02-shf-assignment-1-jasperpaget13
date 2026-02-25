.open fittrackpro.db
.mode box

-- 5.1 
SELECT 
    members.member_id,
    members.first_name,
    members.last_name,
    memberships.type AS membership_type,
    members.join_date
FROM members
JOIN memberships
    ON members.member_id = memberships.member_id
WHERE memberships.status = 'Active';

-- 5.2 
SELECT 
    memberships.type AS membership_type,
    AVG(
        (julianday(attendance.check_out_time) - 
         julianday(attendance.check_in_time)) * 24 * 60
    ) AS avg_visit_duration_minutes
FROM attendance
JOIN memberships
    ON attendance.member_id = memberships.member_id
GROUP BY memberships.type;

-- 5.3 
SELECT 
    members.member_id,
    members.first_name,
    members.last_name,
    members.email,
    memberships.end_date
FROM members
JOIN memberships
    ON members.member_id = memberships.member_id
WHERE strftime('%Y', memberships.end_date) = '2025';
