CREATE DATABASE ev_project;
use ev_project;
select * from vahan;

select * from vahan
limit 10;
where type = 'Electric(Bov)';
describe vahan;
select count(*) as total_rows
from Vahan;
SELECT
    SUM(date IS NULL) AS null_date,
    SUM(state_name IS NULL) AS null_state,
    SUM(state_code IS NULL) AS null_state_code,
    SUM(office_name IS NULL) AS null_office_name,
    SUM(office_code IS NULL) AS null_office_code,
    SUM(type IS NULL) AS null_type,
    SUM(category IS NULL) AS null_category,
    SUM(registrations IS NULL) AS null_registrations
FROM vahan;

select distinct type
from vahan;
select distinct state_name
from vahan
order by state_name;
 
 #1. What is the total number of vehicle registrations?
 
 select sum(registrations) as total_registrations
 from vahan;
 
 #2. how many records present in the dataset?
 
 select count(*) as total_records
 from vahan;
 
 #3. what fuel type present in the dataset?
 
 select distinct type
 from vahan;
 
 #4.how many vehicles were registered for each fuel type?
 
 select type, sum(registrations) as total_registrations
 from vahan
 group by type
 order by total_registrations desc;
 
 #5. what % of total registrations belongs to each fuel type?
 
 SELECT
    type,
    SUM(registrations) AS registrations,
    ROUND(
        SUM(registrations) * 100.0 /
        (SELECT SUM(registrations) FROM vahan),
        2
    ) AS percentage_of_total

FROM vahan
GROUP BY type
ORDER BY percentage_of_total DESC;

#6. which states have the highest total vehicle registrations?

select state_name,
sum(registrations) as total_registrations
from vahan
group by state_name
order by total_registrations desc;

#Q7. which states have the highest EV registration

select state_name,
SUM(registrations) as total_registrations from vahan
where type ='Electric(BOV)'
group by state_name  
order by SUM(registrations) desc;

#8. What are the top 10 states by EV registrations?

SELECT
    state_name,
    SUM(registrations) AS ev_registrations
FROM vahan
WHERE type = 'Electric(BOV)'
GROUP BY state_name
ORDER BY ev_registrations DESC
LIMIT 10;

#9. Which state has the highest Petrol registrations?

SELECT
    state_name,
    SUM(registrations) AS petrol_registrations
FROM vahan
WHERE type = 'Petrol'
GROUP BY state_name
ORDER BY petrol_registrations DESC
LIMIT 10;

#10. Which state has the highest Diesel registrations?

SELECT
    state_name,
    SUM(registrations) AS diesel_registrations
FROM vahan
WHERE type = 'Diesel'
GROUP BY state_name
ORDER BY diesel_registrations DESC
LIMIT 10;

#11. How many vehicles were registered each year?

SELECT
    YEAR(date) AS year,
    SUM(registrations) AS total_registrations
FROM vahan
GROUP BY YEAR(date)
ORDER BY year;

#12. How have EV registrations changed year by year?

SELECT
    YEAR(date) AS year,
    SUM(registrations) AS ev_registrations
FROM vahan
WHERE type = 'Electric(BOV)'
GROUP BY YEAR(date)
ORDER BY year;

#13. How have Petrol, Diesel and EV registrations changed over time?

SELECT
    YEAR(date) AS year,

    SUM(CASE
        WHEN type = 'Petrol'
        THEN registrations ELSE 0
    END) AS petrol,

    SUM(CASE
        WHEN type = 'Diesel'
        THEN registrations ELSE 0
    END) AS diesel,

    SUM(CASE
        WHEN type = 'Electric (BOV)'
        THEN registrations ELSE 0
    END) AS electric

FROM vahan
GROUP BY YEAR(date)
ORDER BY year;

#15. What is the EV adoption percentage in each state?( one of the most important questions)

SELECT
    state_name,

    SUM(registrations) AS total_registrations,

    SUM(
        CASE
            WHEN type = 'Electric (BOV)'
            THEN registrations
            ELSE 0
        END
    ) AS ev_registrations,

    ROUND(
        SUM(
            CASE
                WHEN type = 'Electric (BOV)'
                THEN registrations
                ELSE 0
            END
        ) * 100.0
        / SUM(registrations),
        2
    ) AS ev_adoption_percentage

FROM vahan
GROUP BY state_name
ORDER BY ev_adoption_percentage DESC;

#16. Which RTO/office has the highest EV registrations?
SELECT
    state_name,
    office_name,
    SUM(registrations) AS ev_registrations

FROM vahan

WHERE type = 'Electric(BOV)'

GROUP BY
    state_name,
    office_name

ORDER BY ev_registrations DESC
LIMIT 20;

#17. What is the EV adoption rate at each RTO?
SELECT
    state_name,
    office_name,

    SUM(registrations) AS total_registrations,

    SUM(
        CASE
            WHEN type = 'Electric (BOV)'
            THEN registrations
            ELSE 0
        END
    ) AS ev_registrations,

    ROUND(
        SUM(
            CASE
                WHEN type = 'Electric (BOV)'
                THEN registrations
                ELSE 0
            END
        ) * 100.0 / SUM(registrations),
        2
    ) AS ev_adoption_percentage

FROM vahan

GROUP BY
    state_name,
    office_name

ORDER BY ev_adoption_percentage DESC;

#Which states have both high EV registrations AND high EV adoption?
WITH state_analysis AS (

    SELECT
        state_name,

        SUM(registrations) AS total_registrations,

        SUM(
            CASE
                WHEN type = 'Electric (BOV)'
                THEN registrations
                ELSE 0
            END
        ) AS ev_registrations

    FROM vahan

    GROUP BY state_name
)

SELECT
    state_name,
    total_registrations,
    ev_registrations,

    ROUND(
        ev_registrations * 100.0 /
        NULLIF(total_registrations, 0),
        2
    ) AS ev_adoption_percentage

FROM state_analysis

ORDER BY ev_registrations DESC;

#shows database design +join +aggregation+ filtering 
 SELECT
    s.state_code,
    s.state_name,
    SUM(v.registrations) AS ev_registrations
FROM vahan v
JOIN state_master s
    ON v.state_code = s.state_code
WHERE v.type = 'Electric(Bov)'
GROUP BY
    s.state_code,
    s.state_name
ORDER BY
    ev_registrations DESC;
#“I separated state information into a master table and used a JOIN with the 
#transactional registration data to perform state-level EV analysis.”

select* from vahan limit 5;