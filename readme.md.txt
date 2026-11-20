# India Vehicle Registration & EV Transition Analytics

## 📌 Project Overview

This project analyzes vehicle registration data from VAHAN to understand
vehicle registration patterns across different fuel types, states, RTOs,
and years.

The main focus of the project is to analyze the growth and adoption of
electric vehicles (EVs) and compare them with conventional fuel types
such as petrol and diesel.

---

## 🎯 Project Objectives

- Analyze total vehicle registrations in India
- Compare registrations across different fuel types
- Analyze vehicle registrations by state
- Analyze EV registrations across states
- Calculate EV adoption percentage
- Identify top RTOs based on EV registrations
- Analyze yearly vehicle registration trends
- Calculate year-over-year EV growth
- Rank states based on EV registrations
- Use SQL JOINs, CTEs and Window Functions for analysis

---

## 🗂️ Dataset

The dataset contains vehicle registration information with the following
important columns:

- `id` – Unique record identifier
- `date` – Registration date
- `state_name` – Name of the state
- `state_code` – State code
- `office_name` – RTO/registration office
- `office_code` – RTO code
- `type` – Fuel/vehicle type
- `category` – Vehicle category
- `registrations` – Number of registrations

---

## 🛠️ Tools & Technologies

- MySQL
- MySQL Workbench
- SQL
- Power BI – Dashboard development
- GitHub – Project documentation

---

## 🧹 Data Cleaning

The following checks were performed:

- Checked for NULL values
- Checked for duplicate records
- Checked fuel types
- Checked state values
- Validated registration values
- Checked date ranges
- Removed unnecessary spaces where required

---

## 📊 SQL Analysis

The project includes analysis such as:

### Fuel Analysis
- Total registrations by fuel type
- Percentage contribution of each fuel type

### State Analysis
- Total registrations by state
- EV registrations by state
- EV adoption percentage by state

### RTO Analysis
- EV registrations by RTO
- EV adoption percentage by RTO
- Top RTOs based on EV registrations

### Time Analysis
- Yearly vehicle registrations
- Yearly EV registrations
- EV year-over-year growth
- Cumulative EV registrations

### Advanced SQL

The project uses:

- GROUP BY
- CASE WHEN
- JOIN
- CTEs
- DENSE_RANK()
- Window Functions
- SQL Views

---

## 📈 Dashboard

The SQL analysis will be connected to Power BI to create an interactive
dashboard.

The dashboard will include:

- Total registrations
- Total states
- Total RTOs
- EV registrations
- Fuel-type distribution
- Yearly registration trends
- EV registration trends
- State-wise EV analysis
- RTO-level EV analysis
- Filters for year, state and fuel type

---

## 💡 Key Business Questions

1. Which fuel type has the highest number of registrations?
2. Which states have the highest EV registrations?
3. What percentage of registrations are EVs?
4. Which RTOs have higher EV adoption?
5. How has EV registration changed over the years?
6. Which states have experienced higher EV growth?
7. How are petrol, diesel and EV registrations changing over time?

---

## 🚀 Future Improvements

- Build an interactive Power BI dashboard
- Add more advanced EV adoption analysis
- Create additional SQL views
- Deploy the dashboard/application
- Add automated data updates if new data becomes available

---

## 👩‍💻 Author

Siddhi Mahajan

Data Analytics Project | SQL | Power BI