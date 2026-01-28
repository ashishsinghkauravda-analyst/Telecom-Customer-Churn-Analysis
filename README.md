# Telecom Customer Churn Analysis (SaaS Retention Project)

## Project Overview

This project focuses on cleaning, analyzing, and visualizing telecom customer data to identify key churn drivers, revenue risk, and retention opportunities.
The analysis is performed using PostgreSQL (SQL) and visualized through Power BI SaaS-style dashboards to support business decision-making.

## Objectives

-Clean and prepare raw telecom customer data for analysis
-Identify factors contributing to customer churn
-Measure churn, retention, and revenue-at-risk KPIs
-Segment customers by tenure, contract, services, and payment methods
-Build executive-level and operational insights for churn reduction

 ## Dataset 
 
The data for this project is sourced from the Kaggle dataset: Dataset Link:https://www.kaggle.com/datasets/blastchar/telco-customer-churn

## Data Cleaning 

-Removed blank values from TotalCharges
-Converted numeric fields to proper data types
-Standardized Yes/No values
-Normalized “No internet service” and “No phone service”

## Business Problems & Solutions
 
1️. What is the overall churn rate?
sql

select round(100.0 * sum(case when churn='Yes' then 1 else 0 end)/count(*),2) as churn_rate
from telecom_churn_clean;

2️. How many customers have churned?
sql

select count(*) as total_customers
from telecom_churn_clean
where churn='Yes';

3️. Which contract type has the highest churn?
sql

select contract, count(*) as churned_customers
from telecom_churn_clean
where churn='Yes' group by contract
order by churned_customers desc;

4️. Does customer tenure impact churn?
sql

select
case  when tenure < 12 then '0-1 Year'
when tenure between 12 and 24 then '1-2 Years'
else '2+ Years' end as tenure_group,
count(*) as churned_customers
from telecom_churn_clean
where churn='Yes' group by tenure_group;

5️. Find if senior citizens are more likely to churn?
sql

select senior_citizen, count(*) as churned_customers
from telecom_churn_clean
where churn='Yes' group by senior_citizen;

6️. Which payment method has the highest churn?
sql

select payment_method, count(*) as churned_customers
from telecom_churn_clean
where churn='Yes' group by payment_method
order by churned_customers desc;

7️. Find the average monthly charge of churned customers?
sql

select round(avg(monthly_charges),2) as avg_monthly_charge
from telecom_churn_clean
where churn='Yes';

8️. Find which internet service users churn the most?
sql

select internet_service, count(*) as churned_customers
from telecom_churn_clean
where churn='Yes' group by internet_service;

9️. Does tech support reduce churn?
sql

select tech_support, count(*) as churned_customers
from telecom_churn_clean
where churn='Yes' group by tech_support;

10. Find the total monthly revenue lost due to churn?
sql

select round(sum(monthly_charges),2) as monthly_revenue_at_risk
from telecom_churn_clean
where churn = 'Yes';

## Findings

-Month-to-Month contracts show the highest churn
-Customers with tenure less than 1 year are most at risk
-Higher monthly charges are strongly linked to churn
-Customers without tech support churn significantly more
-Electronic Check payment users have the highest churn rate
-Fiber optic users churn more than DSL users

## Conclusion

This project demonstrates a complete end-to-end data analyst workflow, from raw data cleaning to actionable business insights.
The analysis helps stakeholders understand why customers churn, where revenue is at risk, and how churn can be reduced using data-driven strategies.

 ## Business Recommendations

-Encourage long-term contracts with discounts
-Improve onboarding during the first 90 days
-Bundle tech support with premium plans
-Target high-risk payment methods with incentives
-Focus retention strategies on high-value customers
