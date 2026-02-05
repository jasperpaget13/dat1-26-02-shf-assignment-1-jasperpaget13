.open fittrackpro.db
.mode box

DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS class_schedule;
DROP TABLE IF EXISTS memberships;
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS class_attendance;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS personal_training_sessions;
DROP TABLE IF EXISTS member_health_metrics;
DROP TABLE IF EXISTS equipment_maintenance_log;

PRAGMA foreign_keys = ON;

CREATE TABLE locations (
    location_id CHECK (
        location_id GLOB '[0-9]'),
    name VARCHAR(100) NOT NULL,
    address TEXT NOT NULL
    CHECK (length(address) >=5),
    phone_number TEXT NOT NULL 
    CHECK (
        length(phone_number) BETWEEN 10 AND 15 
        AND phone_number GLOB '[0-9]*'
    ),
    email TEXT NOT NULL
    CHECK (
        length(email) BETWEEN 6 AND 254
        AND email LIKE '%_@_%._%'
    ),
    opening_hours TEXT NOT NULL 
    CHECK (
        opening_hours GLOB '[0-2][0-9]:[0-5][0-9]-[0-2][0-9]:[0-5][0-9]'
    )
);