# Employee_Analysis-SQL-Databricks

# 📊 Employee HR Analytics

## 🎯 Project Overview
Comprehensive HR analytics project analyzing 100,000 employee records to uncover workforce trends, performance patterns, salary distributions, and attrition insights. This project demonstrates end-to-end data analysis using SQL on Databricks platform.

## 📁 Dataset Information
**Total Records:** 100,000 employees  
**Source:** `saswat.hr.emp_data`  
**Time Period:** 2010-2024  
**Key Metrics:** Salary, Performance, Satisfaction, Attrition, Work Hours, Projects, Training

## 🗂️ Dataset Schema

| Column Name | Data Type | Description |
|------------|-----------|-------------|
| Employee_ID | INT | Unique employee identifier |
| Department | STRING | Employee department |
| Job_Title | STRING | Employee job role |
| Gender | STRING | Male/Female/Other |
| Age | INT | Employee age (22-60) |
| Hire_Date | DATE | Date of joining |
| Years_At_Company | INT | Tenure in years |
| Education_Level | STRING | Highest education |
| Performance_Score | INT | Rating 1-5 |
| Monthly_Salary | DECIMAL | Monthly compensation |
| Work_Hours_Per_Week | INT | Weekly working hours |
| Projects_Handled | INT | Number of projects |
| Overtime_Hours | DECIMAL | Monthly overtime |
| Sick_Days | INT | Annual sick leaves |
| Remote_Work_Frequency | INT | % remote work |
| Employee_Satisfaction_Score | INT | Rating 1-5 |
| Resigned | BOOLEAN | Attrition status |
| Promotions | INT | Number of promotions |
| Training_Hours | DECIMAL | Training hours |
| Team_Size | INT | Team members |

---

## 🧹 Data Cleaning Process

### ✅ Quality Checks Performed
1. **Null Value Detection**
   - All 20 columns checked for null values
   - ✅ Result: **Zero null values found**

2. **Duplicate Detection**
   - Checked Employee_ID for duplicates
   - ✅ Result: **No duplicates found**

3. **Data Validation**
   - ✅ Age range validation (22-60 years) - All valid
   - ✅ Hire date validation - No future dates
   - ✅ Negative value check - No negative values
   - ✅ Department and gender consistency verified

4. **Feature Engineering**
   - Created `age_category` column:
     - Young (22-30)
     - Adult (31-40)
     - Middle_Age (41-50)
     - Senior (51-60)

### 📊 Cleaned Dataset
**Table:** `emp_data_cleaned`  
**Status:** ✅ Production-ready  
**Records:** 100,000

---

## 📈 Key Findings & Insights

### 👥 Workforce Demographics

#### **Gender Distribution**
| Gender | Count | Percentage |
|--------|-------|------------|
| Male | 48,031 | 48.03% |
| Female | 48,001 | 48.00% |
| Other | 3,968 | 3.97% |

**Insight:** Nearly equal gender distribution showing inclusive hiring practices.

#### **Age Distribution**
| Age Category | Count | Percentage |
|--------------|-------|------------|
| Middle Age (41-50) | 25,721 | 25.72% |
| Senior (51-60) | 25,713 | 25.71% |
| Adult (31-40) | 25,535 | 25.54% |
| Young (22-30) | 23,031 | 23.03% |

**Insight:** Experienced workforce with 51% employees above 40 years.

---

### 🏢 Department Analysis

#### **Employee Distribution by Department**
| Department | Employee Count |
|------------|---------------|
| Marketing | 11,216 |
| Finance | 11,200 |
| Operations | 11,181 |
| IT | 11,131 |
| Sales | 11,122 |
| Legal | 11,118 |
| Customer Support | 11,116 |
| HR | 10,960 |
| Engineering | 10,956 |

**Insight:** Well-balanced department distribution (~11K per department).

#### **Average Salary by Department**
| Department | Avg Salary ($) |
|------------|---------------|
| Engineering | 6,417.25 |
| IT | 6,414.60 |
| Sales | 6,413.15 |
| Operations | 6,412.31 |
| Customer Support | 6,403.88 |
| HR | 6,400.36 |
| Finance | 6,398.58 |
| Legal | 6,391.28 |
| Marketing | 6,377.86 |

**Overall Average Salary:** $6,403.21/month

**Insight:** Engineering and IT departments command highest salaries, while Marketing has the lowest average.

---

### 💼 Job Title Analysis

| Job Title | Employee Count |
|-----------|---------------|
| Specialist | 14,507 |
| Manager | 14,325 |
| Technician | 14,285 |
| Analyst | 14,261 |
| Engineer | 14,217 |
| Consultant | 14,210 |
| Developer | 14,195 |

**Insight:** Fairly equal distribution across job titles indicating organizational balance.

---

### 🏆 Performance Analysis

#### **Performance Score Distribution**
| Score | Count | Percentage |
|-------|-------|------------|
| 5 (Excellent) | 19,928 | 19.93% |
| 4 (Good) | 19,940 | 19.94% |
| 3 (Average) | 19,999 | 20.00% |
| 2 (Below Avg) | 20,013 | 20.01% |
| 1 (Poor) | 20,120 | 20.12% |

**Insight:** Uniform distribution suggests balanced performance evaluation system.

#### **Best Performing Departments**
| Department | Avg Performance Score |
|------------|----------------------|
| Engineering | 3.02 |
| Operations | 3.01 |
| HR | 3.00 |
| IT | 3.00 |
| Customer Support | 3.00 |

---

### 😊 Employee Satisfaction

**Overall Satisfaction Score:** 3.0/5

#### **Department-wise Satisfaction**
| Department | Satisfaction Score |
|------------|-------------------|
| Operations | 3.03 |
| IT | 3.02 |
| HR | 3.00 |
| Engineering | 3.00 |
| Finance | 3.00 |

**Insight:** Moderate satisfaction levels across all departments (3/5 average).

---

### 🚪 Attrition Analysis

#### **Overall Attrition**
- **Resigned Employees:** 10,010
- **Active Employees:** 89,990
- **Attrition Rate:** 10.01%

#### **Department-wise Attrition**
| Department | Resigned Count |
|------------|---------------|
| Finance | 1,180 |
| Legal | 1,136 |
| HR | 1,125 |
| Marketing | 1,125 |
| Operations | 1,121 |
| Sales | 1,104 |
| Customer Support | 1,098 |
| IT | 1,064 |
| Engineering | 1,057 |

**Insight:** Finance has highest attrition; Engineering and IT have lowest turnover.

---

### ⏰ Overtime Analysis

**Average Overtime:** 14.51 hours/month

#### **Overtime vs Resignation**
| Status | Avg Overtime (hrs) |
|--------|-------------------|
| Active | 14.51 |
| Resigned | 14.58 |

**Insight:** Minimal difference in overtime between active and resigned employees.

---

### 🏠 Remote Work Analysis

| Remote Work % | Employee Count |
|--------------|---------------|
| 25% | 20,235 |
| 75% | 20,173 |
| 100% (Full Remote) | 20,049 |
| 0% (Office) | 19,837 |
| 50% (Hybrid) | 19,706 |

**Insight:** Diverse work arrangement options with nearly equal distribution.

---

### 📚 Education Level

| Education | Count | Percentage |
|-----------|-------|------------|
| Bachelor | 50,041 | 50.04% |
| High School | 30,004 | 30.00% |
| Master | 14,904 | 14.90% |
| PhD | 5,051 | 5.05% |

**Insight:** 50% workforce holds Bachelor's degree; 20% have advanced degrees.

---

### 📈 Promotions

| Promotions | Employee Count |
|-----------|---------------|
| 0 | 33,296 |
| 1 | 33,436 |
| 2 | 33,268 |

**Average Experience:** 4.48 years

**Insight:** Balanced promotion opportunities with ~33% receiving 1-2 promotions.

---

### 📅 Hiring Trends

#### **Peak Hiring Year:** 2014
#### **Peak Hiring Month:** October (8,662 hires)

**Insight:** Seasonal hiring pattern with Q4 focus.

---

### 💰 Top 10 Highest Paid Employees

| Employee ID | Department | Job Title | Salary ($) |
|-------------|------------|-----------|------------|
| 184 | Customer Support | Manager | 9,000 |
| 138 | Customer Support | Manager | 9,000 |
| 40 | HR | Engineer | 9,000 |
| 219 | Engineering | Engineer | 9,000 |
| 119 | IT | Manager | 9,000 |
| 117 | Legal | Manager | 9,000 |
| 36 | HR | Engineer | 9,000 |
| 22 | Sales | Manager | 9,000 |
| 196 | Legal | Engineer | 9,000 |
| 226 | Sales | Manager | 9,000 |

---

## 🛠️ Technologies Used

- **Platform:** Databricks (AWS)
- **Language:** SQL (Databricks SQL)
- **Compute:** Serverless SQL Warehouse (Photon Enabled)
- **Database:** Unity Catalog (`saswat.hr`)
- **Dataset:** 100K employee records

---

## 📊 Analysis Categories

1. ✅ **Data Quality & Cleaning**
   - Null checks
   - Duplicate detection
   - Data validation
   - Feature engineering

2. 📈 **Descriptive Analytics**
   - Workforce demographics
   - Department distribution
   - Salary analysis
   - Job title breakdown

3. 🎯 **Performance Metrics**
   - Performance score analysis
   - Department-wise performance
   - Satisfaction scores

4. 🚪 **Attrition Analysis**
   - Overall turnover rate
   - Department-wise attrition
   - Overtime correlation

5. 📅 **Temporal Analysis**
   - Hiring trends by year
   - Hiring trends by month
   - Tenure analysis

6. 🎓 **Professional Development**
   - Education levels
   - Promotion patterns
   - Training hours

---

## 🔍 Business Recommendations

### 1. **Address Finance Department Attrition**
- Finance has highest turnover (1,180 employees)
- Recommendation: Conduct stay interviews and improve compensation/benefits

### 2. **Leverage Low IT/Engineering Turnover**
- IT (1,064) and Engineering (1,057) have lowest attrition
- Recommendation: Document and replicate their retention strategies

### 3. **Improve Marketing Salaries**
- Marketing has lowest average salary ($6,377.86)
- Recommendation: Salary benchmarking against industry standards

### 4. **Balance Age Distribution**
- 51% workforce above 40 years
- Recommendation: Succession planning and knowledge transfer programs

### 5. **Optimize Hiring Cycles**
- Peak hiring in October
- Recommendation: Plan Q4 onboarding resources in advance

### 6. **Boost Employee Satisfaction**
- Average satisfaction is 3/5
- Recommendation: Employee engagement initiatives and feedback programs

---

## 📁 Project Structure

```
employee-hr-analytics/
│
├── data/
│   ├── emp_data (raw)
│   └── emp_data_cleaned (processed)
│
├── sql/
│   ├── 01_data_cleaning.sql
│   ├── 02_descriptive_analysis.sql
│   ├── 03_performance_analysis.sql
│   ├── 04_attrition_analysis.sql
│   └── 05_advanced_insights.sql
│
└── README.md
```

---

## 🚀 How to Use

### Prerequisites
- Databricks workspace access
- SQL warehouse (Serverless or Pro)
- Unity Catalog enabled

### Setup Instructions

1. **Create catalog and schema:**
```sql
CREATE CATALOG IF NOT EXISTS saswat;
USE CATALOG saswat;
CREATE SCHEMA IF NOT EXISTS hr;
USE SCHEMA hr;
```

2. **Load data:**
```sql
-- Import your employee dataset to emp_data table
CREATE OR REPLACE TABLE emp_data AS
SELECT * FROM your_source_data;
```

3. **Run cleaning script:**
```sql
-- Execute data cleaning queries (statements 1-31)
CREATE OR REPLACE TABLE emp_data_cleaned AS 
SELECT * FROM emp_data;

-- Add age_category
ALTER TABLE emp_data_cleaned ADD COLUMN age_category STRING;
UPDATE emp_data_cleaned 
SET age_category = CASE 
    WHEN age BETWEEN 22 AND 30 THEN 'Young(22-30)'
    WHEN age BETWEEN 31 AND 40 THEN 'Adult(31-40)'
    WHEN age BETWEEN 41 AND 50 THEN 'Middle_Age(41-50)'
    WHEN age BETWEEN 51 AND 60 THEN 'Senior(51-60)'
END;
```

4. **Run analysis queries:**
```sql
-- Execute analysis queries (statements 32-58)
-- All queries provided in employee_hr_analytics.sql file
```

---

## 📊 Sample Queries

### Get Department-wise Attrition Rate
```sql
SELECT 
    department,
    SUM(CASE WHEN resigned = 'true' THEN 1 ELSE 0 END) AS resigned_count,
    COUNT(*) AS total_employees,
    ROUND(SUM(CASE WHEN resigned = 'true' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM emp_data_cleaned
GROUP BY department
ORDER BY attrition_rate DESC;
```

### Get High Performers with Low Satisfaction
```sql
SELECT 
    Employee_ID,
    Department,
    Performance_Score,
    Employee_Satisfaction_Score,
    Monthly_Salary
FROM emp_data_cleaned
WHERE Performance_Score >= 4 
  AND Employee_Satisfaction_Score <= 2
ORDER BY Performance_Score DESC;
```

---

## 📈 Visualizations

*Recommended dashboards:*

1. **Workforce Overview Dashboard**
   - Total employees by department
   - Gender and age distribution
   - Headcount trends over time

2. **Compensation Analysis Dashboard**
   - Salary distribution by department
   - Salary vs experience correlation
   - Top earners by role

3. **Attrition Dashboard**
   - Attrition rate by department
   - Resignation trends over time
   - Risk factors (satisfaction, overtime)

4. **Performance Dashboard**
   - Performance score distribution
   - Department-wise performance
   - Performance vs satisfaction correlation

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

## 📧 Contact

**Project Maintainer:** [Your Name]  
**Email:** [Your Email]  
**LinkedIn:** [Your LinkedIn]  
**GitHub:** [Your GitHub]

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

## 🙏 Acknowledgments

- Dataset source: [Specify source if applicable]
- Built on Databricks platform
- SQL analytics and data cleaning methodologies

---

## 📌 Project Status

✅ **Status:** Complete  
📅 **Last Updated:** May 2026  
🔄 **Version:** 1.0

---

### ⭐ If you found this project helpful, please give it a star!

---

**Happy Analyzing! 📊✨**
