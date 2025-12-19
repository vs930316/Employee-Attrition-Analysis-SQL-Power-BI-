-- 			EMPLOYEE ATTRITION ANALYSIS
--			Database : PostgreSQL

CREATE TABLE employee_attrition (
Age INT,
Attrition TEXT,
Department TEXT,
Employee_ID INT,
Jobrole TEXT,
Monthly_Income INT,
Overtime TEXT,
Performance_Rating INT,
Years_at_Company INT
);
-- Copying CSV Data
COPY employee_attrition
FROM 'C:/Program Files/PostgreSQL/18/HR-Employee-Attrition.csv'
DELIMITER ','
CSV HEADER;


-- 1. BASIC DATA CHECK

-- Total rows
SELECT COUNT(*) AS total_rows
FROM employee_attrition;

-- Preview data
SELECT *
FROM employee_attrition
LIMIT 10;


-- 2. DATA VALIDATION

-- Check Attrition values
SELECT DISTINCT Attrition
FROM employee_attrition;

-- Check Departments
SELECT DISTINCT Department
FROM employee_attrition;

-- Check Job Roles
SELECT DISTINCT JobRole
FROM employee_attrition;

-- Check OverTime values
SELECT DISTINCT OverTime
FROM employee_attrition;

-- 3. CORE KPIs

-- Total Employees
SELECT COUNT(Employee_ID) AS total_employees
FROM employee_attrition;

-- Attrition Count
SELECT COUNT(Employee_ID) AS attrition_count
FROM employee_attrition
WHERE Attrition = 'Yes';

-- Attrition Rate (%)
SELECT ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0/ COUNT(*),2) AS attrition_rate_percent
FROM employee_attrition;

-- Average Monthly Income
SELECT ROUND(AVG(Monthly_Income), 2) AS avg_monthly_income
FROM employee_attrition;


-- 4. ATTRITION ANALYSIS

-- Attrition by Department
SELECT Department,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY attrition_count DESC;

-- Attrition by Job Role
SELECT JobRole,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY attrition_count DESC;

-- Attrition by OverTime
SELECT OverTime,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE Attrition = 'Yes'
GROUP BY OverTime;


--  5. INCOME ANALYSIS

-- Average Monthly Income by Job Role
SELECT JobRole,
ROUND(AVG(Monthly_Income), 2) AS avg_monthly_income
FROM employee_attrition
GROUP BY JobRole
ORDER BY avg_monthly_income DESC;

-- Attrition by Income Band
SELECT CASE
        WHEN Monthly_Income < 3000 THEN 'Low Income'
        WHEN Monthly_Income BETWEEN 3000 AND 6000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS income_band,
    COUNT(*) AS attrition_count
FROM employee_attrition
WHERE Attrition = 'Yes'
GROUP BY income_band
ORDER BY attrition_count DESC;

-- 6. TENURE ANALYSIS

-- Attrition by Years at Company
SELECT Years_At_Company,
COUNT(*) AS attrition_count
FROM employee_attrition
WHERE Attrition = 'Yes'
GROUP BY Years_At_Company
ORDER BY Years_At_Company;


-- 7. SUMMARY VIEW

CREATE OR REPLACE VIEW attrition_summary AS
SELECT
    Department,
    COUNT(*) AS total_employees,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS attrition_count,
    ROUND(
        COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate_percent
FROM employee_attrition
GROUP BY Department;

