Hospitality Analytics Dashboard
Welcome to the Hospitality Analytics project! This repository showcases a comprehensive data analysis pipeline for hotel bookings, revenue performance, and customer behaviour using SQL, Power BI, and Tableau. 

Overview
This project analyzes hotel booking data to generate actionable insights across multiple dimensions such as revenue, occupancy, ratings, and booking platforms. It includes:
•	SQL scripts for KPI generation and revenue segmentation
•	Power BI dashboard for interactive exploration
•	Tableau dashboard for visual storytelling

Objectives
•	Track key performance indicators (KPIs) like total revenue, occupancy rate, and average daily rate
•	Segment revenue by city, room class, and booking status
•	Identify high-performing hotels and cities
•	Visualize customer ratings and booking trends
•	Enable dynamic filtering by room category, platform, and city

Data Sources
•	fact_bookings: Transactional booking data
•	fact_aggregated_bookings: Aggregated booking metrics
•	dim_hotels: Hotel metadata (name, city)
•	dim_rooms: Room category details

SQL Scripts
The SQL scripts include:
•	KPI Summary View: Total revenue, bookings, occupancy rate
•	Average Daily Rate: Revenue per booking across cities
•	Revenue by Room Class: Sorted by performance
•	Weekly Revenue Procedure: Callable with property ID and week number
•	Revenue by Booking Status: Cancelled, Checked Out, No Show
•	Above-Average Revenue Cities: Using subqueries
•	Hotel Revenue Categorization: High, Medium, Low based on thresholds


Power BI Dashboard
Features:
•	Filters: Room category, booking platform, city
•	KPIs: Revenue (2bn), successful bookings (135K), occupancy (57.87%), average rating (3.62)
•	Charts: 
o	Monthly revenue trends
o	No-show bookings by day type
o	Revenue by city and booking status
o	Ratings by room category
 
Tableau Dashboard
Features:
•	Revenue breakdown by city and booking status
•	Monthly and yearly revenue trends
•	Ratings by platform (bubble chart)
•	Revenue vs rating correlation (scatter plot)
•	Sidebar filters for hotel properties and booking platforms
 
 How to Use
1.	Clone the repository:
git clone https://github.com/your-username/hospitality-analytics.git
2.	Load SQL scripts into your database (e.g., MySQL/PostgreSQL)
3.	Open Power BI and Tableau dashboards using respective files
4.	Connect to your data source or use sample data provided

 Insights & Highlights
•	Mumbai leads in revenue generation (785M)
•	RT4 room category has the highest rating share (25.4%)
•	Checked Out bookings contribute the most to revenue (1.4bn)
•	Weekday no-shows are more frequent than weekends

Contact
For questions or collaboration, feel free to reach out via GitHub Issues or email


