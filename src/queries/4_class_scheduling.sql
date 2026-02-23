.open fittrackpro.db
.mode box

-- 4.1 
SELECT 
    classes.class_id,
    classes.name AS class_name,
    staff.first_name || ' ' || staff.last_name AS instructor_name
FROM classes
JOIN class_schedule
    ON classes.class_id = class_schedule.class_id
JOIN staff
    ON class_schedule.staff_id = staff.staff_id
ORDER BY classes.class_id;

-- 4.2 
SELECT 
    classes.class_id,
    classes.name,
    class_schedule.start_time,
    class_schedule.end_time,
    classes.capacity - COUNT(class_attendance.class_attendance_id) AS available_spots
FROM classes
JOIN class_schedule
    ON classes.class_id = class_schedule.class_id
LEFT JOIN class_attendance
    ON class_schedule.schedule_id = class_attendance.schedule_id
WHERE DATE(class_schedule.start_time) = '2025-02-01'
GROUP BY class_schedule.schedule_id
ORDER BY class_schedule.start_time;

-- 4.3 


-- 4.4 


-- 4.5 


-- 4.6 

