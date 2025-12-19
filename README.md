# Employee Attrition Analysis (SQL & Power BI)

# Project Overview

Employee attrition is a critical challenge for organizations.
This project analyzes employee attrition patterns to identify key factors influencing employee turnover and provide actionable business insights using SQL and Power BI.

# Objective

Analyze employee attrition trends across departments and job roles

Identify key drivers of attrition such as overtime, income, and role

Build an interactive dashboard to support HR decision-making

# Dataset

Source: IBM HR Analytics Employee Attrition Dataset (Kaggle)

Records: 1,470 employees

Key Fields: Department, JobRole, MonthlyIncome, OverTime, Attrition

# Tools & Technologies

Database: PostgreSQL

Visualization: Power BI

Data Format: CSV

# Data Processing (SQL)

Imported CSV data into PostgreSQL

Handled data type mismatches from CSV ingestion

Cleaned and transformed text and numeric fields

Created aggregations for analysis and reporting

# Key KPIs

Total Employees

Attrition Count

Attrition Rate (%)

Average Monthly Income

# Dashboard Features (Power BI)

Executive KPI cards

Attrition distribution (Yes / No)

Attrition by department and job role

Income analysis by job role

Interactive slicers for:

Department

Job Role

OverTime

# Key Insights

Overall attrition rate is approximately 16%

Sales and Research departments show the highest attrition

Employees working overtime have significantly higher attrition

Lower income bands experience higher employee turnover

# Business Recommendations

Reduce overtime workload in high-attrition departments

Review compensation strategies for lower income roles

Focus retention programs on high-risk job roles

# Project Structure
Employee-Attrition-Analysis/
│
├── sql/
│   └── employee_attrition_analysis.sql
│
├── powerbi/
│   └── employee_attrition_dashboard.pbix
│
├── dataset/
│   └── HR_Employee_Attrition.csv
│
└── README.md

# Skills Demonstrated

SQL data cleaning and transformation

Analytical thinking and KPI design

Interactive dashboard development

Business-focused data storytelling

# Conclusion

This project demonstrates an end-to-end data analytics workflow, from raw data ingestion and SQL analysis to interactive Power BI visualization and business insight generation.
