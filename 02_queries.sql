USE noshowguard;

SELECT COUNT(*) FROM clinics;

SELECT COUNT(*) FROM appointments;
SELECT COUNT(*) FROM clinics;
SELECT SUM(no_show) AS total_no_shows
FROM appointments;
SELECT 
    clinic_id,
    COUNT(*) AS total_appointments
FROM appointments
GROUP BY clinic_id
ORDER BY total_appointments DESC;
SELECT
    clinic_id,
    COUNT(*) AS total_appointments,
    SUM(no_show) AS total_no_shows
FROM appointments
GROUP BY clinic_id
ORDER BY total_no_shows DESC;
SELECT
    clinic_id,
    COUNT(*) AS total_appointments,
    SUM(no_show) AS total_no_shows,
    ROUND(AVG(no_show) * 100, 2) AS no_show_rate
FROM appointments
GROUP BY clinic_id
ORDER BY no_show_rate DESC;
SELECT
    booking_channel,
    COUNT(*) AS total_appointments,
    SUM(no_show) AS total_no_shows,
    ROUND(AVG(no_show) * 100, 2) AS no_show_rate
FROM appointments
GROUP BY booking_channel
ORDER BY no_show_rate DESC;
SELECT
    visit_type,
    COUNT(*) AS total_appointments,
    SUM(no_show) AS total_no_shows,
    ROUND(AVG(no_show) * 100, 2) AS no_show_rate
FROM appointments
GROUP BY visit_type
ORDER BY no_show_rate DESC;
SELECT
    reminder_sent,
    COUNT(*) AS total_appointments,
    SUM(no_show) AS total_no_shows,
    ROUND(AVG(no_show) * 100, 2) AS no_show_rate
FROM appointments
GROUP BY reminder_sent
ORDER BY no_show_rate DESC;
SELECT
    gender,
    COUNT(*) AS total_appointments,
    SUM(no_show) AS total_no_shows,
    ROUND(AVG(no_show) * 100, 2) AS no_show_rate
FROM appointments
GROUP BY gender
ORDER BY no_show_rate DESC;
SELECT
    CASE
        WHEN age < 18 THEN 'Under 18'
        WHEN age BETWEEN 18 AND 30 THEN '18-30'
        WHEN age BETWEEN 31 AND 45 THEN '31-45'
        WHEN age BETWEEN 46 AND 60 THEN '46-60'
        ELSE 'Above 60'
    END AS age_group,
    COUNT(*) AS total_appointments,
    SUM(no_show) AS total_no_shows,
    ROUND(AVG(no_show) * 100, 2) AS no_show_rate
FROM appointments
GROUP BY age_group
ORDER BY no_show_rate DESC;
SELECT
    CASE
        WHEN lead_days BETWEEN 1 AND 7 THEN '1-7 Days'
        WHEN lead_days BETWEEN 8 AND 14 THEN '8-14 Days'
        WHEN lead_days BETWEEN 15 AND 30 THEN '15-30 Days'
        ELSE '31-45 Days'
    END AS lead_group,
    COUNT(*) AS total_appointments,
    SUM(no_show) AS total_no_shows,
    ROUND(AVG(no_show) * 100, 2) AS no_show_rate
FROM appointments
GROUP BY lead_group
ORDER BY no_show_rate DESC;
SELECT
    CASE
        WHEN prior_no_shows = 0 THEN '0 Previous No-Shows'
        WHEN prior_no_shows = 1 THEN '1 Previous No-Show'
        ELSE '2+ Previous No-Shows'
    END AS previous_no_show_group,
    COUNT(*) AS total_appointments,
    SUM(no_show) AS total_no_shows,
    ROUND(AVG(no_show) * 100, 2) AS no_show_rate
FROM appointments
GROUP BY previous_no_show_group
ORDER BY no_show_rate DESC;
SELECT
    clinic_id,
    COUNT(*) AS total_appointments,
    ROUND(AVG(age), 2) AS average_age,
    ROUND(AVG(distance_km), 2) AS average_distance_km,
    ROUND(AVG(no_show) * 100, 2) AS no_show_rate
FROM appointments
GROUP BY clinic_id
ORDER BY no_show_rate DESC;
SELECT
    c.tier,
    COUNT(a.appointment_id) AS total_appointments,
    SUM(a.no_show) AS total_no_shows,
    ROUND(AVG(a.no_show) * 100, 2) AS no_show_rate
FROM appointments a
JOIN clinics c
    ON a.clinic_id = c.clinic_id
GROUP BY c.tier
ORDER BY no_show_rate DESC;
SELECT
    visit_type,
    COUNT(*) AS total_appointments,
    ROUND(AVG(fee_inr), 2) AS average_fee,
    MIN(fee_inr) AS minimum_fee,
    MAX(fee_inr) AS maximum_fee
FROM appointments
GROUP BY visit_type;
SELECT
    COUNT(*) AS total_appointments,
    SUM(no_show) AS total_no_shows,
    SUM(CASE WHEN no_show = 0 THEN 1 ELSE 0 END) AS attended_appointments,
    ROUND(AVG(no_show) * 100, 2) AS no_show_rate,
    ROUND(AVG(age), 2) AS average_age,
    ROUND(AVG(distance_km), 2) AS average_distance_km,
    ROUND(AVG(fee_inr), 2) AS average_fee
FROM appointments;
-- Duplicate Key Error Test
-- Attempted to insert an appointment with an existing appointment_id: A0001.
-- MySQL returned a duplicate-key error because appointment_id must be unique.