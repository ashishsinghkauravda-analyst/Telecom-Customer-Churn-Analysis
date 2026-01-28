   -- 1. What is the overall churn rate?

   create view overall_churn_rate as
   select round(100.0 * sum(case when churn = 'Yes' then 1 else 0 end) / count(*), 2) AS churn_rate_percentage
   from telecom_churn_clean;

   select * from overall_churn_rate;


   -- 2. How many customers have churned?

   create view total_churned_customers as
   select count(*) as total_customers 
   from telecom_churn_clean
   where churn = 'Yes';

   select * from total_churned_customers;


   -- 3. Which contract type has the highest churn?

   create view churn_by_contract as
   select contract, count(*) as churned_customers
   from telecom_churn_clean
   where churn = 'Yes'
   group by contract
   order by churned_customers desc;

   select * from churn_by_contract;


   -- 4. Does customer tenure impact churn?

   create view churn_by_tenure_group as
   select case when tenure < 12 then '0-1 Year'
   when tenure between 12 and 24 then '1-2 Years'
   else '2+ Years' end as tenure_group,
   count(*) as churned_customers
   from telecom_churn_clean
   where churn = 'Yes'
   group by tenure_group order by tenure_group;

   select * from curn_by_tenure_group;


   -- 5. Find if senior citizens are more likely to churn?

   create view churn_by_senior_citizen as
   select senior_citizen, count(*) as churned_customers
   from telecom_churn_clean
   where churn = 'Yes' group by senior_citizen;

   select * from churn_by_senior_citizen;


   -- 6. Which payment method has the highest churn?

   create view churn_by_payment_method as
   select payment_method, count(*) as churned_customers
   from telecom_churn_clean
   where churn = 'Yes' group by payment_method
   order by churned_customers desc;

   select * from churn_by_payment_method;


   -- 7. Find the average monthly charges of churned customers?

   create view avg_monthly_charge_churned as
   select round(avg(monthly_charges), 2) as avg_monthly_charge
   from telecom_churn_clean
   where churn = 'Yes';

   select * from avg_monthly_charge_churned;


   -- 8. Find which internet service users churn the most?

   create view churn_by_internet_service as
   select internet_service, count(*) as churned_customers
   from telecom_churn_clean
   where churn = 'Yes' group by internet_service
   order by churned_customers desc;

   select * from churn_by_internet_service;


   -- 9. Does tech support reduce churn?

   create view churn_by_tech_support as 
   select tech_support, count(*) as churned_customers
   from telecom_churn_clean
   where churn = 'Yes' group by tech_support;

   select * from churn_by_tech_support;


   -- 10. Find the total monthly revenue lost due to churn?

   create view monthly_revenue_at_risk as
   select round(sum(monthly_charges),2) as monthly_revenue_at_risk
   from telecom_churn_clean
   where churn = 'Yes';

   select * from monthly_revenue_at_risk;



