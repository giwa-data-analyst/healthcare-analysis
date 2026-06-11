# healthcare-analysis

End-to-end Healthcare Analytics project using PostgreSQL and Power BI, featuring SQL-based KPI analysis, executive dashboards, revenue insights, doctor performance tracking, and patient appointment analytics.

## Project Overview

The Healthcare Analytics Dashboard is an end-to-end data analytics project designed to provide actionable insights into hospital operations, financial performance, doctor productivity, patient behavior, and appointment management. The project combines PostgreSQL for data storage and analysis with Power BI for interactive reporting and visualization.

Using healthcare data from patients, doctors, appointments, treatments, and billing records, a relational database was designed and analyzed through SQL queries, joins, views, and key performance indicators (KPIs). The resulting Power BI dashboards enable stakeholders to monitor organizational performance, identify operational challenges, and make data-driven decisions to improve healthcare service delivery.

The project is divided into three analytical dashboards:

- Healthcare Executive Overview
- Doctor & Operations Analysis
- Patient & Appointment Analysis

Together, these dashboards provide a comprehensive view of revenue generation, treatment performance, doctor effectiveness, patient engagement, appointment outcomes, and hospital branch performance.

## Business Problem

Healthcare organizations generate large volumes of operational data daily. However, without effective analysis and reporting, it becomes difficult to identify performance gaps, understand patient behavior, monitor doctor productivity, and optimize resource allocation.

This project addresses these challenges by providing a centralized analytical solution that enables healthcare stakeholders to:

- Monitor financial performance.
- Evaluate doctor and specialization effectiveness.
- Track patient engagement and appointment attendance.
- Identify high-performing services and hospital branches.
- Improve operational efficiency through actionable insights.

## Project Objective

The primary objective of this project was to design and develop an interactive healthcare analytics dashboard capable of:

- Monitoring hospital revenue performance.
- Evaluating doctor productivity and appointment completion rates.
- Understanding patient demographics and behavior.
- Tracking appointment outcomes and attendance patterns.
- Identifying operational inefficiencies and growth opportunities.
- Supporting data-driven decision-making through interactive visualizations.

## Tools & Technologies Used

### Database & Data Processing

**Database & Data Processing**
- PostgreSQL
- SQL

**Data Analysis**
- SQL Joins
- Views
- Aggregations
- KPI Queries

**Data Visualization**
- Power BI
- Interactive Dashboards
- KPI Cards
- Slicers
- Charts and Trend Analysis

## Dataset Overview

The dataset contains healthcare operational data across multiple hospital branches and includes information related to:

- Patients
- Doctors
- Appointments
- Treatments
- Billing Records

The database was structured using relational tables and integrated through SQL joins to create a consolidated analytical view used for reporting and dashboard development.

# Healthcare Analysis Project – Key Insights

## Dashboard 1: Executive Overview/Recommendations

### Dashboard Preview
![Healthcare Executive Overview](dashboard_screenshots/Healthcare%20Executive%20Overview.png)

### Executive Dashboard Overview

The analysis revealed that appointment completion rates are relatively low at **23%**, while no-show appointments account for **26%** of all appointments. To improve operational efficiency, the organization should implement automated appointment reminders through **SMS**, **email**, or **phone** calls to reduce missed appointments.

Since Central Hospital generates the highest revenue among all branches, management should analyze the operational practices, staffing structure, and service delivery model at this branch and replicate successful strategies across Eastside and Westside Clinics.

Chemotherapy and MRI are the highest revenue-generating treatment types. The organization should prioritize investments in these services by expanding equipment availability, increasing specialist capacity, and promoting these services where appropriate.

Revenue trends indicate a noticeable decline toward the end of the year, particularly in December. Management should investigate seasonal factors affecting patient visits and develop targeted marketing campaigns or patient engagement initiatives during low-performing periods.

Additionally, the high percentage of cancelled appointments suggests an opportunity to improve appointment scheduling processes and patient communication strategies.

## Dashboard 2: Doctor & Operations/Recommendations
### Dashboard Preview
![Healthcare Executive Overview](dashboard_screenshots/Doctor%20%26%20Operations%20Analysis.png)

### Executive Dashboard Overview

The analysis identified Sarah Taylor, Alex Davis, David Taylor, and Jane Davis as the highest revenue-generating doctors. Management should study their appointment management practices, patient engagement techniques, and treatment approaches to identify best practices that can be shared across the organization.

Pediatrics generated the highest revenue among all specializations. The organization should consider expanding Pediatric services by increasing physician availability, extending operating hours, or introducing specialized pediatric programs to maximize growth opportunities.

Doctors with lower appointment completion volumes may benefit from additional support, training, or scheduling optimization to improve productivity and patient outcomes.

High-value patients such as Michael Taylor and Michael Wilson contribute significantly to overall revenue. The organization should develop patient retention programs, personalized follow-up strategies, and loyalty initiatives to maintain long-term relationships with these valuable patients.

Regular performance monitoring should be implemented to track physician productivity, appointment completion rates, and revenue contributions, ensuring consistent operational excellence across the healthcare network.

## Dashboard 3: Patient & Appointment Analysis Recommendations
### Dashboard Preview
![Healthcare Executive Overview](dashboard_screenshots/Doctor%20%26%20Operations%20Analysis.png)

### Executive Dashboard Overview

The high number of no-show appointments represents one of the most significant operational challenges identified in the analysis. Implementing automated appointment reminders, confirmation systems, and follow-up notifications could significantly improve attendance rates and reduce revenue loss.

Since female patients account for a substantially larger share of healthcare visits, the organization should further analyze patient needs and service preferences to ensure healthcare offerings continue meeting the demands of its largest patient segment.

Central Hospital recorded the highest number of patient visits, suggesting stronger patient demand in that location. Additional staffing, appointment slots, and service resources may be allocated to this branch to support growing patient volumes.

Patient registration trends fluctuate significantly throughout the year, with very low registrations in certain months. Management should launch targeted patient acquisition campaigns during low-registration periods and evaluate the effectiveness of marketing activities throughout the year.

To improve overall patient experience, the organization should monitor appointment cancellations, registration trends, and patient feedback regularly. Data-driven improvements in scheduling, communication, and patient engagement can help increase appointment completion rates and support long-term growth.

Overall, the healthcare organization should focus on reducing no-shows, improving patient retention, expanding high-performing services, and leveraging data-driven decision-making to enhance both operational efficiency and revenue performance.

