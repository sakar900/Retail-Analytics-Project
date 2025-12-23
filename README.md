# Retail-Analytics-Project
End-to-end retail analytics project using SQL, Python, and BI tools

# 🛒 End-to-End Retail Analytics Project

## 📌 Project Overview
This project demonstrates an end-to-end retail analytics solution built to simulate real-world business decision-making in a consumer retail environment. The analysis spans from raw transactional data to business-ready insights and dashboards, focusing on revenue growth, customer behavior, profitability, and retention.

The goal of this project is not just technical analysis, but translating data into **actionable business recommendations** for stakeholders.

---

## 🎯 Business Objectives
Retail leadership teams require timely and accurate insights to:
- Monitor revenue growth and demand trends
- Understand seasonality and regional performance
- Identify high-value and at-risk customers
- Optimize discounts and improve profitability
- Enable data-driven decision-making through self-serve dashboards

This project addresses these objectives using SQL, Python, and BI tools.

---

## 📂 Dataset
- **Source:** Global Superstore Dataset (Kaggle)
- **Type:** Public, synthetic retail dataset used for educational and portfolio purposes
- **Data Coverage:**
  - Orders (Order ID, Order Date, Quantity)
  - Customers (Customer ID, Segment, Region)
  - Products (Category, Sub-Category, Product Name)
  - Financials (Sales, Profit, Discount)

The dataset closely mirrors real-world retail transaction data, making it suitable for end-to-end analytics use cases.

---

## 🛠️ Tools & Technologies
- **SQL (Advanced):** CTEs, window functions, rolling metrics, YoY/MoM growth
- **Python:** Pandas, Matplotlib for exploratory data analysis (EDA)
- **Power BI / Tableau:** Interactive dashboards for business users
- **Excel:** Supporting analysis and validation
- **GitHub:** Version control and project documentation

---

## 🔍 Key Analysis Performed

### 1️⃣ Demand Trends & Seasonality
- Year-over-Year (YoY) and Month-over-Month (MoM) revenue growth
- Rolling 3-month averages to smooth seasonal fluctuations
- Identification of peak and low-demand periods

### 2️⃣ Regional Performance
- Revenue and profitability comparison across regions
- Margin analysis to identify underperforming regions

### 3️⃣ Key Business Metrics
- Total revenue and revenue growth
- Order contribution and Average Order Value (AOV)
- Customer retention indicators (repeat purchase behavior)

### 4️⃣ Customer Lifetime Value (CLV) Framework
- Calculated CLV using purchase frequency and average order value
- Segmented customers into:
  - **High-Value**
  - **At-Risk**
  - **Low-Value**
- Simulated real-world retention and incentive targeting use cases

### 5️⃣ Profitability & Discount Impact Analysis
- Analyzed the impact of discounts on revenue and margins
- Identified margin leakages across product categories and sub-categories
- Highlighted optimization opportunities for pricing and promotions

---

## 📊 Dashboards & Reporting
Interactive dashboards were developed using **Power BI and Tableau** to enable:
- Executive-level KPI monitoring
- Regional and category-level drilldowns
- Customer segmentation and profitability insights
- Self-serve exploration for business stakeholders

> Dashboard screenshots are included in the `dashboards/` folder.

---

## 💡 Key Insights
- A small percentage of products and customers contribute disproportionately to total revenue
- Certain discount levels negatively impact margins without meaningful revenue uplift
- High-value customers exhibit strong repeat behavior and higher average order values
- Clear seasonal patterns suggest the need for proactive inventory and marketing planning

---

## 📈 Business Recommendations
- Focus retention and loyalty programs on high-value and at-risk customers
- Optimize discount strategies to reduce margin leakage
- Prioritize inventory and marketing investments during peak demand periods
- Use regional performance insights to tailor localized strategies

---

## 🔮 Future Enhancements
- Incorporate cost data for deeper profit analysis
- Predictive sales forecasting using time-series models
- Cohort-based retention and churn analysis
- Marketing campaign effectiveness measurement


## ✅ Disclaimer
This project is for learning and portfolio demonstration purposes. While the dataset is synthetic, the analytical approach, KPIs, and decision frameworks reflect real-world retail analytics practices.
