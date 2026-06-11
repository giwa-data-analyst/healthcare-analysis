SELECT *
FROM treatments limit 8;

-- first join
SELECT
    a.appointment_id,
    p.patient_id,
    p.first_name,
    p.last_name,
    d.doctor_id,
    d.first_name AS doctor_first_name,
    d.last_name AS doctor_last_name,
    a.appointment_date,
    a.reason_for_visit,
    a.status
FROM appointments a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id
LIMIT 10;


-- second join
SELECT
    a.appointment_id,
    p.patient_id,
    p.first_name,
    p.last_name,
    d.doctor_id,
    d.first_name AS doctor_first_name,
    d.last_name AS doctor_last_name,
    a.appointment_date,
    a.reason_for_visit,
    a.status,
    t.treatment_id,
    t.treatment_type,
    t.cost,
    t.treatment_date
FROM appointments a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id
JOIN treatments t
    ON a.appointment_id = t.appointment_id
LIMIT 10;

-- third join
SELECT
    a.appointment_id,
    p.patient_id,
    p.first_name,
    p.last_name,
    d.doctor_id,
    d.first_name AS doctor_first_name,
    d.last_name AS doctor_last_name,
    a.appointment_date,
    a.reason_for_visit,
    a.status,
    t.treatment_id,
    t.treatment_type,
    t.cost,
    t.treatment_date,
    b.bill_id,
    b.amount,
    b.payment_method,
    b.payment_status,
    b.bill_date
FROM appointments a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id
JOIN treatments t
    ON a.appointment_id = t.appointment_id
JOIN billing b
    ON t.treatment_id = b.treatment_id
LIMIT 10;


-- CREATE VIEW
CREATE VIEW healthcare_analysis_view AS
SELECT
    a.appointment_id,
    a.appointment_date,
    a.appointment_time,
    a.reason_for_visit,
    a.status AS appointment_status,

    p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    p.gender,
    p.date_of_birth,
    p.contact_number,
    p.registration_date,
    p.insurance_provider,

    d.doctor_id,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    d.specialization,
    d.years_experience,
    d.hospital_branch,

    t.treatment_id,
    t.treatment_type,
    t.description AS treatment_description,
    t.cost AS treatment_cost,
    t.treatment_date,

    b.bill_id,
    b.bill_date,
    b.amount AS billing_amount,
    b.payment_method,
    b.payment_status

FROM appointments a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id
JOIN treatments t
    ON a.appointment_id = t.appointment_id
JOIN billing b
    ON t.treatment_id = b.treatment_id;

-- run view query
SELECT *
FROM healthcare_analysis_view
LIMIT 10;


-- Executive Healthcare KPI Summary

SELECT
    COUNT(DISTINCT patient_id) AS "Total Patients",
    COUNT(DISTINCT doctor_id) AS "Total Doctors",
    COUNT(DISTINCT appointment_id) AS "Total Appointments",
    COUNT(DISTINCT treatment_id) AS "Total Treatments",
    COUNT(DISTINCT bill_id) AS "Total Bills",

    ROUND(SUM(billing_amount), 2) AS "Total Billing Revenue",
    ROUND(AVG(billing_amount), 2) AS "Average Billing Amount",
    ROUND(SUM(treatment_cost), 2) AS "Total Treatment Cost",
    ROUND(AVG(treatment_cost), 2) AS "Average Treatment Cost",

    COUNT(CASE WHEN appointment_status = 'Completed' THEN 1 END) AS "Completed Appointments",
    COUNT(CASE WHEN appointment_status = 'Cancelled' THEN 1 END) AS "Cancelled Appointments",
    COUNT(CASE WHEN appointment_status = 'No-show' THEN 1 END) AS "No Show Appointments",

    ROUND(
        COUNT(CASE WHEN appointment_status = 'Completed' THEN 1 END)::numeric
        / COUNT(DISTINCT appointment_id) * 100,
        2
    ) AS "Completion Rate %"

FROM healthcare_analysis_view;


--KPI QUERY (Revenue by Treatment Type)
SELECT
    treatment_type,
    COUNT(treatment_id) AS total_treatments,
    ROUND(SUM(billing_amount), 2) AS total_revenue,
    ROUND(AVG(billing_amount), 2) AS average_revenue
FROM healthcare_analysis_view
GROUP BY treatment_type
ORDER BY total_revenue DESC;


--KPI QUERY (Doctor Performance Analysis)
SELECT
    doctor_name,
    specialization,
    
    COUNT(appointment_id) AS total_appointments,
    
    COUNT(CASE 
        WHEN appointment_status = 'Completed' 
        THEN 1 
    END) AS completed_appointments,

    ROUND(SUM(billing_amount), 2) AS total_revenue

FROM healthcare_analysis_view

GROUP BY doctor_name, specialization

ORDER BY total_revenue DESC;


-- KPI QUERY (Monthly Revenue Trend)

SELECT
    DATE_TRUNC('month', appointment_date) AS month,
    
    ROUND(SUM(billing_amount), 2) AS monthly_revenue,
    
    COUNT(DISTINCT patient_id) AS total_patients,
    
    COUNT(appointment_id) AS total_appointments

FROM healthcare_analysis_view

GROUP BY month

ORDER BY month;


-- KPI QUERY (Appointment Status Analysis)

SELECT
    appointment_status,
    
    COUNT(appointment_id) AS total_appointments,
    
    ROUND(
        COUNT(appointment_id) * 100.0 /
        SUM(COUNT(appointment_id)) OVER (),
    2) AS percentage_share

FROM healthcare_analysis_view

GROUP BY appointment_status

ORDER BY total_appointments DESC;



-- KPI QUERY (Patient Gender Analysis)

SELECT
    gender,
    
    COUNT(DISTINCT patient_id) AS total_patients,
    
    ROUND(
        COUNT(DISTINCT patient_id) * 100.0 /
        SUM(COUNT(DISTINCT patient_id)) OVER (),
    2) AS percentage_share

FROM healthcare_analysis_view

GROUP BY gender

ORDER BY total_patients DESC;



-- KPI QUERY (Revenue by Hospital Branch)

SELECT
    hospital_branch,
    
    COUNT(DISTINCT patient_id) AS total_patients,
    
    COUNT(appointment_id) AS total_appointments,
    
    ROUND(SUM(billing_amount), 2) AS total_revenue,
    
    ROUND(AVG(billing_amount), 2) AS average_revenue

FROM healthcare_analysis_view

GROUP BY hospital_branch

ORDER BY total_revenue DESC;



-- KPI QUERY (Top Patients by Revenue)

SELECT
    patient_name,
    gender,

    COUNT(appointment_id) AS total_visits,

    ROUND(SUM(billing_amount), 2) AS total_revenue

FROM healthcare_analysis_view

GROUP BY patient_name, gender

ORDER BY total_revenue DESC

LIMIT 10;



-- KPI QUERY (Revenue by Specialization)

SELECT
    specialization,

    COUNT(DISTINCT doctor_name) AS total_doctors,

    COUNT(appointment_id) AS total_appointments,

    ROUND(SUM(billing_amount), 2) AS total_revenue,

    ROUND(AVG(billing_amount), 2) AS average_revenue

FROM healthcare_analysis_view

GROUP BY specialization

ORDER BY total_revenue DESC;



-- KPI QUERY (Monthly Appointment Trend)

SELECT
    DATE_TRUNC('month', appointment_date) AS month,

    COUNT(appointment_id) AS total_appointments,

    COUNT(CASE
        WHEN appointment_status = 'Completed'
        THEN 1
    END) AS completed_appointments,

    COUNT(CASE
        WHEN appointment_status = 'Cancelled'
        THEN 1
    END) AS cancelled_appointments

FROM healthcare_analysis_view

GROUP BY month

ORDER BY month;