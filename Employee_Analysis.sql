
use catalog saswat;
use schema hr;
---first check raw data
select * from emp_data;
select count(*) from emp_data;--rows 100000

---create a copy of raw data
create or replace table emp_data_cleaned as select * from emp_data;

select count(*) from emp_data_cleaned;--100000 rows
      
      --===========CLEANING PART==========--

---null check
select count(*) from emp_data_cleaned where Employee_ID is null;--0
select count(*) from emp_data_cleaned where Department is null;--0
select count(*) from emp_data_cleaned where Gender is null;--0
select count(*) from emp_data_cleaned where Hire_Date is null;--0
select count(*) from emp_data_cleaned where Years_At_Company is null;--0
select count(*) from emp_data_cleaned where Education_Level is null;--0
select count(*) from emp_data_cleaned where Performance_Score is null;--0
select count(*) from emp_data_cleaned where Monthly_Salary is null;--0
select count(*) from emp_data_cleaned where Work_Hours_Per_Week is null;--0
select count(*) from emp_data_cleaned where Projects_Handled is null;--0
select count(*) from emp_data_cleaned where Overtime_Hours is null;--0
select count(*) from emp_data_cleaned where Sick_Days is null;--0
select count(*) from emp_data_cleaned where Remote_Work_Frequency is null;--0         

---duplicate check
select employee_id, count(*) as duplicate_count from emp_data_cleaned
group by employee_id 
having duplicate_count > 1;---no duplicate found

--department column check
select distinct department from emp_data_cleaned; --correct
--gender check 
select distinct gender from emp_data_cleaned;--Male
                                               --Female
                                               --Other
--age validation check
select age, case  when age between 22 and 60 then 'valid'else 'invalid'
                 end as age_count from emp_data_cleaned;

select count(*) as valid_age from emp_data_cleaned where age between 22 and 60;--100000

select count(*) as invalid_age from emp_data_cleaned where age not between 22 and 60;--0
--job_title check
select distinct job_title from emp_data_cleaned;--7 types of jon tile 

--hire date column check
select hire_date from emp_data_cleaned where hire_date is  null;--no nulls
--future data check
select hire_date from emp_data_cleaned where hire_date > current_date();--no future data found
--NEGAIVE VALUES CHECK
select * from emp_data_cleaned where Monthly_Salary <= 0
                                  or Employee_Satisfaction_Score <0
                                  or Training_Hours <0
                                  or Promotions <0
                                  or Overtime_Hours <0
                                  or Remote_Work_Frequency <0
                                  or Sick_Days <0
                                  or Work_Hours_Per_Week <0
                                  or Projects_Handled <0
                                  or Team_Size <0
                                  or Performance_Score <0-----no negative values found

---age category column create
alter table emp_data_cleaned add column age_category string;

update emp_data_cleaned set age_category = case 
                                           when age between 22 and 30 then 'Young(22-30)'
                                          when age between 31 and 40 then 'Adult(31-40)'
                                          when age between 41 and 50 then 'Middle_Age(41-50)'
                                          when age between 51 and 60 then 'Senior(51-60)'
                                         end;


 ---check age category column                                        
select distinct age_category from emp_data_cleaned;


  --========ANALYSIS PART==========--

---TOTAL EMPLOYEE = 100000
select distinct count(employee_id) from emp_data_cleaned;
--average salary = 6403.211
select avg(monthly_salary) from emp_data_cleaned;
---all department name
select distinct department from emp_data_cleaned;
---IT
--Finance
--Customer Support
--Engineering
--Marketing
--HR
--Operations
--Sales
--Legal

-- job type 
select distinct job_title from emp_data_cleaned;

---total employee by department
select department, count(employee_id) as total_employee from emp_data_cleaned
group by department
order by total_employee desc;
--insights
--department	total_employee
--Marketing	       11216
--Finance	       11200
--Operations	   11181
--IT	           11131
--Sales	           11122
--Legal	           11118
--Customer Support  11116
--HR	            10960
--Engineering	    10956

---total employe by job type
select job_title, count(employee_id) as total_employee from emp_data_cleaned
group by job_title
order by total_employee desc;
--insights
---job_title	total_employee
--Specialist	14507
--Manager	    14325
--Technician	14285
--Analyst	    14261
--Engineer	    14217
--Consultant	14210
--Developer	    14195

--average salary per employee
select employee_id, monthly_salary,
        avg(monthly_salary) over() as avg_salary from emp_data_cleaned;

--gender distribution
select gender, count(*) as total_emp from emp_data_cleaned
group by gender
order by total_emp desc;
--insights 
--gender	total_emp
--Male	     48031
--Female	 48001
--Other	     3968

---dep wise avg salary
select department,round(avg(monthly_salary),2) as avg_salary from emp_data_cleaned
group by department
order by avg_salary desc;
--department	      avg_salary
--Engineering	       6417.25
--IT	               6414.6
--Sales	               6413.15
--Operations	        6412.31
--Customer Support	   6403.88
--HR	                6400.36
--Finance	            6398.58
--Legal	               6391.28
--Marketing	           6377.86

---Top 10 Highest Paid Employees
SELECT 
    Employee_ID,
    Department,
    Job_Title,
    Monthly_Salary
FROM emp_data_cleaned
ORDER BY Monthly_Salary DESC
LIMIT 10;
--insights

---Employee_ID	    Department	          Job_Title	       Monthly_Salary
      --184	      Customer Support	        Manager	             9000
      --138	      Customer Support	        Manager	             9000
       --40	          HR	                Engineer	       9000
        --219	    Engineering	                Engineer	 9000
        ---119	      IT	                  Manager	       9000
         ---117	     Legal	                Manager	             9000
          ---36	       HR	                  Engineer	       9000
           ---22	    Sales	                  Manager	       9000
           ---196     	Legal	              Engineer	             9000
              --226	     Sales	             Manager	       9000
---age group customers
select age_category, count(*) as total_cust from emp_data_cleaned
GROUP by age_category
order by total_cust desc;
--insights
--age_category	    total_cust
--Middle_Age(41-50)	   25721
--Senior(51-60)	       25713
--Adult(31-40)	       25535
--Young(22-30)	       23031

--experience analysis
SELECT 
    ROUND(AVG(Years_At_Company),2) AS avg_experience
FROM emp_data_cleaned;--avg experience is 4.48
--performance score analysis
SELECT 
    Performance_Score,
    COUNT(*) AS total
FROM emp_data_cleaned
GROUP BY Performance_Score
ORDER BY Performance_Score DESC;
--Performance_Score	   total
       --5	           19928
      --4	             19940
      --3	             19999
      --2	             20013
     --1	             20120

--Best Performing Departments
select department, round(avg(performance_score),2) as avg_performance_score from emp_data_cleaned
group by department
order by avg_performance_score desc;
--department	           avg_performance_score
 --Engineering	             3.02
--Operations	               3.01
--HR	                       3
--IT	                       3
--Customer Support	         3
---Sales	                   2.99
--Finance	                   2.98
--Marketing	                 2.98
--Legal	                     2.98

--Employee Satisfaction Analysis = 3
SELECT 
    ROUND(AVG(Employee_Satisfaction_Score),2) AS avg_satisfaction
FROM emp_data_cleaned;

--Department Wise Satisfaction
SELECT 
    Department,
    ROUND(AVG(Employee_Satisfaction_Score),2) AS avg_satisfaction
FROM emp_data_cleaned
GROUP BY Department
ORDER BY avg_satisfaction DESC;   
--Department	avg_satisfaction
--Operations	          3.03
--IT	                      3.02
--HR	                      3
--Engineering	          3
--Finance	                3
--Sales	                2.99
--Legal	                2.99
--Marketing	                2.99
--Customer Support	    2.97

--Resigned Employees Count
SELECT 
    Resigned,
    COUNT(*) AS total
FROM emp_data_cleaned
GROUP BY Resigned;---Resigned	total
                      --false	89990
                      --true	10010
--resgined rate = 10.01
SELECT 
    ROUND(
        SUM(CASE WHEN Resigned = 'true' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2) AS resgine_rate_percentage    
FROM emp_data_cleaned;

---department wise resigned
select department, sum(case when resigned = 'true' then 1 else 0 end) as resigned_emp from emp_data_cleaned
group by department
order by resigned_emp desc;
--department	resigned_emp
--Finance	       1180
--Legal	       1136
--HR	             1125
--Marketing	       1125
--Operations	 1121
--Sales	       1104
--Customer Suppor  1098
--IT	             1064
--Engineering	 1057

--Overtime Analysis
SELECT 
    ROUND(AVG(Overtime_Hours),2) AS avg_overtime
FROM emp_data_cleaned;-- avg over time = 14.51
--Overtime vs Resignation
SELECT 
    Resigned,
    ROUND(AVG(Overtime_Hours),2) AS avg_overtime
FROM emp_data_cleaned
GROUP BY Resigned;
--Resigned	avg_overtime
    --false	14.51
    --true	14.58

--Work Mode Analysis
SELECT 
    Remote_Work_Frequency,
    COUNT(*) AS total
FROM emp_data_cleaned
GROUP BY Remote_Work_Frequency
ORDER BY total DESC;
--Remote_Work_Frequency	total
                  --25	20235
                  --75	20173
                  --100	20049
                    --0	19837
                   --50	19706
--Promotions Analysis
SELECT 
    Promotions,
    COUNT(*) AS total_employees
FROM emp_data_cleaned
GROUP BY Promotions
ORDER BY Promotions DESC;
--Promotions	total_employees
         --2	33268
         --1	33436
         --0	33296
--Education Level Analysis
SELECT 
    Education_Level,
    COUNT(*) AS total
FROM emp_data_cleaned
GROUP BY Education_Level
ORDER BY total DESC;
--Education_Level	 total
--Bachelor	       50041
--High School	     30004
--Master	         14904
--PhD	             5051
--Hiring Trend by Year
SELECT 
    YEAR(Hire_Date) AS hire_year,
    COUNT(*) AS total_hires
FROM emp_data_cleaned
GROUP BY YEAR(Hire_Date)
ORDER BY hire_year;
-- the highest employiees hire in the year 2014

--Hiring Trend by Month
SELECT 
    date_format(Hire_Date, 'MMMM') AS hire_month,
    COUNT(*) AS total_hires
FROM emp_data_cleaned
GROUP BY hire_month
ORDER BY total_hires desc;---highst total hires in october 8662

--High overtime employees top 5
SELECT 
    Employee_ID,
    Overtime_Hours,
    Performance_Score,
    Employee_Satisfaction_Score
FROM emp_data_cleaned
ORDER BY Overtime_Hours DESC
LIMIT 5;



                                  
