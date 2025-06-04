# ecommerce-sales-analysis
This project analyzes customer behavior and product performance using e-commerce transaction data from October 2019. It combines **SQL** for data manipulation and analysis, and **Tableau** for interactive dashboard visualization.

---

## 📦 Dataset

- **Source:** Kaggle – E-Commerce Behavior Data  
- **Timeframe:** October 2019  
- **Records:** Over 4 million events, including views, cart additions, and purchases.

---

## 🔍 Objectives

- Analyze customer behavior patterns based on event types.
- Identify top-performing product categories and individual products.
- Explore trends in user sessions, revenue, and purchase timing.
- Create a visual dashboard to help stakeholders interpret business insights.

---

## 🛠️ Tools Used

- **MySQL Workbench**: Data cleaning, transformation, and querying  
- **Tableau**: Dashboard creation and data storytelling  
- **GitHub**: Version control and code storage

---

## 🧹 Data Cleaning

- Handled missing values strategically:
  - Replaced `NULL` in `category_code` with `"N/A"` to preserve rows for broader analysis.
- Converted and formatted timestamps (`event_time`) to match MySQL’s DATETIME standard.
- Removed inconsistent or duplicate entries where necessary.

---

## 📈 Key Analyses

- **Top Viewed Categories**: Electronics and uncategorized items received the most views.
- **Revenue Analysis**: Smartphones alone generated over $3.8M in revenue.
- **User Behavior**: Most user actions were "view" events, with lower conversion into purchases.
- **Purchase Trends**: Highlighted the most frequently purchased products and categories.
- **Session Metrics**: Tracked user sessions and unique visitors.

---

## 📊 Tableau Dashboard

An interactive dashboard was created to visualize:
- Revenue by category
- Purchase frequency by product
- Views by event type
- Average price by product category

🔗 **[View Tableau Dashboard Here]([your-tableau-dashboard-link](https://public.tableau.com/app/profile/joyce.oruitemeka/viz/Ecommerce_17490145145870/main))**

---
## 📄 SQL Files

All SQL queries used for cleaning, aggregation, and analysis are available in the 'ecommerce-sales-analysis' repo.

🔗 **[View SQL File]([your-sql-file-link](https://github.com/joycetoruitemeka/ecommerce-sales-analysis/blob/main/transactions_october%20(Analyzed).sql))**

---

## ✨ Summary

This project demonstrates how structured SQL queries and compelling visual dashboards can turn raw transactional data into business insights that drive smarter decision-making.
